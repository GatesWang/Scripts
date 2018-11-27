import easygui, time
from win32com.client import Dispatch

speak = Dispatch("SAPI.SpVoice")
minutes = input("how many minutes?: ")

while True:
    time.sleep(int(minutes)*60)
    speak.Speak("It is time to take a break")
    easygui.msgbox("Break time!")
