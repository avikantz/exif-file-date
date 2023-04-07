for f in "$@"
do
    echo ">> Processing $f"

	# Get exif date for the input
	exifDate=$(mdls "$f" | grep 'kMDItemContentCreationDate' | head -n1 | awk '{print $3" "$4$5}')

	# Check for empty date
	if [[ -n $exifDate ]]; then

		# Convert to SetFile compatible date
		formattedDate=$(date -j -f "%Y-%m-%d %H:%M:%S%z" "$exifDate" "+%m/%d/%Y %H:%M:%S")

		if [[ $? = 0 ]]; then
			echo ">> Setting $formattedDate to $f"

			SetFile -m "$formattedDate" "$f"
			SetFile -d "$formattedDate" "$f"

			# Check if live video files exist, update their dates as well
			liveMP4File="$(echo "$f" | cut -f 1 -d '.').MP4"

			if test -f "$liveMP4File"; then
				echo ">> Setting $formattedDate to $liveMP4File"
				SetFile -m "$formattedDate" "$liveMP4File"
				SetFile -d "$formattedDate" "$liveMP4File"
			fi

			liveMOVFile="$(echo "$f" | cut -f 1 -d '.').MOV"

			if test -f "$liveMOVFile"; then
				echo ">> Setting $formattedDate to $liveMOVFile"
				SetFile -m "$formattedDate" "$liveMOVFile"
				SetFile -d "$formattedDate" "$liveMOVFile"
			fi


		else
			echo "EXIF created date $exifDate not found"
		fi
	else
		echo ">> Invalid date $exifDate"
	fi

done