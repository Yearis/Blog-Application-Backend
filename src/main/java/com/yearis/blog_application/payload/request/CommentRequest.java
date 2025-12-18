package com.yearis.blog_application.payload.request;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.Data;

@Data
public class CommentRequest {

    @NotBlank(message = "Comment cannot be empty")
    @Size(max = 250, message = "Comment must be less than 250 characters")
    private String body;

    // this one can be null in case it's a parent comment
    private Long parentId;

}
