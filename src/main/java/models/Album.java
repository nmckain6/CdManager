package models;

import java.util.ArrayList;

public class Album {
    private int albumId;
    private String albumTitle;
    private short albumYear;
    private Band band;
    private ArrayList<String> genres;
    
    /*
     * Default constructor; Necessary for Hibernate
     */
    public Album(){
        
    }
    
    public Album(String albumTitle, short albumYear, Band band, ArrayList<String> genres){
        this.albumTitle = albumTitle;
        this.albumYear = albumYear;
        this.band = band;
        this.genres = genres;
    }

    public int getAlbumId() {
        return albumId;
    }

    public String getAlbumTitle() {
        return albumTitle;
    }

    public void setAlbumTitle(String albumTitle) {
        this.albumTitle = albumTitle;
    }

    public short getAlbumYear() {
        return albumYear;
    }

    public void setAlbumYear(short albumYear) {
        this.albumYear = albumYear;
    }

    public Band getBand() {
        return band;
    }

    public void setBand(Band band) {
        this.band = band;
    }

    public ArrayList<String> getGenres() {
        return genres;
    }

    public void setGenres(ArrayList<String> genres) {
        this.genres = genres;
    }
    
    public void addGenre(String genre){
        genres.add(genre);
    }
}
