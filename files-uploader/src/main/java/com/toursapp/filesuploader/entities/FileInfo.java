package com.toursapp.filesuploader.entities;

import com.toursapp.filesuploader.entities.Enums.FileType;
import lombok.*;

import javax.persistence.*;
import java.sql.Date;

@Entity
@Getter
@Setter
@ToString
@RequiredArgsConstructor
public class FileInfo {
    @Id
    private String id;

    private String extension;

    private Integer user_id;

    private Date date_added;

    @Enumerated(EnumType.STRING)
    private FileType type;
}
