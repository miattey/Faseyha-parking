package model.pojo;

public class ParkingSpot {
    private int id;
    private String number;
    private int vehicle_id;
    private Vehicle vehicle;

    public ParkingSpot(int id, String number, int vehicle_id) {
        this.id = id;
        this.number = number;
        this.vehicle_id = vehicle_id;
    }

    public Vehicle getVehicle() {
        return vehicle;
    }

    public void setVehicle(Vehicle vehicle) {
        this.vehicle = vehicle;
    }

    public ParkingSpot(int id, String number, Vehicle vehicle) {
        this.id = id;
        this.number = number;
        this.vehicle = vehicle;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getNumber() {
        return number;
    }

    public void setNumber(String number) {
        this.number = number;
    }

    public int getVehicle_id() {
        return vehicle_id;
    }

    public void setVehicle_id(int vehicle_id) {
        this.vehicle_id = vehicle_id;
    }
}
