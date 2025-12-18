package com.yearis.blog_application.service;

import com.yearis.blog_application.payload.request.PasswordChangeRequest;
import com.yearis.blog_application.payload.request.UserUpdateRequest;

public interface UserService {

    String updateUsername(UserUpdateRequest userUpdateRequest);

    String updateEmail(UserUpdateRequest userUpdateRequest);

    String updatePassword(PasswordChangeRequest passwordChangeRequest);
}
