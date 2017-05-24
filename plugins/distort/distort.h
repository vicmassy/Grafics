#ifndef _DISTORT_H
#define _DISTORT_H

#include "basicplugin.h"
#include <QOpenGLShader>
#include <QOpenGLShaderProgram>
#include <QElapsedTimer>


class distort : public QObject, public BasicPlugin
{
     Q_OBJECT
     Q_PLUGIN_METADATA(IID "BasicPlugin")
     Q_INTERFACES(BasicPlugin)

 public:
    void onPluginLoad();
    bool paintGL();

 private:
    QOpenGLShaderProgram* program;
    QOpenGLShader* vs;
    QOpenGLShader* fs;
    GLuint textureId;
	QElapsedTimer elapsedTimer;
 };

 #endif
