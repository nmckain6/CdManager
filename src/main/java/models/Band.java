package models;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import java.util.ArrayList;
import javax.persistence.Entity;

@Entity
public class Band {

    @Id
    @GeneratedValue
    private Long id;

    //need albums?
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
        return id;
    }

}
