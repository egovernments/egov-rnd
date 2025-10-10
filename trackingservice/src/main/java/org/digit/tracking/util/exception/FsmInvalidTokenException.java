package org.digit.tracking.util.exception;

//Exception to handle issues related to invalid token while communicating with FSM
public class FsmInvalidTokenException extends RuntimeException {
    public FsmInvalidTokenException() {
        super();
    }
    public FsmInvalidTokenException(String message) {
        super(message);
    }
}