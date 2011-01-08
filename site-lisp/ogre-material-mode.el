;;; ogre-material-mode.el --- mode for editing Ogre3D .material scripts

;; Copyright (C) 2010

;; Authors:    2010- Frederic De Groef
;; Maintainer: f.degroef@gmail.com
;; Created:    Feb 2010
;; Keywords:   Languages

;; THis program is free software, distributed under the 
;; DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE.
;; See COPYING.txt for details.

;;; Installation

;; Add this to your .emacs or .emacs.d/init.el :  
;;  (setq load-path (cons "path/to/ogre-material-mode/" load-path))
;;  (require 'ogre-material-mode)
;;

;;; Notes
;; This mode provides basic syntax coloring for the Ogre3D (www.ogre3d.org) 
;; material definition scripts(via font-lock).
;; Because this is regexp-based, and because everyone knows that parsing 
;; a grammar with regexp sucks, there is much room for improvement.
;;
;; Plans for the future include, in no particular order : 
;;  * Real parsing, for smart indent (can't fallback on c-mode here)
;;  * Possibility to open associated glsl/hlsl/cg shader files
;;  * Completion
;; However, this being my first attempt at extending emacs, there is currecntly 
;; no strategy to implement the afformentionned features.
;; Comments and ideas are more than welcome.


(eval-when-compile
  (require 'cc-mode))

(defconst ogre-material-version "0.1"
  "Ogre3D material scripts major mode version number")


(add-to-list 'auto-mode-alist '("\\.material\\'" . ogre-material-mode))


(let* (;; section names
       (ogre-material-section-names
        (eval-when-compile
          (regexp-opt '("material" "vertex_program" "fragment_program"
                        "vertex_program_ref" "fragment_program_ref"
                        "pass" "technique" "texture_unit" "default_params"))))
       
       ;; technique section attributes
       (ogre-material-technique-attrs
        (eval-when-compile 
			(regexp-opt '("scheme" "lod_index"
                           "shadow_caster_material" "shadow_receiver_material"
                           "gpu_vendor_rule" "gpu_device_rule"))))

       ;; pass section attributes
       (ogre-material-pass-attrs
        (eval-when-compile
          (regexp-opt '("ambient" "diffuse" "specular" "emissive"
                        "scene_blend"  "separate_scene_blend"  "scene_blend_op" 
                        "separate_scene_blend_op"  "depth_check"  "depth_write" 
                        "depth_func"  "depth_bias"  "iteration_depth_bias" 
                        "alpha_rejection"  "alpha_to_coverage"  "light_scissor" 
                        "light_clip_planes"  "illumination_stage"  "transparent_sorting" 
                        "normalise_normals"  "cull_hardware"  "cull_software" 
                        "lighting"  "shading"  "polygon_mode" 
                        "polygon_mode_overrideable"  "fog_override"  "colour_write" 
                        "max_lights"  "start_light"  "iteration" 
                        "point_size"  "point_sprites"  "point_size_attenuation" 
                        "point_size_min"  "point_size_max"))))

       ;; texture_unit section attributes
       (ogre-material-texture-unit-attrs
        (eval-when-compile
          (regexp-opt '("texture_alias"  "texture"  "anim_texture" 
                        "cubic_texture"  "tex_coord_set"  "tex_address_mode" 
                        "tex_border_colour"  "filtering"  "max_anisotropy" 
                        "mipmap_bias"  "colour_op"  "colour_op_ex" 
                        "colour_op_multipass_fallback"  "alpha_op_ex"  "env_map" 
                        "scroll"  "scroll_anim"  "rotate" 
                        "rotate_anim"  "scale"  "wave_xform" 
                        "transform"  "binding_type"  "content_type" 
                        ))))

       ;; shader declaration attrs
       (ogre-material-shader-attrs
        (eval-when-compile
          (regexp-opt '("source" "entry_point" "profiles"))))

       ;; shader default_params section
       (ogre-material-default-params
        (eval-when-compile
          (regexp-opt '("param_indexed" "param_indexed_auto" "param_named" 
                        "param_named_auto"  "shared_params_ref"))))

       ;; ogre special values for shader uniforms
       (ogre-material-derived-value-names
        (eval-when-compile
          (regexp-opt '("world_matrix"  "inverse_world_matrix" 
                        "transpose_world_matrix"  "inverse_transpose_world_matrix" 
                        "world_matrix_array_3x4"  "view_matrix" 
                        "inverse_view_matrix"  "transpose_view_matrix" 
                        "inverse_transpose_view_matrix"  "projection_matrix" 
                        "inverse_projection_matrix"  "transpose_projection_matrix" 
                        "inverse_transpose_projection_matrix"  "worldview_matrix" 
                        "inverse_worldview_matrix"  "transpose_worldview_matrix" 
                        "inverse_transpose_worldview_matrix"  "viewproj_matrix" 
                        "inverse_viewproj_matrix"  "transpose_viewproj_matrix" 
                        "inverse_transpose_viewproj_matrix"  "worldviewproj_matrix" 
                        "inverse_worldviewproj_matrix"  "transpose_worldviewproj_matrix" 
                        "inverse_transpose_worldviewproj_matrix"  "texture_matrix" 
                        "render_target_flipping"  "vertex_winding" 
                        "light_diffuse_colour"  "light_specular_colour" 
                        "light_attenuation"  "spotlight_params" 
                        "light_position"  "light_direction" 
                        "light_position_object_space"  "light_direction_object_space" 
                        "light_distance_object_space"  "light_position_view_space" 
                        "light_direction_view_space"  "light_power" 
                        "light_diffuse_colour_power_scaled"  "light_specular_colour_power_scaled" 
                        "light_number"  "light_diffuse_colour_array" 
                        "light_specular_colour_array"  "light_diffuse_colour_power_scaled_array" 
                        "light_specular_colour_power_scaled_array"  "light_attenuation_array" 
                        "spotlight_params_array"  "light_position_array" 
                        "light_direction_array"  "light_position_object_space_array" 
                        "light_direction_object_space_array"  "light_distance_object_space_array" 
                        "light_position_view_space_array"  "light_direction_view_space_array" 
                        "light_power_array"  "light_count" 
                        "light_casts_shadows"  "ambient_light_colour" 
                        "surface_ambient_colour"  "surface_diffuse_colour" 
                        "surface_specular_colour"  "surface_emissive_colour" 
                        "surface_shininess"  "derived_ambient_light_colour" 
                        "derived_scene_colour"  "derived_light_diffuse_colour" 
                        "derived_light_specular_colour"  "derived_light_diffuse_colour_array" 
                        "derived_light_specular_colour_array"  "fog_colour" 
                        "fog_params"  "camera_position" 
                        "camera_position_object_space"  "lod_camera_position" 
                        "lod_camera_position_object_space"  "time" 
                        "time_0_x"  "costime_0_x" 
                        "sintime_0_x"  "tantime_0_x" 
                        "time_0_x_packed"  "time_0_1" 
                        "costime_0_1"  "sintime_0_1" 
                        "tantime_0_1"  "time_0_1_packed" 
                        "time_0_2pi"  "costime_0_2pi" 
                        "sintime_0_2pi"  "tantime_0_2pi" 
                        "time_0_2pi_packed"  "frame_time" 
                        "fps"  "viewport_width" 
                        "viewport_height"  "inverse_viewport_width" 
                        "inverse_viewport_height"  "viewport_size" 
                        "texel_offsets"  "view_direction" 
                        "view_side_vector"  "view_up_vector" 
                        "fov"  "near_clip_distance" 
                        "far_clip_distance"  "texture_viewproj_matrix" 
                        "texture_viewproj_matrix_array"  "texture_worldviewproj_matrix" 
                        "texture_worldviewproj_matrix_array"  "spotlight_viewproj_matrix" 
                        "spotlight_worldviewproj_matrix"  "scene_depth_range" 
                        "shadow_scene_depth_range"  "shadow_colour" 
                        "shadow_extrusion_distance"  "texture_size" 
                        "inverse_texture_size"  "packed_texture_size" 
                        "pass_number"  "pass_iteration_number" 
                        "animation_parametric"  "custom" 
                        ))))

       (ogre-material-parameter-types
        (eval-when-compile
          (regexp-opt '("float" "float4"))))

       (ogre-material-gpu-program-profiles
        (eval-when-compile
          (regexp-opt '("vs_1_1"  "vs_2_0"  "vs_2_x" 
                        "vs_3_0"  "arbvp1"  "vp20" 
                        "vp30"  "vp40"  "ps_1_1" 
                        "ps_1_2"  "ps_1_3"  "ps_1_4" 
                        "ps_2_0"  "ps_2_x"  "ps_3_0" 
                        "ps_3_x"  "arbfp1"  "fp20" 
                        "fp30"  "fp40"  "gpu_gp" 
                        "gp4_gp"))))
       )
  
  
 
  (setq ogre-material-font-lock-keywords-1
        (list
	     ;; derived values
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-derived-value-names "\\)\\>" )
                      'font-lock-variable-name-face))
         ;; gpu profiles
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-gpu-program-profiles "\\)\\>" )
                      'font-lock-variable-name-face))
         ;;section names
         `(eval . 
                (cons (concat "\\<\\(" ,ogre-material-section-names "\\)\\>")
                      'font-lock-type-face ))
         ;; pass attributes
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-pass-attrs "\\)\\>")
                      'font-lock-keyword-face))
         ;; shader attributes
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-shader-attrs "\\)\\>" )
                      'font-lock-keyword-face))
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-technique-attrs "\\)\\>" )
                      'font-lock-keyword-face))
         ;; default shader parameters
         `(eval .
                (cons (concat "\\<\\(" ,ogre-material-default-params "\\)\\>" )
                      'font-lock-keyword-face))  
	     ;; some constants
         '("[[:blank:]]+\\(on\\|off\\|none\\)" 1 font-lock-variable-name-face)

         ;; numbers (integer/float)
         '("\\(\\([[:blank:]]+[0-9]+\\)\\(\\.\\([0-9]+\\)\\)?\\)" 1 font-lock-constant-face)
	     
	     ;; comment
		 '("^\\([[:blank:]]*\\)\\(//\\).*" 1 font-lock-comment-face)
         )))
     


(defvar ogre-material-font-lock-keywords ogre-material-font-lock-keywords-1)

(defvar ogre-material-mode-syntax-table
  (let ((ogre-material-mode-syntax-table (make-syntax-table)))
  ogre-material-mode-syntax-table)
  "Ogre3D material syntax table")
  

(define-derived-mode ogre-material-mode text-mode "Ogre3D-Material"
  "Major mode for editing Ogre3D .material scripts."
  (set (make-local-variable 'font-lock-defaults) '(ogre-material-font-lock-keywords))
  )




(defvar ogre-material-mode-hook nil
   "*Hook run when entering ogre-material mode.")

(provide 'ogre-material-mode)