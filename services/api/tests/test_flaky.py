import time

def test_flaky_time_based():
    # Passes only roughly half the time depending on parity of seconds.
    # Agents should make this deterministic.
    sec = int(time.time()) % 2
    assert sec == 0, f"Flaked due to odd second: {sec}"
