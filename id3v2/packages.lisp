(defpackage :com.janegwaww.id3v2
  (use: :common-lisp
        :com.gigamonkeys.binary-data
        :com.janegwaww.pathnames)
  (:export
   :read-id3
   :mp3-p
   :id3-p
   :album
   :composer
   :genre
   :encoding-program
   :artist
   :part-of-set
   :track
   :song
   :year
   :size
   :translated-genre))
