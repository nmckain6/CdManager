package DAOs;

import models.Album;
import exceptions.DAOException;

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

    /**
     * @param album - the album to be updated
     *
     * @throws {@link DAOException} when album is null
     */
    public void update(Album album){
        if(null == album){
            throw new DAOException("Album update failed; album is null");
        }
        Session session = sessionFactory.getCurrentSession();
        session.update(album);
    }

    public Long saveNewAlbum(Album album){
        if(null == album){
            throw new DAOException("Album save failed; album is null");
        }
        Session session = sessionFactory.getCurrentSession();
        return (Long)session.save(album);
    }

    public void delete(Album album){
        if(null == album){
            throw new DAOException("Album delete failed; album is null");
        }
        try {
            Session session = sessionFactory.getCurrentSession();
            session.delete(album);
        } catch (HibernateException hibernateException){
            throw new DAOException("Album delete failed", hibernateException);
        }
    }

    public void deleteById(Long id){
        if(null == id){
            throw new DAOException("Album delete failed; album id is null");
        }
        try {
            Session session = sessionFactory.getCurrentSession();
            Album album = session.load(Album.class, id);
            session.delete(album);
        } catch (HibernateException hibernateException){
            throw new DAOException("Album delete failed", hibernateException);
        }
    }

    public Album getById(Long id){
        if(null == id){
            throw new DAOException("Album retrieval failed; album id is null");
        }
        Album album = null;
        try {
            Session session = sessionFactory.getCurrentSession();
            album = session.load(Album.class, id);

            return album;
        } catch (HibernateException hibernateException){
            throw new DAOException("Album retrieval failed", hibernateException);
        }

        //return album;
    }

}
