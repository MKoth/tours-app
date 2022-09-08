package com.toursapp.filesuploader.IntegrationFileUploading;

import com.toursapp.filesuploader.controllers.FilesUploaderController;
import com.toursapp.filesuploader.repositories.FileRepository;
import com.toursapp.filesuploader.services.FilesUploaderService;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.orm.jpa.DataJpaTest;
import org.springframework.boot.test.autoconfigure.web.servlet.WebMvcTest;
import org.springframework.mock.web.MockMultipartFile;
import org.springframework.test.context.junit.jupiter.SpringExtension;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.web.multipart.MultipartFile;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.multipart;

@ExtendWith(SpringExtension.class)
@DataJpaTest
@WebMvcTest(FilesUploaderController.class)
public class FileUploaderControllerIntegrationTest {
    @Autowired
    private MockMvc mockMvc;

    @Test
    void uploadingFileTest() throws Exception {
        MockMultipartFile multipartFile = new MockMultipartFile("file", "test.txt",
                "text/plain", "Spring Framework".getBytes());;
        mockMvc.perform(multipart("/image/upload/1").file(multipartFile));
    }
}
