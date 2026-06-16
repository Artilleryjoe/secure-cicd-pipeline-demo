from app import hello

def test_hello_returns_expected_message():
    """Test that hello() returns the correct string."""
    assert hello() == "Hello from secure pipeline"
