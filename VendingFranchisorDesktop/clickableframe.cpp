#include "clickableframe.h"
#include <QMouseEvent>

ClickableFrame::ClickableFrame(QWidget *parent, Qt::WindowFlags f)
    : QFrame(parent, f) {}

void ClickableFrame::mousePressEvent(QMouseEvent *event)
{
    if (event->button() == Qt::LeftButton) {
        emit clicked();
    }
    QFrame::mousePressEvent(event);
}
