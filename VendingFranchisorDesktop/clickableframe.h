#ifndef CLICKABLEFRAME_H
#define CLICKABLEFRAME_H

#include <QFrame>
#include <QObject>

class ClickableFrame : public QFrame
{
    Q_OBJECT
public:
    ClickableFrame(QWidget *parent = nullptr, Qt::WindowFlags f = Qt::WindowFlags());
protected:
    void mousePressEvent(QMouseEvent *event) override;
signals:
    void clicked();
};

#endif // CLICKABLEFRAME_H
