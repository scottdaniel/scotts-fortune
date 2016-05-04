#!/usr/bin/env python

#This is a tiny script to call from another script to send you an e-mail when
#A process is done
#Setup to use gmail but you can change that if you like
#If using gmail and two-factor auth
#then you need to make an app-specific password here:
#https://support.google.com/accounts/answer/185833?hl=en

def send_email(user, pwd, recipient, subject, body):
    import smtplib

    gmail_user = user
    gmail_pwd = pwd
    FROM = user
    TO = recipient if type(recipient) is list else [recipient]
    SUBJECT = subject
    TEXT = body

    # Prepare actual message
    message = """\From: %s\nTo: %s\nSubject: %s\n\n%s
    """ % (FROM, ", ".join(TO), SUBJECT, TEXT)
    try:
        server = smtplib.SMTP("smtp.gmail.com", 587)
        server.ehlo()
        server.starttls()
        server.login(gmail_user, gmail_pwd)
        server.sendmail(FROM, TO, message)
        server.close()
        print 'successfully sent the mail'
    except:
        print "failed to send mail"

send_email('name@gmail.com','app-specific-password','name@gmail.com','smtplib test','hello, this is python')
