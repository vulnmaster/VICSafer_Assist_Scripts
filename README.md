# (C) Project VIC International, 2024
# Released under Apache 2 License
# VICSafer_Assist_Scripts

These two scripts assist the Project VIC International VICSafer user with extracting and duplicating new training data based on observed false positives. 

Copy the four files from this repository into VICSafer ~/yolov5-docker/images directory

Step 1: locate the VICSafer output .xlsx report

cd ~/yolov5-docker/runs/"my_scan_2024..."
locate report file "Analysis_my_scan....xlsx"

Step 2: open .xlsx file and copy the "media_path" directory into directory_listing.txt

Step 3: from the Ubuntu terminal: dos2unix directory_listing.txt

Step 4: from the terminal
chmod +x extract_filenames.sh
./extract_filenames.sh

Step 5: from the terminal "dos2unix filelist.txt" (if necessary)

Step 6: from the terminal
chmod +x process_files.sh
./process_files.sh

Step 7: verify that the deduplicated image and video files are located in the ~/images/"images_for_labeling.." directory. You can adjust the ouput directory in the process_images.sh

Step 8 - take the final image and video files into your labeling tool and then onto model training
