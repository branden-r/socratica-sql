from psycopg2 import connect  # type: ignore
from time import time
from typing import Callable, Final, TextIO

# Question 24: Let n be a positive integer.
# Suppose you have the following options for inserting n rows of data:
#   Perform a single query that inserts n rows.
#   Perform n queries, where each query inserts one row.
# Which option is faster?

num_rows: Final[int] = 10_000  # this is n
sql_insert: Final[str] = "INSERT INTO posts (user_id, post_text) VALUES"
sql_values: Final[str] = "(1, 'I sure do like eatin'' bugs!!')"
single_row_query: Final[str] = f"{sql_insert} {sql_values};"
multirow_query: Final[str] = (
    sql_insert + ((sql_values + ", ") * num_rows).rstrip(", ") + ";"
)


# returns the time it takes for a single query that inserts n rows to execute
def time_multirow_query(connection, cursor) -> float:
    start: Final[float] = time()
    cursor.execute(multirow_query)  # execute the query
    connection.commit()  # commit our changes
    stop: Final[float] = time()
    return stop - start


# returns the time it takes for n queries that insert one row each to execute
# uses a range
def time_single_row_query_w_range(connection, cursor) -> float:
    start: Final[float] = time()
    _: int
    for _ in range(num_rows):
        cursor.execute(single_row_query)  # execute the query n times
    connection.commit()  # commit our changes
    stop: Final[float] = time()
    return stop - start


# returns the time it takes for n queries that insert one row each to execute
# uses a list
def time_single_row_query_w_list(connection, cursor) -> float:
    start: float
    stop: float

    def record_start() -> None:
        nonlocal start
        start = time()

    def record_stop() -> None:
        nonlocal stop
        stop = time()

    commands: list[Callable[[], None]] = (
        [record_start]  # record the start time
        + (
            [lambda: cursor.execute(single_row_query)] * num_rows
        )  # execute a single row query n times
        + [
            lambda: connection.commit(),
            record_stop,
        ]  # commit our changes, then record the stop time
    )
    command: Callable[[], None]
    for command in commands:
        command()  # execute every command we made in the order we made them
    return stop - start


def main() -> None:
    file: TextIO
    with open("password.txt") as file:
        password: Final[str] = file.read()  # get our password
    with connect(
        f"dbname=socratica user=postgres password={password}"
    ) as connection:  # connect to the database
        with connection.cursor() as cursor:
            # run our tests and display the results
            print(
                f"Query with {num_rows:,} rows of values executed once: {time_multirow_query(connection, cursor)}s"
            )
            print(
                f"Query with one row of values executed {num_rows:,} times using a range: {time_single_row_query_w_range(connection, cursor)}s"
            )
            print(
                f"Query with one row of values executed {num_rows:,} times using a list: {time_single_row_query_w_list(connection, cursor)}s"
            )


if __name__ == "__main__":
    main()
