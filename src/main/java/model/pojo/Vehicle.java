package model.pojo;

public class Vehicle {
    private int id;
    private int user_id;
    private String vehicle_registration;
    private String vehicle_type;

    public Vehicle(int id, int user_id, String vehicle_registration, String vehicle_type) {
        this.id = id;
        this.user_id = user_id;
        this.vehicle_registration = vehicle_registration;
        this.vehicle_type = vehicle_type;
    }

    public Vehicle(int user_id, String vehicle_registration, String vehicle_type) {
        this.user_id = user_id;
        this.vehicle_registration = vehicle_registration;
        this.vehicle_type = vehicle_type;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getVehicle_registration() {
        return vehicle_registration;
    }

    public void setVehicle_registration(String vehicle_registration) {
        this.vehicle_registration = vehicle_registration;
    }

    public String getVehicle_type() {
        return vehicle_type;
    }

    public void setVehicle_type(String vehicle_type) {
        this.vehicle_type = vehicle_type;
    }
}
