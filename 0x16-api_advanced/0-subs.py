#!/usr/bin/python3
"""
Script that queries subscribers on a given Reddit subreddit.
"""

import requests


def number_of_subscribers(subreddit):
    """
    Query the Reddit API to get the number of subscribers for a given subreddit.
    Return 0 if the subreddit is invalid or if there is any error.
    """
    # Set up the URL for the API request
    url = f"https://www.reddit.com/r/{subreddit}/about.json"

    # Set a custom User-Agent to avoid the Too Many Requests error
    headers = {"User-Agent": "0x16-api_advanced-bayelaye313"}

    # Make the request to the Reddit API
    response = requests.get(url, headers=headers, allow_redirects=False)

    # Check if the request was successful
    if response.status_code == 200:
        # Parse the JSON response and get the number of subscribers
        data = response.json()
        return data['data']['subscribers']
    else:
        # Return 0 if the subreddit is invalid or the request fails
        return 0
