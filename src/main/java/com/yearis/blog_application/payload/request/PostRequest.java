package com.yearis.blog_application.payload.request;

import io.swagger.v3.oas.annotations.media.Schema;
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
    @Schema(
            description = "The main body of the post. Supports multiple lines.",
            example = """
            This is the first paragraph.
            
            This is the second paragraph after a newline.
            """,
            format = "text"
    )
    private String content;

}
