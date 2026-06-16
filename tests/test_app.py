from app import hello

def test_hello_returns_expected_message():
    assert hello() == "Hello from secure pipeline"
