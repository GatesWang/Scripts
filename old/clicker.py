import time
##from pynput import mouse
import pynput.keyboard
import pynput.mouse
from pynput.mouse import Button
from pynput.keyboard import Key

k = pynput.keyboard.Controller()
m = pynput.mouse.Controller()

##def on_move(x, y):
##    print('Pointer moved to {0}'.format(
##        (x, y)))
##
##def on_click(x, y, button, pressed):
##    print('{0} at {1}'.format(
##        'Pressed' if pressed else 'Released',
##        (x, y)))
##    if not pressed:
##        # Stop listener
##        return False
##
##def on_scroll(x, y, dx, dy):
##    print('Scrolled {0}'.format(
##        (x, y)))
##
### Collect events until released
##with pynput.mouse.Listener(
##        on_move=on_move,
##        on_click=on_click,
##        on_scroll=on_scroll) as listener:
##    listener.join()
    
def down():
    k.press(Key.down)
    k.release(Key.down)

def enter():
    k.press(Key.enter)
    k.release(Key.enter)
    
def click():
    m.press(Button.left)
    m.release(Button.left)

while True:
    time.sleep(1)
    click()
    m.move(468,-503)
    time.sleep(1)
    click()
    down()
    m.move(24,283)
    time.sleep(1)
    click()
    m.move(-551,210)
    time.sleep(1)
    click()
    time.sleep(600)
