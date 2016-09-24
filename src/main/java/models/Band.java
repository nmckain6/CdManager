package models;

import java.util.ArrayList;

public class Band {
    private int bandId;
    private ArrayList<String> musicians;
    private String bandName;

    /*
     * Default constructor; Necessary for Hibernate
     */
    public Band() {

    }

    public ArrayList<String> getMusicians() {
        return musicians;
    }

    public void setMusicians(ArrayList<String> musicians) {
        this.musicians = musicians;
    }

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }

    public int getBandId() {
        return bandId;
    }

}
