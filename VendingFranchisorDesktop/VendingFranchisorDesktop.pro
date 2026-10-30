QT       += core gui network charts

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

CONFIG += c++17

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
    account.cpp \
    addmachinewidget.cpp \
    apiclient.cpp \
    authform.cpp \
    clickableframe.cpp \
    clickablelabel.cpp \
    machineswidget.cpp \
    main.cpp \
    maininfowidget.cpp \
    mainwindow.cpp \
    monitorwidget.cpp \
    navigation.cpp

HEADERS += \
    account.h \
    addmachinewidget.h \
    apiclient.h \
    authform.h \
    clickableframe.h \
    clickablelabel.h \
    machineswidget.h \
    maininfowidget.h \
    mainwindow.h \
    monitorwidget.h \
    navigation.h

FORMS += \
    account.ui \
    addmachinewidget.ui \
    authform.ui \
    machineswidget.ui \
    maininfowidget.ui \
    mainwindow.ui \
    monitorwidget.ui \
    navigation.ui

# Default rules for deployment.
qnx: target.path = /tmp/$${TARGET}/bin
else: unix:!android: target.path = /opt/$${TARGET}/bin
!isEmpty(target.path): INSTALLS += target
