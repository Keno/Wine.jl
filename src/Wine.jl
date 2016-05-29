module Wine
    using Gallium
    using Gallium: load, RemotePtr

    const REQ_new_process                  =  0
    const REQ_get_new_process_info         =  1
    const REQ_new_thread                   =  2
    const REQ_get_startup_info             =  3
    const REQ_init_process_done            =  4
    const REQ_init_thread                  =  5
    const REQ_terminate_process            =  6
    const REQ_terminate_thread             =  7
    const REQ_get_process_info             =  8
    const REQ_set_process_info             =  9
    const REQ_get_thread_info              = 10
    const REQ_get_thread_times             = 11
    const REQ_set_thread_info              = 12
    const REQ_get_dll_info                 = 13
    const REQ_suspend_thread               = 14
    const REQ_resume_thread                = 15
    const REQ_load_dll                     = 16
    const REQ_unload_dll                   = 17
    const REQ_queue_apc                    = 18
    const REQ_get_apc_result               = 19
    const REQ_close_handle                 = 20
    const REQ_set_handle_info              = 21
    const REQ_dup_handle                   = 22
    const REQ_open_process                 = 23
    const REQ_open_thread                  = 24
    const REQ_select                       = 25
    const REQ_create_event                 = 26
    const REQ_event_op                     = 27
    const REQ_query_event                  = 28
    const REQ_open_event                   = 29
    const REQ_create_keyed_event           = 30
    const REQ_open_keyed_event             = 31
    const REQ_create_mutex                 = 32
    const REQ_release_mutex                = 33
    const REQ_open_mutex                   = 34
    const REQ_create_semaphore             = 35
    const REQ_release_semaphore            = 36
    const REQ_query_semaphore              = 37
    const REQ_open_semaphore               = 38
    const REQ_create_file                  = 39
    const REQ_open_file_object             = 40
    const REQ_alloc_file_handle            = 41
    const REQ_get_handle_unix_name         = 42
    const REQ_get_handle_fd                = 43
    const REQ_flush                        = 44
    const REQ_lock_file                    = 45
    const REQ_unlock_file                  = 46
    const REQ_create_socket                = 47
    const REQ_accept_socket                = 48
    const REQ_accept_into_socket           = 49
    const REQ_set_socket_event             = 50
    const REQ_get_socket_event             = 51
    const REQ_get_socket_info              = 52
    const REQ_enable_socket_event          = 53
    const REQ_set_socket_deferred          = 54
    const REQ_alloc_console                = 55
    const REQ_free_console                 = 56
    const REQ_get_console_renderer_events  = 57
    const REQ_open_console                 = 58
    const REQ_get_console_wait_event       = 59
    const REQ_get_console_mode             = 60
    const REQ_set_console_mode             = 61
    const REQ_set_console_input_info       = 62
    const REQ_get_console_input_info       = 63
    const REQ_append_console_input_history = 64
    const REQ_get_console_input_history    = 65
    const REQ_create_console_output        = 66
    const REQ_set_console_output_info      = 67
    const REQ_get_console_output_info      = 68
    const REQ_write_console_input          = 69
    const REQ_read_console_input           = 70
    const REQ_write_console_output         = 71
    const REQ_fill_console_output          = 72
    const REQ_read_console_output          = 73
    const REQ_move_console_output          = 74
    const REQ_send_console_signal          = 75
    const REQ_read_directory_changes       = 76
    const REQ_read_change                  = 77
    const REQ_create_mapping               = 78
    const REQ_open_mapping                 = 79
    const REQ_get_mapping_info             = 80
    const REQ_get_mapping_committed_range  = 81
    const REQ_add_mapping_committed_range  = 82
    const REQ_create_snapshot              = 83
    const REQ_next_process                 = 84
    const REQ_next_thread                  = 85
    const REQ_wait_debug_event             = 86
    const REQ_queue_exception_event        = 87
    const REQ_get_exception_status         = 88
    const REQ_continue_debug_event         = 89
    const REQ_debug_process                = 90
    const REQ_debug_break                  = 91
    const REQ_set_debugger_kill_on_exit    = 92
    const REQ_read_process_memory          = 93
    const REQ_write_process_memory         = 94
    const REQ_create_key                   = 95
    const REQ_open_key                     = 96
    const REQ_delete_key                   = 97
    const REQ_flush_key                    = 98
    const REQ_enum_key                     = 99
    const REQ_set_key_value                = 100
    const REQ_get_key_value                = 101
    const REQ_enum_key_value               = 102
    const REQ_delete_key_value             = 103
    const REQ_load_registry                = 104
    const REQ_unload_registry              = 105
    const REQ_save_registry                = 106
    const REQ_set_registry_notification    = 107
    const REQ_create_timer                 = 108
    const REQ_open_timer                   = 109
    const REQ_set_timer                    = 110
    const REQ_cancel_timer                 = 111
    const REQ_get_timer_info               = 112
    const REQ_get_thread_context           = 113
    const REQ_set_thread_context           = 114
    const REQ_get_selector_entry           = 115
    const REQ_add_atom                     = 116
    const REQ_delete_atom                  = 117
    const REQ_find_atom                    = 118
    const REQ_get_atom_information         = 119
    const REQ_set_atom_information         = 120
    const REQ_empty_atom_table             = 121
    const REQ_init_atom_table              = 122
    const REQ_get_msg_queue                = 123
    const REQ_set_queue_fd                 = 124
    const REQ_set_queue_mask               = 125
    const REQ_get_queue_status             = 126
    const REQ_get_process_idle_event       = 128
    const REQ_send_message                 = 129
    const REQ_post_quit_message            = 130
    const REQ_send_hardware_message        = 131
    const REQ_get_message                  = 132
    const REQ_reply_message                = 133
    const REQ_accept_hardware_message      = 134
    const REQ_get_message_reply            = 135
    const REQ_set_win_timer                = 136
    const REQ_kill_win_timer               = 137
    const REQ_is_window_hung               = 138
    const REQ_get_serial_info              = 139
    const REQ_set_serial_info              = 140
    const REQ_register_async               = 141
    const REQ_cancel_async                 = 142
    const REQ_read                         = 143
    const REQ_write                        = 144
    const REQ_ioctl                        = 145
    const REQ_set_irp_result               = 146
    const REQ_get_irp_result               = 147
    const REQ_create_named_pipe            = 148
    const REQ_get_named_pipe_info          = 149
    const REQ_set_named_pipe_info          = 150
    const REQ_create_window                = 151
    const REQ_destroy_window               = 152
    const REQ_get_desktop_window           = 153
    const REQ_set_window_owner             = 154
    const REQ_get_window_info              = 155
    const REQ_set_window_info              = 156
    const REQ_set_parent                   = 157
    const REQ_get_window_parents           = 158
    const REQ_get_window_children          = 159
    const REQ_get_window_children_from_point = 160
    const REQ_get_window_tree                = 161
    const REQ_set_window_pos                 = 162
    const REQ_get_window_rectangles          = 163
    const REQ_get_window_text                = 164
    const REQ_set_window_text                = 165
    const REQ_get_windows_offset             = 166
    const REQ_get_visible_region             = 167
    const REQ_get_surface_region             = 168
    const REQ_get_window_region              = 169
    const REQ_set_window_region              = 170
    const REQ_get_update_region              = 171
    const REQ_update_window_zorder           = 172
    const REQ_redraw_window                  = 173
    const REQ_set_window_property            = 174
    const REQ_remove_window_property         = 175
    const REQ_get_window_property            = 176
    const REQ_get_window_properties          = 177
    const REQ_create_winstation              = 178
    const REQ_open_winstation                = 179
    const REQ_close_winstation               = 180
    const REQ_get_process_winstation         = 181
    const REQ_set_process_winstation         = 182
    const REQ_enum_winstation                = 183
    const REQ_create_desktop                 = 184
    const REQ_open_desktop                   = 185
    const REQ_open_input_desktop             = 186
    const REQ_close_desktop                  = 187
    const REQ_get_thread_desktop             = 188
    const REQ_set_thread_desktop             = 189
    const REQ_enum_desktop                   = 190
    const REQ_set_user_object_info           = 191
    const REQ_register_hotkey                = 192
    const REQ_unregister_hotkey              = 193
    const REQ_attach_thread_input            = 194
    const REQ_get_thread_input               = 195
    const REQ_get_last_input_time            = 196
    const REQ_get_key_state                  = 197
    const REQ_set_key_state                  = 198
    const REQ_set_foreground_window          = 199
    const REQ_set_focus_window               = 200
    const REQ_set_active_window              = 201
    const REQ_set_capture_window             = 202
    const REQ_set_caret_window               = 203
    const REQ_set_caret_info                 = 204
    const REQ_set_hook                       = 205
    const REQ_remove_hook                    = 206
    const REQ_start_hook_chain               = 207
    const REQ_finish_hook_chain              = 208
    const REQ_get_hook_info                  = 209
    const REQ_create_class                   = 210
    const REQ_destroy_class                  = 211
    const REQ_set_class_info                 = 212
    const REQ_set_clipboard_info             = 213
    const REQ_empty_clipboard                = 214
    const REQ_open_token                     = 215
    const REQ_set_global_windows             = 216
    const REQ_adjust_token_privileges        = 217
    const REQ_get_token_privileges           = 218
    const REQ_check_token_privileges         = 219
    const REQ_duplicate_token                = 220
    const REQ_access_check                   = 221
    const REQ_get_token_sid                  = 222
    const REQ_get_token_groups               = 223
    const REQ_get_token_default_dacl         = 224
    const REQ_set_token_default_dac          = 225
    const REQ_set_security_object            = 226
    const REQ_get_security_object            = 227
    const REQ_get_system_handles             = 228
    const REQ_create_mailslot                = 229
    const REQ_set_mailslot_info              = 230
    const REQ_create_directory               = 231
    const REQ_open_directory                 = 232
    const REQ_get_directory_entry            = 233
    const REQ_create_symlink                 = 234
    const REQ_open_symlink                   = 235
    const REQ_query_symlink                  = 236
    const REQ_get_object_info                = 237
    const REQ_get_object_type                = 238
    const REQ_unlink_object                  = 239
    const REQ_get_token_impersonation_level  = 240
    const REQ_allocate_locally_unique_id     = 241
    const REQ_create_device_manager          = 242
    const REQ_create_device                  = 243
    const REQ_delete_device                  = 244
    const REQ_get_next_device_request        = 245
    const REQ_make_process_system            = 246
    const REQ_get_token_statistics           = 247
    const REQ_create_completion              = 248
    const REQ_open_completion                = 249
    const REQ_add_completion                 = 250
    const REQ_remove_completion              = 251
    const REQ_query_completion               = 252
    const REQ_set_completion_info            = 253
    const REQ_add_fd_completion              = 254
    const REQ_set_fd_disp_info               = 255
    const REQ_set_fd_name_info               = 256
    const REQ_get_window_layered_info        = 257
    const REQ_set_window_layered_info        = 258
    const REQ_alloc_user_handle              = 259
    const REQ_free_user_handle               = 260
    const REQ_set_cursor                     = 261
    const REQ_update_rawinput_devices        = 262
    const REQ_get_suspend_context            = 263
    const REQ_set_suspend_context            = 264
    const REQ_create_job                     = 265
    const REQ_open_job                       = 266
    const REQ_assign_job                     = 267
    const REQ_process_in_job                 = 268
    const REQ_set_job_limits                 = 269
    const REQ_set_job_completion_port        = 270
    const REQ_terminate_job                  = 271

    immutable request_header
        req::Cint
        request_size::Cint
        reply_size::Cint
    end

    immutable init_thread_request
        header::request_header
        unix_pid::Cint
        unix_tid::Cint
        debug_level::Cint
        teb::RemotePtr{Void}
        entry::RemotePtr{Void}
        reply_fd::Cint
        wait_fd::Cint
        cpu::Cint
    end

    function load_request(vm, addr)
        req = load(vm, RemotePtr{Cint}(addr))
        @show req
        if req == REQ_init_thread
            return load(vm, RemotePtr{init_thread_request}(addr))
        else
            error("unknown request")
        end
    end


end # module
