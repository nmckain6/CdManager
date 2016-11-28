package exceptions;

/**
 * Created by nm046161 on 11/24/16.
 */
public class DAOException extends RuntimeException {

    private String message;
    private Throwable cause;

    public DAOException(String message){
        this.message = message;
    }

    public DAOException(String message, Throwable cause){
        this.message = message;
        this.cause = cause;
    }
}
