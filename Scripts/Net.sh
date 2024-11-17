NET1=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET1 == 1 ]]; then
  true # Do nothing

elif [[ $NET1 == 0 ]]; then
IS_NET1\_ON=$(nmcli dev wifi list | grep chadfield >>/dev/null; echo 0) # Is chadfield currently online?

  if [[ $IS_NET1\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET1\_ON == 0 ]]; then
      nmcli dev wifi connect chadfield # Connect to chadfield
  fi
fi

NET2=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET2 == 1 ]]; then
  true # Do nothing

elif [[ $NET2 == 0 ]]; then
IS_NET2\_ON=$(nmcli dev wifi list | grep BELL529 >>/dev/null; echo 0) # Is BELL529 currently online?

  if [[ $IS_NET2\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET2\_ON == 0 ]]; then
      nmcli dev wifi connect BELL529 # Connect to BELL529
  fi
fi

NET1=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET1 == 1 ]]; then
  true # Do nothing

elif [[ $NET1 == 0 ]]; then
IS_NET1\_ON=$(nmcli dev wifi list | grep chadfield >>/dev/null; echo 0) # Is chadfield currently online?

  if [[ $IS_NET1\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET1\_ON == 0 ]]; then
      nmcli dev wifi connect chadfield # Connect to chadfield
  fi
fi

NET2=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET2 == 1 ]]; then
  true # Do nothing

elif [[ $NET2 == 0 ]]; then
IS_NET2\_ON=$(nmcli dev wifi list | grep BELL529 >>/dev/null; echo 0) # Is BELL529 currently online?

  if [[ $IS_NET2\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET2\_ON == 0 ]]; then
      nmcli dev wifi connect BELL529 # Connect to BELL529
  fi
fi

NET1=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET1 == 1 ]]; then
  true # Do nothing

elif [[ $NET1 == 0 ]]; then
IS_NET1\_ON=$(nmcli dev wifi list | grep chadfield >>/dev/null; echo 0) # Is chadfield currently online?

  if [[ $IS_NET1\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET1\_ON == 0 ]]; then
      nmcli dev wifi connect chadfield # Connect to chadfield
  fi
fi

NET2=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET2 == 1 ]]; then
  true # Do nothing

elif [[ $NET2 == 0 ]]; then
IS_NET2\_ON=$(nmcli dev wifi list | grep BELL529 >>/dev/null; echo 0) # Is BELL529 currently online?

  if [[ $IS_NET2\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET2\_ON == 0 ]]; then
      nmcli dev wifi connect BELL529 # Connect to BELL529
  fi
fi

NET1=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET1 == 1 ]]; then
  true # Do nothing

elif [[ $NET1 == 0 ]]; then
IS_NET1\_ON=$(nmcli dev wifi list | grep chadfield >>/dev/null; echo 0) # Is chadfield currently online?

  if [[ $IS_NET1\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET1\_ON == 0 ]]; then
      nmcli dev wifi connect chadfield # Connect to chadfield
  fi
fi

NET2=$(nmcli | grep  | grep disconnected >>/dev/null; echo 0) # Am I connected to a network?
if [[ $NET2 == 1 ]]; then
  true # Do nothing

elif [[ $NET2 == 0 ]]; then
IS_NET2\_ON=$(nmcli dev wifi list | grep BELL529 >>/dev/null; echo 0) # Is BELL529 currently online?

  if [[ $IS_NET2\_ON == 1 ]]; then
      true # Do nothing

  elif [[ $IS_NET2\_ON == 0 ]]; then
      nmcli dev wifi connect BELL529 # Connect to BELL529
  fi
fi

