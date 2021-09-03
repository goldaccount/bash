#!/bin/sh
echo "Formats:
249          webm       audio only tiny   56k , webm_dash container, opus @ 56k (48000Hz)
250          webm       audio only tiny   72k , webm_dash container, opus @ 72k (48000Hz)
140          m4a        audio only tiny  129k , m4a_dash container, mp4a.40.2@129k (44100Hz)
251          webm       audio only tiny  137k , webm_dash container, opus @137k (48000Hz)
327          m4a        audio only tiny  257k , m4a_dash container, mp4a.40.2@257k (48000Hz)
338          webm       audio only tiny  509k , webm_dash container, opus @509k (48000Hz)
=======
160          mp4        256x144    144p   46k , mp4_dash container, avc1.4d400c@  46k, 30fps, video only
394          mp4        256x144    144p   62k , mp4_dash container, av01.0.00M.08@  62k, 30fps, video only
278          webm       256x144    144p   73k , webm_dash container, vp9@  73k, 30fps, video only
=======
395          mp4        426x240    240p   85k , mp4_dash container, av01.0.00M.08@  85k, 30fps, video only
133          mp4        426x240    240p   89k , mp4_dash container, avc1.4d4015@  89k, 30fps, video only
242          webm       426x240    240p   98k , webm_dash container, vp9@  98k, 30fps, video only
=======
134          mp4        640x360    360p  154k , mp4_dash container, avc1.4d401e@ 154k, 30fps, video only
396          mp4        640x360    360p  161k , mp4_dash container, av01.0.01M.08@ 161k, 30fps, video only
243          webm       640x360    360p  204k , webm_dash container, vp9@ 204k, 30fps, video only
=======
135          mp4        854x480    480p  265k , mp4_dash container, avc1.4d401f@ 265k, 30fps, video only
397          mp4        854x480    480p  279k , mp4_dash container, av01.0.04M.08@ 279k, 30fps, video only
244          webm       854x480    480p  343k , webm_dash container, vp9@ 343k, 30fps, video only
=======
136          mp4        1280x720   720p  475k , mp4_dash container, avc1.4d401f@ 475k, 30fps, video only
398          mp4        1280x720   720p  553k , mp4_dash container, av01.0.05M.08@ 553k, 30fps, video only
247          webm       1280x720   720s  636k , webm_dash container, vp9@ 636k, 30fps, video only
302          webm       1280x720   720s60  895k , webm_dash container, vp9@ 895k, 60fps, video only
136          mp4        1280x720   720s  994k , mp4_dash container, avc1.4d401f@ 994k, 30fps, video only
298          mp4        1280x720   720s60 1212k , mp4_dash container, avc1.4d4020@1212k, 60fps, video only
=======
399          mp4        1920x1080  1080p  958k , mp4_dash container, av01.0.08M.08@ 958k, 30fps, video only
248          webm       1920x1080  1080p 1143k , webm_dash container, vp9@1143k, 30fps, video only
137          mp4        1920x1080  1080p 1267k , mp4_dash container, avc1.640028@1267k, 30fps, video only
303          webm       1920x1080  1080s60 1892k , webm_dash container, vp9@1892k, 60fps, video only
299          mp4        1920x1080  1080s60 2476k , mp4_dash container, avc1.64002a@2476k, 60fps, video only
=======
400          mp4        2560x1440  1440p 2847k , mp4_dash container, av01.0.12M.08@2847k, 30fps, video only
271          webm       2560x1440  1440p 3014k , webm_dash container, vp9@3014k, 30fps, video only
308          webm       2560x1440  1440s60 4547k , webm_dash container, vp9@4547k, 60fps, video only
=======
401          mp4        3840x2160  2160p 5914k , mp4_dash container, av01.0.12M.08@5914k, 30fps, video only
313          webm       3840x2160  2160p 8623k , webm_dash container, vp9@8623k, 30fps, video only
315          webm       3840x2048  2160s60 15697k , webm_dash container, vp9@15697k, 60fps, video only
=======
18           mp4        640x360    360p  504k , avc1.42001E, 30fps, mp4a.40.2 (44100Hz)
22           mp4        1280x716   720p 1760k , avc1.64001F, 30fps, mp4a.40.2 (44100Hz) (best)
"
