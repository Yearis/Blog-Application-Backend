package com.yearis.blog_application.payload.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class PostRequest {

    @NotBlank(message = "Title cannot be empty")
    @Size(min = 3, max = 50, message = "Title must be between 3 and 50 characters")
    private String title;

    @NotBlank(message = "Content cannot be empty")
    @Size(min = 5, max = 500)
    private String content;

}
