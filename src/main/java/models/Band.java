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

    private ArrayList<Album> albums;
    private String bandName;

    /*
     * Default constructor; Necessary for Hibernate
     */
    public Band() {

    }

    public ArrayList<Album> getAlbums() {
        return albums;
    }

    public void setAlbums(ArrayList<String> musicians) {
        this.albums = albums;
    }

    public String getBandName() {
        return bandName;
    }

    public void setBandName(String bandName) {
        this.bandName = bandName;
    }

    public Long getBandId() {
        return id;
    }

}
