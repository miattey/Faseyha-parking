package model.pojo;

import java.util.Date;
import java.util.UUID;

public class Booking {
    private String id;
    private int customer_id;
    private int parking_spot_id;
    private Date from;
    private Date to;
    private String qrCodeFileName;

    public Booking(String id, int customer_id, int parking_spot_id, Date from, Date to, String qrCodeFileName) {
        this.id = id;
        this.customer_id = customer_id;
        this.parking_spot_id = parking_spot_id;
        this.from = from;
        this.to = to;
        this.qrCodeFileName = qrCodeFileName;
    }


    public String getId() {
        return id;
    }

    public int getParking_spot_id() {
        return parking_spot_id;
    }

    public void setParking_spot_id(int parking_spot_id) {
        this.parking_spot_id = parking_spot_id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public int getCustomer_id() {
        return customer_id;
    }

    public void setCustomer_id(int customer_id) {
        this.customer_id = customer_id;
    }

    public Date getFrom() {
        return from;
    }

    public void setFrom(Date from) {
        this.from = from;
    }

    public Date getTo() {
        return to;
    }

    public void setTo(Date to) {
        this.to = to;
    }

    public String getQrCodeFileName() {
        return qrCodeFileName;
    }

    public void setQrCodeFileName(String qrCodeFileName) {
        this.qrCodeFileName = qrCodeFileName;
    }
}
