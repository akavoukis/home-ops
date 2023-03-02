#!/bin/bash

access_code=${ALEXA_NOTIFICATION_KEY}

if [ -n "${radarr_eventtype}" ]; then
  curl https://api.notifymyecho.com/v1/NotifyMe -H "Content-Type: application/json" -d "{\"notification\":\"${radarr_movie_title} has been ${radarr_eventtype} using download client ${radarr_download_client} \",\"accessCode\":\"${access_code}\"}"
elif [ "${sonarr_eventtype}" = "Grab"  ]; then
  curl https://api.notifymyecho.com/v1/NotifyMe -H "Content-Type: application/json" -d "{\"notification\":\"${sonarr_series_title} season ${sonarr_release_seasonnumber} episodes ${sonarr_release_episodenumbers} has been ${sonarr_eventtype} using download client ${sonarr_download_client}\",\"accessCode\":\"${access_code}\"}"
elif [ "${sonarr_eventtype}" = "Download"  ]; then
  curl https://api.notifymyecho.com/v1/NotifyMe -H "Content-Type: application/json" -d "{\"notification\":\"${sonarr_series_title} season ${sonarr_episodefile_seasonnumber} episodes ${sonarr_episodefile_episodenumbers} has been ${sonarr_eventtype}ed using download client ${sonarr_download_client}\",\"accessCode\":\"${access_code}\"}"
else #unknown event
  curl https://api.notifymyecho.com/v1/NotifyMe -H "Content-Type: application/json" -d "{\"notification\":\" Unknown event type \",\"accessCode\":\"${access_code}\"}"
fi
