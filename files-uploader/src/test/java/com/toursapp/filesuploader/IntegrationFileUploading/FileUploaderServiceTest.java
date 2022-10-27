package com.toursapp.filesuploader.IntegrationFileUploading;

import com.toursapp.filesuploader.controllers.FilesUploaderController;
import com.toursapp.filesuploader.repositories.FileRepository;
import com.toursapp.filesuploader.services.FilesUploaderService;
import com.toursapp.filesuploader.services.FilesUploaderServiceImpl;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.util.ResourceUtils;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.nio.file.Files;

import static org.mockito.Mockito.when;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

@SpringBootTest
public class FileUploaderServiceTest {
    @Mock
    private FileRepository repository;

    @InjectMocks
    private FilesUploaderService service = new FilesUploaderServiceImpl();

    @Test
    void uploadingFileTest() throws Exception {
        //when();
        service.init();
        MockMultipartFile multipartFile = new MockMultipartFile("file", "test.txt",
                "text/plain", "text".getBytes());
        service.saveImage(multipartFile, "test");
    }
}
