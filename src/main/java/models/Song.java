package models;

import javax.persistence.GeneratedValue;
import javax.persistence.Id;

public class Song {
    @Id
    @GeneratedValue
    private Long id;

    private String songTitle;
    private short trackNumber;
    private short trackLength;
    private String trackPath;

    /*
     * Default constructor; Necessary for Hibernate
     */
    public Song() {

    }

    public Song(String songTitle, short trackNumber, short trackLength, String trackPath) {
        this.songTitle = songTitle;
        this.trackNumber = trackNumber;
        this.trackLength = trackLength;
        this.trackPath = trackPath;
    }

    public Long getSongId() {
        return id;
    }

    public String getSongTitle() {
        return songTitle;
    }

    public void setSongTitle(String songTitle) {
        this.songTitle = songTitle;
    }

    public short getTrackNumber() {
        return trackNumber;
    }

    public void setTrackNumber(short trackNumber) {
        this.trackNumber = trackNumber;
    }

    public short getTrackLength() {
        return trackLength;
    }

    public void setTrackLength(short trackLength) {
        this.trackLength = trackLength;
    }

    public String getTrackPath() {
        return trackPath;
    }

    public void setTrackPath(String trackPath) {
        this.trackPath = trackPath;
    }

}
