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
		else
			echo "EXIF created date $exifDate not found"
		fi
	else
		echo ">> Invalid date $exifDate"
	fi

done