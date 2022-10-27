package com.toursapp.filesuploader.repositories;

import com.toursapp.filesuploader.entities.Enums.FileType;
import com.toursapp.filesuploader.entities.FileInfo;
import org.springframework.data.repository.CrudRepository;

public interface FileRepository extends CrudRepository<FileInfo, String> {
    Iterable<FileInfo> findByUserIdAndType(String user_id, FileType type);
}
