from pynput.keyboard import Key, Controller
import time

keyboard = Controller()
'''
# Press and release space


# Type a lower case A; this will work even if no key on the
# physical keyboard is labelled 'A'
keyboard.press('a')
keyboard.release('a')

# Type two upper case As
keyboard.press('A')
keyboard.release('A')
with keyboard.pressed(Key.shift):
    keyboard.press('a')
    keyboard.release('a')
'''
friends = "Mihai Andrei|Ian K. Hou|Pranav Krishnan|Shashank Sharma|Ali Mohamad|Nicholas Tobin|Phoebe Abalos|Ali Kline LaPointe|Berton Wang|Billy Liu|Scott Zheng|Vinay Gonugondla|Ten Westmoreland|Danish Maqbool|Sid Das|Richard Mu|Vincent Chen|Arnav Seelam|Shikha Nair|Roy Kim|Jeremy John|Aleksey Valentinov|Renesh Bhamidipati|Salman Fakhri|Srikant Devarajan|Naeem Hossain|Jake Feiglin|Abhinav Singh|Bhoomika Jain|Katarina Lin|Sanghoon Hwang|Phillip Prigozhiy|Shivanshi Patel|Akshay Malavade|Sid Naik|Jason Lin|Samuel Rong|Sean Li|Alex Chen|Bryan Tong|Shriram Chandra|Kristie Wong|David Kim|Ethan Teicher|Swapnanil Deb|Srisurya Jakka|Kevin Cadavillo|Mai Hand|Michael Allen|Nick Chu|David Borts|David Tian|Malav Modi|Joseph Ham|Aman Virdi|Tim Li|Madhu Sivaraj|Andriy Tymchyshyn|Ethan Kang|Mary Velahos|Brian St. John|Samyak Parajuli|Gaurav Sethi|Flora Liu|Sushant Gupt|Douglas Willig|Frank Sun|Sue Lee|Sandra Guirguis|Subhadha Kartik|Austin Schlessinger|Mike Abelar|Julie Chaimowitz|Andrew Yuen|Ashika Jalagam|Angini Ragumar|Suraj Kakkad|Sonali Alluri|Evan Dekhayser|Mitchell Wong|Kerem Yadin|Steven Liang|Jason Lum|Kevin Sun|Kunj Shah|Liv Nguyen|Sayom Ghosh-Dastidar|Arnav Chenemilla|Shivam Agrawal|Kevin Wang|Nick DeCarlo|Thea York|Samantha Liu|Jason Minikel|Abheek Pandoh|Lawrence Huang|Sam Tombokan|Alex Ling|Dïs Gaï|Rohan Patel|Niket Barot|Sara Park|Ricky Gupta|Deep Shah|Aditya Parthasarathy|Nick Chu|Taeseung Park|Patrick Chan|Sujay Uppalapati|Ethan Assouline|Jon Wu|Anmol Mynam|Celina Zhou|Jon Jevv|Kuber Sethi|Amulya Mummaneni|Ann Luk|Sebastien Blazej|Alex Fong|Jane Lee|Abi Naya|Timothy JJew|Claire Kim|Jonathan King|Hari Amoor|Albert Leung|Sam Fabian|Deep Patel|Jatin Khona|Albert Wu|Rose Kong|Nihal Sivakumar|Jason Alexander|Seharsh Baxi|Lara Becker|Mike Ziegler|Abhijnana Das|Daniel Erlikh|Aidan Matthew Andrucyk|Gaby Alvarez|William Wong|George Soliman|Abhinav Madahar|Nicole Botros|Andrew Lee|Kyle Malabuyoc|Siddharth Sambath|Douglas Rudolph|Rishi Mathur|Zheng Cao|Daniel Like|Shyam Patel|Kelly Hong|Marzia Karim|Bill Kuncken|Hee Soo Lee|Jonathan Ash|John Li|Stanley He|Anthony Brown|Jonathan Brown|Eric Zhou|Kevin Antony Titus|Vikas Dalal|James Wo|Steve Hsu|Om Savargaonkar|Peter Wu|Jenn Chen|Sankruth Kota|Teddy Ha|Matthew Gezner|William Wang|Sarika Malhotra|Ray Sigh|Kyrollos Girgis|Amruth Jalagam|Rohan Shah|Sabrina May|Neelam Patel|Chris Ng|Alex Ding|Younan Moawed|Victor Su-Ortiz|Anielle Torres|Fred Zheng|Barbara Shi|Winston Huang|Brandon Ho|Dennis Cherian|Sophia Hu|Faizan Syed|Sharon Kal|Charlie Dove|Joe McAndrew|Louis Deraville|Evan Wang|Raahim Bashir|Shu Chen|Julia Toich|Abigail Weed|Darren Chu|Kush Batra|Samuel Yip|Sijin Li|Maria Diwan|Abdul Hai Shaikh|Dani Martinez|Jon Botros|Christopher Stanton|Zaid Saud|John Wu|Maya Subramanian|Mark Bakhiet|Angelo Vinco|Dylan Tran|Kayo Sethna|Kyrollos Boulos|Joseph Ham|Mustafa Sheikh|Kyle Wang|Rachel Lipman|Jon Marcos|Jeffrey Ho|David Die|Aaron Maskarenas|Sahil Patel|Dean Feldman|Aneree Rathod|Sakshi Roongta|Aazar Khan|Damon Luk|Scott Dessel|David Arida|Brandon Klavansky|Zack You Ni"
friends = friends.split("|")

time.sleep(10)

for friend in friends:
    for char in friend:
        keyboard.press(char)
        keyboard.release(char)
    time.sleep(.5)
    keyboard.press(Key.enter)
    keyboard.release(Key.enter)
