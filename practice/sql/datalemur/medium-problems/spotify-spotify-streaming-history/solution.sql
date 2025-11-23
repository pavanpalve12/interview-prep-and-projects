-- time : 28 mins attemot 1

WITH all_song_plays_cte AS
(
  SELECT 
      user_id
    , song_id
    , 1 AS song_plays 
  FROM 
    songs_weekly 
  WHERE CAST(listen_time AS DATE) < '08/05/2022'
UNION ALL
  SELECT 
      user_id
    , song_id
    , song_plays 
  FROM 
    songs_history
)
SELECT 
    user_id
  , song_id
  , SUM (song_plays) AS song_plays
FROM 
  all_song_plays_cte
GROUP BY
    user_id
  , song_id
ORDER BY
  song_plays DESC
;