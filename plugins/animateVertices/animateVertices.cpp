#include "animateVertices.h"
#include "glwidget.h"


void animateVertices::onPluginLoad() {
    glwidget()->makeCurrent();
    QString vs_src = 
    "#version 330 core\n"
    "layout (location = 0) in vec3 vertex;"
    "layout (location = 1) in vec3 normal;"
    "layout (location = 2) in vec3 color;"
    "layout (location = 3) in vec2 texCoord;"
    "out vec4 frontColor;"
    "out vec2 vtexCoord;"
    "uniform mat4 modelViewProjectionMatrix;"
    "uniform mat3 normalMatrix;"
    "uniform float amplitude=0.1;"
    "uniform float freq=1;"
    "uniform float time;"
    "out float d;"
    "const float PI = 3.14159;"
    "void main()"
    "{"
        "vec3 P = vertex.xyz;"
        "vec3 N = normalize(normalMatrix * normal);"
        "vtexCoord = texCoord;"
        "d = amplitude*sin(2*freq*PI*abs(time));"
        "P = P + normal*d;"
        "frontColor = vec4(N.z);"
        "gl_Position = modelViewProjectionMatrix * vec4(P.xyz, 1.0);"
    "}";
    vs = new QOpenGLShader(QOpenGLShader::Vertex, this);
    vs->compileSourceCode(vs_src);
    cout << "VS log:" << vs->log().toStdString() << endl;
    QString fs_src = 
        "#version 330 core\n"
        "in vec4 frontColor;"
        "out vec4 fragColor;"
        "void main()"
        "{"
            "fragColor = frontColor;"
        "}";
    fs = new QOpenGLShader(QOpenGLShader::Fragment, this);
    fs->compileSourceCode(fs_src);
    cout << "FS log:" << fs->log().toStdString() << endl;
    program = new QOpenGLShaderProgram(this);
    program->addShader(vs);
    program->addShader(fs);
    program->link();
    cout << "Link log:" << program->log().toStdString() << endl;
    
    elapsedTimer.start();
    // keep repainting
    QTimer *timer = new QTimer(this);
    connect(timer, SIGNAL(timeout()), glwidget(), SLOT(update()));
    timer->start();
}

void animateVertices::preFrame() {
    program->bind();
    program->setUniformValue("time", float(elapsedTimer.elapsed()/1000.0f));
    QMatrix4x4 MVP = camera()->projectionMatrix() * camera()->viewMatrix();
    program->setUniformValue("modelViewProjectionMatrix", MVP);
    QMatrix3x3 NM = camera()->viewMatrix().normalMatrix();
    program->setUniformValue("normalMatrix", NM);
}

void animateVertices::postFrame() {
    program->release();
}
