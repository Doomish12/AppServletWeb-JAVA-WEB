package modelos;

public class ResponseData {
    private boolean success;
    private double totalPagar;

    public ResponseData(boolean success, double totalPagar) {
        this.success = success;
        this.totalPagar = totalPagar;
    }

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public double getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(double totalPagar) {
        this.totalPagar = totalPagar;
    }
}
