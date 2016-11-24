package DAOs;

import models.Album;

import org.hibernate.SessionFactory;
import org.hibernate.Session;
import org.hibernate.HibernateException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AlbumDAO {

    @Autowired
    SessionFactory sessionFactory;

    /**
     * Default constructor. Necessary for Hibernate
     */
    public AlbumDAO(){

    }

    public void update(Album album){
        Session session = sessionFactory.getCurrentSession();
        session.update(album);

    }

    public Long saveNewAlbum(Album album){
        Session session = sessionFactory.getCurrentSession();
        return (Long)session.save(album);
    }

    public void delete(Album album){
        Session session = sessionFactory.getCurrentSession();
        session.delete(album);
    }

    public void deleteById(Long id){
        Session session = sessionFactory.getCurrentSession();
        Album album = session.load(Album.class,id);
        if(null != album){
            session.delete(album);
        }
    }

    public Album getById(Long id){
        Album album = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            album = session.load(Album.class, id);

            return album;
        } catch (HibernateException hibernateException){

        }

        return album;
    }

}
