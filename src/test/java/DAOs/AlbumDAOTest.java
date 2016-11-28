package java.DAOs;

import main.java.DAOs.AlbumDAO;
import java.DAOs.AlbumDAO;
import main.java.exceptions.DAOException;

import org.junit.Before;
import org.junit.Test;
import main.java.models.Album;


public class AlbumDAOTest {
    @InjectMocks
    private AlbumDAO albumDAO = new AlbumDAO();

    @Mock
    private SessionFactory sessionFactory;



    @Before
    public void setup() {

    }

    @Test(expected = DAOException.class)
    public void testUpdate_NullAlbum_DAOException() {
        albumDAO.update(null);
    }
}