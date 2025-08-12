// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause
#include "fparser.hh"
#include <iostream>
#include <string>
#include <math.h>
#include <string>
#include <QMessageBox>

#include <iostream>
#include <cmath>
#include <stdio.h>
using namespace std;
#include <limits>

#include "calculhaf.h"

// #include <QAreaSeries>
#include <QQuickItem>
#include <QQuickView>
// #include <QRandomGenerator>
// #include <QtMath>
// #include <QXYSeries>

// Q_DECLARE_METATYPE(QAbstractSeries *)
// Q_DECLARE_METATYPE(QAbstractAxis *)

CalculHaf::CalculHaf(QQuickView *appViewer, QObject *parent)
    : QObject(parent)
    , m_appViewer(appViewer)
{
    fparserfx.AddConstant("pi", M_PI);
    fparsergx.AddConstant("pi", M_PI);
    fparseryprim.AddConstant("pi", M_PI);
    fparserfxintegrale.AddConstant("pi", M_PI);
    fparserfxplot.AddConstant("pi", M_PI);
}
QString CalculHaf::textChangedinfunctionfxy1(QString fxy1_nonlinearsyst)
{
    fparserf1xy.AddConstant("pi", M_PI);
    int res = fparserf1xy.Parse(fxy1_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctionfxy2(QString fxy2_nonlinearsyst)
{
    fparserf2xy.AddConstant("pi", M_PI);
    int res = fparserf2xy.Parse(fxy2_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctiongxy1PF(QString gxy1PF_nonlinearsyst)
{
    fparserg1y.AddConstant("pi", M_PI);
    int res = fparserg1y.Parse(gxy1PF_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctiongxy2PF(QString gxy2PF_nonlinearsyst)
{
    fparserg2x.AddConstant("pi", M_PI);
    int res = fparserg2x.Parse(gxy2PF_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctiondf1xyNR(QString df1xyNR_nonlinearsyst)
{
    fparserf1xyprime.AddConstant("pi", M_PI);
    int res = fparserf1xyprime.Parse(df1xyNR_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctiondf2xyNR(QString df2xyNR_nonlinearsyst)
{
    fparserf2xyprime.AddConstant("pi", M_PI);
    int res = fparserf2xyprime.Parse(df2xyNR_nonlinearsyst.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfx_plot(QString fx)
{
    int res = fparserfxplot.Parse(fx.toStdString(), "x");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfx_integ(QString fx)
{
    int res = fparserfx.Parse(fx.toStdString(), "x");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctionyprime(QString yprim)
{
    fparseryprim.AddConstant("pi", M_PI);
    int res = fparseryprim.Parse(yprim.toStdString(), "x,y");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctionfx(QString fx)
{
    fparserfx.AddConstant("pi", M_PI);
    int res = fparserfx.Parse(fx.toStdString(), "x");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctiongxPF(QString gx)
{
    fparsergx.AddConstant("pi", M_PI);
    int res = fparsergx.Parse(gx.toStdString(), "x");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
QString CalculHaf::textChangedinfunctionfprimNR(QString fxfprimx)
{
    fparserfxprim.AddConstant("pi", M_PI);
    int res = fparserfxprim.Parse(fxfprimx.toStdString(), "x");

    if(res > -1)
    {
        return "red";
    }
    else
    {
        return "white";
    }
}
void CalculHaf::EvalErrorfunHAFxy(int fparser_EvalError, QString fx, double x,double y,int ndecimaux)
{
    QString message;
    if (fparser_EvalError!=0){
        switch (fparser_EvalError) {
        case 1:
            message=tr("division by zero");
            break;
        case 2:
            message=tr("sqrt error (sqrt of a negative value)");
            break;
        case 3:
            message=tr("log error (logarithm of a zero or negative value)");
            break;
        case 4:
            message=tr("trigonometric error (asin or acos of an incorrect value; not between -1 and 1)");
            break;
        case 5:
            message=tr("maximum recursion level in eval() reached");
            break;
        }
        message+=tr(" dans x=")+QString::number(x,'f',ndecimaux);
        message+=tr(" et y=")+QString::number(y,'f',ndecimaux);
        emit requestDialog_nonlinearsyst(tr("Error in ")+ QString("%1").arg(fx),message);
        return;
    }
}
void CalculHaf::EvalErrorfunHAF(int fparser_EvalError, QString fx, double x,int ndecimaux)
{
    if (fparser_EvalError!=0){
        switch (fparser_EvalError) {
        case 1:
            message=tr("division by zero");
            break;
        case 2:
            message=tr("sqrt error (sqrt of a negative value)");
            break;
        case 3:
            message=tr("log error (logarithm of a zero or negative value)");
            break;
        case 4:
            message=tr("trigonometric error (asin or acos of an incorrect value; not between -1 and 1)");
            break;
        case 5:
            message=tr("maximum recursion level in eval() reached");
            break;
        }
        message+=tr(" in x=")+QString::number(x,'f',ndecimaux)+" ("+tr("Error in ")+ QString("%1").arg(fx)+") ";
        emit requestDialog(tr("Error in ")+ QString("%1").arg(fx),message);
        qDebug() << "ERROR="<< "^\n"
                 << message << "\n\n";
        return;
    }
}
void CalculHaf::hafresolutioneqtnonlineaire_pointfixe(QString fx,QString gx, double x0,double eps,int nmax,int ndecimaux)
{
    fparserfx_EvalError=0;
    fparsergx_EvalError=0;
    message="";

    double vals[1];
    i=0;
    double x[nmax];
    x[0]=x0;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlineareqt("Error","The value of x0 exceeds the permissible limits!");
        return ;
    }


    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f(x)",fparserfx.ErrorMsg());
            qDebug() << fparserfx.ErrorMsg();
            return;
            /// break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfx.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparsergx.Parse(gx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparsergx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in g(x)",fparsergx.ErrorMsg());
            qDebug() << fparsergx.ErrorMsg();
            return;
            ///break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparsergx.ErrorMsg() << "\n\n";
    }

    vals[0]=x[i];
    emit requestXiPF(i,x[i],fparsergx.Eval(vals),fparserfx.Eval(vals));

    fparsergx_EvalError=fparsergx.EvalError();
    EvalErrorfunHAF(fparsergx_EvalError,"g(x)",x[i],ndecimaux);
    fparserfx_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i],ndecimaux);


    while (fabs(fparserfx.Eval(vals))>eps && i<nmax && fparserfx_EvalError==0 && fparsergx_EvalError==0)
    {
        vals[0]=x[i];
        x[i+1]=fparsergx.Eval(vals);
        fparsergx_EvalError=fparsergx.EvalError();
        EvalErrorfunHAF(fparsergx_EvalError,"g(x)",x[i],ndecimaux);
        vals[0]=x[i+1];
        emit requestXiPF(i+1,x[i+1],fparsergx.Eval(vals),fparserfx.Eval(vals));
        fparsergx_EvalError=fparsergx.EvalError();
        EvalErrorfunHAF(fparsergx_EvalError,"g(x)",x[i+1],ndecimaux);
        fparserfx_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i+1],ndecimaux);
        i=i+1;
    }

    if(fparserfx_EvalError==0 && fparsergx_EvalError==0 && i<nmax && !std::isnan(x[i])&& !std::isnan(fparserfx.Eval(vals)) && x[i]!=std::numeric_limits<double>::infinity() && x[i]!=-std::numeric_limits<double>::infinity()){
        emit requestSelectEndtable_nonlineareqt();
        emit requestDialog_nonlineareqt("Results",tr("The method converges to x=")+
                                                       QString::number(x[i],'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlineareqt("Results", tr("The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                                      "Maybe you need to change g(x) or/and x0! (or increase the precision or the max number of iterations)"));
    }else if(fparserfx_EvalError!=0 || fparsergx_EvalError!=0){
        message+=tr(" (Incorrect data!)");
        emit requestDialog_nonlineareqt("Results",message);

    }else{
        emit requestDialog_nonlineareqt("Results",tr("The method does not converge: Maybe you need to change g(x) ou/et x0!"));
    }

}

void CalculHaf::hafresolutioneqtnonlineaire_newtonraphson(QString fx,QString fxprim, double x0,double eps,int nmax,int ndecimaux)
{
    fparserfx_EvalError=0;
    fparserfxprim_EvalError=0;
    message="";
    ////////////////////////////////

    double vals[1];
    i=0;
    double x[nmax];
    x[0]=x0;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlineareqt("Error","The value of x0 exceeds the permissible limits!");
        return ;
    }
    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f(x)",fparserfx.ErrorMsg());
            qDebug() << fparserfx.ErrorMsg();
            return;
            /// break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfx.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserfxprim.Parse(fxprim.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfxprim.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f'(x)",fparserfxprim.ErrorMsg());
            qDebug() << fparserfxprim.ErrorMsg();
            return;
            ///break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfxprim.ErrorMsg() << "\n\n";
    }

    vals[0]=x[i];
    emit requestXiNR(i,x[i],fparserfxprim.Eval(vals),fparserfx.Eval(vals));
    fparserfxprim_EvalError=fparserfxprim.EvalError();
    EvalErrorfunHAF(fparserfxprim_EvalError,"f'(x)",x[i],ndecimaux);
    fparserfx_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i],ndecimaux);
    while (fabs(fparserfx.Eval(vals))>eps && i<nmax && fparserfx_EvalError==0 && fparserfxprim_EvalError==0)
    {
        vals[0]=x[i];
        x[i+1]=x[i]-fparserfx.Eval(vals)/fparserfxprim.Eval(vals);
        vals[0]=x[i+1];
        emit requestXiNR(i+1,x[i+1],fparserfxprim.Eval(vals),fparserfx.Eval(vals));
        fparserfxprim_EvalError=fparserfxprim.EvalError();
        EvalErrorfunHAF(fparserfxprim_EvalError,"f'(x)",x[i+1],ndecimaux);
        fparserfx_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i+1],ndecimaux);
        i=i+1;
    }
    if(fparserfx_EvalError==0 && fparserfxprim_EvalError==0 && i<nmax && !std::isnan(x[i])&& !std::isnan(fparserfx.Eval(vals)) && x[i]!=std::numeric_limits<double>::infinity() && x[i]!=-std::numeric_limits<double>::infinity() ){
        emit requestSelectEndtable_nonlineareqt();
        emit requestDialog_nonlineareqt("Results",tr("The method converges to x=")+
                                                       QString::number(x[i],'f',ndecimaux));

    }else if(i>=nmax){
        emit requestDialog_nonlineareqt("Results", tr("The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                                      "Maybe you need to change x0 or increase the precision or the max number of iterations!"));
    }else if(fparserfx_EvalError!=0 || fparserfxprim_EvalError!=0){
        message+=tr(" (Incorrect data!)");
        emit requestDialog_nonlineareqt("Results",message);
    }else{
        emit requestDialog_nonlineareqt("Results",tr("The method does not converge: Maybe you need to change x0!"));
    }
}
void CalculHaf::hafresolutioneqtnonlineaire_secante(QString fx, double x0, double x1,double eps,int nmax,int ndecimaux)
{

    double valsi[1];
    double valsimoisun[1];

    i=0;
    double x[nmax];
    x[0]=x0;
    x[1]=x1;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity() ||
        x[1]==std::numeric_limits<double>::infinity() || x[1]==-std::numeric_limits<double>::infinity()
        ){
        emit requestDialog_nonlineareqt("Error","The value of x0 or/and x1 exceeds the permissible limits!");
        return ;
    }

    if (x[0]==x[1])
    {
        emit requestDialog_nonlineareqt("Error","x0 must be different from x1!");
        return ;
    }

    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f(x)",fparserfx.ErrorMsg());
            qDebug() << fparserfx.ErrorMsg();
            return;
            /// break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfx.ErrorMsg() << "\n\n";
    }

    valsi[0]=x[0];
    emit requestXiSEC(0,x[0],fparserfx.Eval(valsi));
    fparserfx_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfx_EvalError,"f(x=x[0])",x[0],ndecimaux);
    valsi[0]=x[1];
    valsimoisun[0]=x[0];
    emit requestXiSEC(1,x[1],fparserfx.Eval(valsi));
    fparserfx_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfx_EvalError,"f(x=x[1])",x[1],ndecimaux);
    i=1;
    double valeurfxi;
    double valeurfximoisun;
    while (fabs(fparserfx.Eval(valsi))>eps && i<nmax && fparserfx_EvalError==0)
    {
        valsi[0]=x[i];
        valsimoisun[0]=x[i-1];
        valeurfximoisun=fparserfx.Eval(valsimoisun);
        fparserfx_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i-1],ndecimaux);
        valeurfxi=fparserfx.Eval(valsi);
        fparserfx_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfx_EvalError,"f(x)",x[i],ndecimaux);
        x[i+1]=x[i]-valeurfxi*(x[i]-x[i-1])/(valeurfxi-valeurfximoisun);
        emit requestXiSEC(i,x[i],valeurfxi);
        i=i+1;
    }

    if(fparserfx_EvalError==0 && i<nmax  && !std::isnan(x[i-1])&& !std::isnan(fparserfx.Eval(valsi)) && x[i-1]!=std::numeric_limits<double>::infinity() && x[i-1]!=-std::numeric_limits<double>::infinity()){
        emit requestSelectEndtable_nonlineareqt();
        emit requestDialog_nonlineareqt("Results",tr("The method converges to x=")+
                                                       QString::number(x[i],'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlineareqt("Results", tr("The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                                      "Maybe you need to change x0 or/and x1 or increase the precision or the max number of iterations!"));
    }else if(fparserfx_EvalError!=0){
        message+=tr(" (Incorrect data!)");
        emit requestDialog_nonlineareqt("Results",message);
    }else{
        emit requestDialog_nonlineareqt("Results", tr("The method does not converge: Maybe you need to change x0 or/and x1"));
    }
}
void CalculHaf::hafresolutioneqtnonlineaire_dichotomie(QString fx, double a, double b,double eps,int nmax,int ndecimaux)
{
    double valsa[1];
    double valsb[1];
    double valsxm[1];
    if(a==std::numeric_limits<double>::infinity() || a==-std::numeric_limits<double>::infinity() ||
        b==std::numeric_limits<double>::infinity() || b==-std::numeric_limits<double>::infinity()
        ){
        emit requestDialog_nonlineareqt("Error","The value of a or/and b exceeds the permissible limits!");
        return ;
    }
    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f(x)",fparserfx.ErrorMsg());
            qDebug() << fparserfx.ErrorMsg();
            return;
            /// break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfx.ErrorMsg() << "\n\n";
    }

    valsa[0]=a;
    valsb[0]=b;

    double fa=fparserfx.Eval(valsa);
    fparserfxa_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfxa_EvalError,"f(x=a)",a,ndecimaux);
    double fb=fparserfx.Eval(valsb);
    fparserfxb_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfxb_EvalError,"f(x=b)",b,ndecimaux);

    double faxfb=fa*fb;

    if ((faxfb>=0 || a>=b) && fparserfxa_EvalError==0 && fparserfxb_EvalError==0)
    {
        emit requestDialog_nonlineareqt("Error","It is necessary that (f(a)*f(b)<0 ; a<b) and f(x) must be monotonic between a and b!");
        return ;
    }

    i=0;
    double fxmxfxa;
    double fm;
    while((b-a)>eps && i<nmax && fparserfxa_EvalError==0 && fparserfxb_EvalError==0 && fparserfxm_EvalError==0)
    {
        valsa[0]=a;
        valsb[0]=b;
        xm=(a+b)/2;
        valsxm[0]=xm;
        fa=fparserfx.Eval(valsa);
        fparserfxa_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfxa_EvalError,"f(x=a)",a,ndecimaux);
        fm=fparserfx.Eval(valsxm);
        fparserfxm_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfxm_EvalError,"f(x=xm)",xm,ndecimaux);

        fxmxfxa=fm*fa;
        emit requestXiBS(i,a,b,xm,fxmxfxa);
        if(fxmxfxa>0)
        {
            a=xm;
        }
        else
        {
            b=xm;
        }
        i+=1;
    }

    if(fparserfxa_EvalError==0 && fparserfxb_EvalError==0 && fparserfxm_EvalError==0 && i<nmax && !std::isnan(xm) && !std::isnan(fparserfx.Eval(valsa))&& !std::isnan(fparserfx.Eval(valsb)) && xm!=std::numeric_limits<double>::infinity() && xm!=-std::numeric_limits<double>::infinity()){
        emit requestSelectEndtable_nonlineareqt();
        emit requestDialog_nonlineareqt("Results",tr("The method converges to x=")+
                                                       QString::number(xm,'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlineareqt("Results",
                                        tr("The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                           "Maybe you need to change a or/and b or increase the precision or the max number of iterations!"));
    }else if(fparserfxa_EvalError!=0 || fparserfxb_EvalError!=0 || fparserfxm_EvalError!=0){
        message+=tr(" (Incorrect data!)");
        emit requestDialog_nonlineareqt("Results",message);
    }else{
        emit requestDialog_nonlineareqt("Results",tr("The method does not converge: Maybe you need to change a or/and b"));
    }
}
void CalculHaf::hafresolutioneqtnonlineaire_fausseposition(QString fx, double a, double b,double eps,int nmax,int ndecimaux)
{

    if(a==std::numeric_limits<double>::infinity() || a==-std::numeric_limits<double>::infinity() ||
        b==std::numeric_limits<double>::infinity() || b==-std::numeric_limits<double>::infinity()
        ){
        emit requestDialog_nonlineareqt("Error","The value of a or/and b exceeds the permissible limits!");
        return ;
    }

    while(true)
    {
        int res = fparserfx.Parse(fx.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfx.ErrorMsg())!=0){
            emit requestDialog_nonlineareqt("Error in f(x)",fparserfx.ErrorMsg());
            qDebug() << fparserfx.ErrorMsg();
            return;
            /// break ;
        }
        qDebug() << std::string(res+7, ' ') << "^\n"
                 << fparserfx.ErrorMsg() << "\n\n";
    }

    valsa[0]=a;
    valsb[0]=b;
    double fa=fparserfx.Eval(valsa);
    fparserfxa_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfxa_EvalError,"f(x=a)",a,ndecimaux);
    double fb=fparserfx.Eval(valsb);
    fparserfxb_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfxb_EvalError,"f(x=b)",b,ndecimaux);
    double r=b-fb*(a-b)/(fa-fb);
    valsr[0]=r;
    double faxfb=fa*fb;

    if ((faxfb>=0 || a>=b) && (fparserfxa_EvalError==0 && fparserfxb_EvalError==0))
    {
        emit requestDialog_nonlineareqt("Error",
                                        tr("It is necessary that (f(a)*f(b)<0 ; a<b) and f(x) must be monotonic between a and b!"));
        return ;
    }

    double fxaxfxr;
    double fxbxfxr;
    i=0;
    double fr=fparserfx.Eval(valsr);
    fparserfxr_EvalError=fparserfx.EvalError();
    EvalErrorfunHAF(fparserfxr_EvalError,"f(x=r)",r,ndecimaux);

    while(fabs(fr)>eps && i<nmax && fparserfxr_EvalError==0)
    {
        fa=fparserfx.Eval(valsa);
        fparserfxa_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfxa_EvalError,"f(x=a)",a,ndecimaux);
        fb=fparserfx.Eval(valsb);
        fparserfxb_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfxb_EvalError,"f(x=b)",b,ndecimaux);
        r=b-fb*(a-b)/(fa-fb);
        valsr[0]=r;
        fr=fparserfx.Eval(valsr);
        fparserfxr_EvalError=fparserfx.EvalError();
        EvalErrorfunHAF(fparserfxr_EvalError,"f(x=r)",r,ndecimaux);

        fxaxfxr=fa*fr;
        fxbxfxr=fb*fr;
        emit requestXiRF(i,a,b,r,fxaxfxr,fxbxfxr);

        if (fxaxfxr < 0)
            b=r;
        else if (fxbxfxr < 0)
            a=r;

        valsa[0]=a;
        valsb[0]=b;
        i+=1;
    }

    if(fparserfxa_EvalError==0 && fparserfxb_EvalError==0 && fparserfxr_EvalError==0 && i<nmax && !std::isnan(r)&& !std::isnan(fparserfx.Eval(valsr)) && r!=std::numeric_limits<double>::infinity() && r!=-std::numeric_limits<double>::infinity()){
        emit requestSelectEndtable_nonlineareqt();
        emit requestDialog_nonlineareqt("Results",tr("The method converges to x=")+
                                                       QString::number(r,'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlineareqt("Results",
                                        tr("The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                           "Maybe you need to change a or/and b or increase the precision or the max number of iterations!"));
    }else if(fparserfxa_EvalError!=0 || fparserfxb_EvalError!=0 || fparserfxr_EvalError!=0){
        message+=tr(" (Incorrect data!)");
        emit requestDialog_nonlineareqt("Results",message);
    }else{
        emit requestDialog_nonlineareqt("Results",
                                        tr("The method does not converge: Maybe you need to change a or/and b"));
    }
}

void CalculHaf::hafresolutioneqtdifferentielle_Kutta_Merson(QString yprim, double a, double b,double dx_edoeqt,int ya_edoeqt,int n,int ndecimaux)
{
    while(true)
    {
        int res = fparseryprim.Parse(yprim.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparseryprim.ErrorMsg())!=0){
            emit requestDialog_edoeqt("Error in f(x,y)",fparseryprim.ErrorMsg());
            return ;
            // break ;
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparseryprim.ErrorMsg() << "\n\n";
    }

    double dx=(b-a)/(n-1);
    x[0]=a;
    y[0]=ya_edoeqt;
    i=0;

    emit  requestXiodeeqt(i,x[0],y[0]);

    double k1,k2,k3,k4,k5;
    for (i = 1 ; i <n ; i++){
        x[i]=x[0]+i*dx;
    }

    for (i=1; i<n; i++){
        double variablesk1[2] = {x[i-1],y[i-1]};
        k1=1./3*dx*fparseryprim.Eval(variablesk1);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        double variablesk2[2] = {x[i-1],y[i-1]+k1};
        k2=1./3*dx*fparseryprim.Eval(variablesk2);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        double variablesk3[2] = {x[i-1],y[i-1]+k2/2+k2/2};
        k3=1./3*dx*fparseryprim.Eval(variablesk3);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        double variablesk4[2] = {x[i-1],y[i-1]+3./8*k1+9./3*k3};
        k4=1./3*dx*fparseryprim.Eval(variablesk4);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        double variablesk5[2] = {x[i-1],y[i-1]+3./2*k1-9./2*k3+6*k4};
        k5=1./3*dx*fparseryprim.Eval(variablesk5);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        error_truncation[i]=0.2*k1-0.9*k3+0.8*k4-0.1*k5;
        y[i]=y[i-1]+1/2.*(k1+4*k4+k5);

        emit  requestXiodeeqt(i,x[i],y[i]);
    }

}
void CalculHaf::hafresolutioneqtdifferentielle_Runge_Kutta(QString yprim, double a, double b,double dx_edoeqt,int ya_edoeqt,int n,int ndecimaux)
{

    while(true)
    {
        int res = fparseryprim.Parse(yprim.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparseryprim.ErrorMsg())!=0){
            emit requestDialog_edoeqt("Error in f(x,y)",fparseryprim.ErrorMsg());
            return ;
            // break ;
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparseryprim.ErrorMsg() << "\n\n";
    }

    double dx=(b-a)/(n-1);
    x[0]=a;
    y[0]=ya_edoeqt;
    i=0;

    emit  requestXiodeeqt(i,x[0],y[0]);

    double k1,k2,k3,k4;
    for (i = 1 ; i <n ; i++){
        x[i]=x[0]+i*dx;
    }
    for (i=1; i<n; i++){

        double variablesk1[2] = {x[i-1],y[i-1]};
        k1=dx*fparseryprim.Eval(variablesk1);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);

        double variablesk2[2] = {x[i-1]+dx/2,y[i-1]+k1/2};
        k2=dx*fparseryprim.Eval(variablesk2);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1]+dx/2,ndecimaux);

        double variablesk3[2] = {x[i-1]+dx/2,y[i-1]+k2/2};
        k3=dx*fparseryprim.Eval(variablesk3);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1]+dx/2,ndecimaux);

        double variablesk4[2] = {x[i-1]+dx,y[i-1]+k3};
        k4=dx*fparseryprim.Eval(variablesk4);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1]+dx,ndecimaux);

        y[i]=y[i-1]+1/6.*(k1+2*k2+2*k3+k4);

        emit  requestXiodeeqt(i,x[i],y[i]);
    }
}
void CalculHaf::hafresolutioneqtdifferentielle_Euler_explicite(QString yprim, double a, double b,double dx_edoeqt,int ya_edoeqt,int n,int ndecimaux)
{
    while(true)
    {
        int res = fparseryprim.Parse(yprim.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparseryprim.ErrorMsg())!=0){
            emit requestDialog_edoeqt("Error in f(x,y)",fparseryprim.ErrorMsg());
            return ;
            // break ;
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparseryprim.ErrorMsg() << "\n\n";
    }

    double dx=(b-a)/(n-1);
    x[0]=a;
    y[0]=ya_edoeqt;
    i=0;
    emit  requestXiodeeqt(i,x[0],y[0]);

    for (i = 1 ; i <n ; i++){
        x[i]=x[0]+i*dx;
    }
    for (i=1; i<n; i++){
        double variables[] = {x[i-1],y[i-1]};
        y[i]=y[i-1]+dx*fparseryprim.Eval(variables);
        fparseryprim_EvalError=fparseryprim.EvalError();
        EvalErrorfunHAF(fparseryprim_EvalError,"f(x,y)",x[i-1],ndecimaux);
        emit  requestXiodeeqt(i,x[i],y[i]);
    }
}

/// Intergation
void CalculHaf::hafafficherIntegration(QString fxintegrale,QVariantList tabArrayxiyi_inteqt ,double a, double b,double ntab,double nfx,bool usefx, bool fullTableView,int ndecimaux,int method)
{
    int k;
    int n;
    double dx;
    I[0]=0;
    fparserfxintegrale_EvalError=0;
    while(true)
    {
        int res = fparserfxintegrale.Parse(fxintegrale.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfxintegrale.ErrorMsg())!=0){
            emit requestDialog_inteqt("Error in f(x)",fparserfxintegrale.ErrorMsg());
            break ;
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserfxintegrale.ErrorMsg() << "\n\n";
    }

    QString textAffichageResultats_inteqt;

    if (usefx){
        n=nfx;
        dx=(b-a)/(n-1);
    }else{
        n=ntab;
        dx=(b-a)/(n-1);
    }

    if (usefx){///use fx
        double vals[1];
        for(i=0; i<n; i++)
        {
            vals[0]=a+i*dx;
            x[i]=vals[0];
            y[i]=fparserfxintegrale.Eval(vals);
            fparserfxintegrale_EvalError=fparserfxintegrale.EvalError();
            EvalErrorfunHAF(fparserfxintegrale_EvalError,"f(x)",x[i],ndecimaux);
            if (fparserfxintegrale_EvalError!=0) { textAffichageResultats_inteqt=".....";return;}
        }
    }else{///use table
        for(i=0; i<n; i++)
        {
            // qDebug() << "tabArrayxiyi_inteqt="<< "^\n"
            //          << tabArrayxiyi_inteqt[i].toList().at(1) << "\n\n";
            x[i]=tabArrayxiyi_inteqt[i].toList().at(0).toFloat();
            y[i]=tabArrayxiyi_inteqt[i].toList().at(1).toFloat();
        }
        // for(i=0; i<n; i++)
        // {
        //     qDebug() << "x[i]="<< "^\n"
        //              << x[i] << "\n\n";
        //     qDebug() << "y[i]="<< "^\n"
        //              << y[i] << "\n\n";
        // }
    }

    if (method==0){
        for (i=0; i<n; i++)
        {
            I[i+1]=I[i]+dx/2*(y[i]+y[i+1]);
            if (usefx){
                textAffichageResultats_inteqt="The integral of f(x)="+fxintegrale+" between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the trapezoidal method is equal to "+QString::number(I[i]);
            }else{
                textAffichageResultats_inteqt="The integral (according to the table above) between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the trapezoidal method is equal to "+QString::number(I[i]);
            }
        }
        if ((fullTableView && usefx) || !usefx){
            emit requestCleartable_inteqt();
            for (i=0; i<n; i++)
            {
                emit requestXinteqt(QString::number(x[i]),QString::number(y[i]),QString::number(I[i]));
            }
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }else{
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }
    }
    if (method==1){
        k=0;
        for (i=0; i<n-2; i+=2)
        {
            I[k+1]=I[k]+dx/3*(y[i]+4*y[i+1]+y[i+2]);
            k+=1;
            if (usefx){
                textAffichageResultats_inteqt="The integral of f(x)="+fxintegrale+" between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the SIMPSON 1/3 method is equal to "+QString::number(I[k]);
            }else{
                textAffichageResultats_inteqt="The integral (according to the table above) between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the SIMPSON 1/3 method is equal to "+QString::number(I[k]);
            }
        }
        // for (k=0; k<=n/2; k+=1)
        // {
        //     qDebug()<<"k="<<k<<" et I[k]="<<I[k];
        // }
        if ((fullTableView && usefx) || !usefx){
            emit requestCleartable_inteqt();
            for (i=0; i<n; i++)
            {
                emit requestXinteqt(QString::number(x[i]),QString::number(y[i]),"...");
            }
            k=0;
            emit requestIjSimpinteqt(0,QString::number(0));
            for (i=0; i<n-2; i+=2)
            {
                emit requestIjSimpinteqt(i+2,QString::number(I[k+1]));
                k+=1;
            }
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }else{
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }
    }
    if (method==2){
        k=0;
        for (i=0; i<n-3; i+=3)
        {
            I[k+1]=I[k]+3*dx/8*(y[i]+3*y[i+1]+3*y[i+2]+y[i+3]);
            k+=1;
            if (usefx){
                textAffichageResultats_inteqt="The integral of f(x)="+fxintegrale+" between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the SIMPSON 3/8 method is equal to "+QString::number(I[k]);
            }else{
                textAffichageResultats_inteqt="The integral (according to the table above) between "+QString::number(a)+" and "+QString::number(b)+" with a step of "+QString::number(dx)+ " by the SIMPSON 3/8 method is equal to "+QString::number(I[k]);
            }
        }
        // for (k=0; k<=n/3; k+=1)
        // {
        //     qDebug()<<"k="<<k<<" et I[k]="<<I[k];
        // }
        if ((fullTableView && usefx) || !usefx){
            emit requestCleartable_inteqt();
            for (i=0; i<n; i++)
            {
                emit requestXinteqt(QString::number(x[i]),QString::number(y[i]),"...");
            }
            k=0;
            emit requestIjSimpinteqt(0,QString::number(0));
            for (i=0; i<n-3; i+=3)
            {
                emit requestIjSimpinteqt(i+3,QString::number(I[k+1]));
                k+=1;
            }
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }else{
            emit requestDialog_inteqt("Results",textAffichageResultats_inteqt);
            emit requesttextAffichageResultats_inteqt(textAffichageResultats_inteqt);
        }
    }
    emit requestSelectEndtable_inteqt();
}
void CalculHaf::hafplot(QString fxplot, double a, double b,double n,int ndecimaux)
{
    fparserfxplot_EvalError=0;
    while(true)
    {
        int res = fparserfxplot.Parse(fxplot.toStdString(), "x");
        if(res < 0) break;
        if (strlen(fparserfxplot.ErrorMsg())!=0){
            emit requestDialog_plot("Error in f(x)",fparserfxplot.ErrorMsg());
            break ;
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserfxplot.ErrorMsg() << "\n\n";
    }


    double dx=(b-a)/(n-1);
    double vals[1];
    for(i=0; i<n; i++)
    {
        vals[0]=a+i*dx;
        x[i]=vals[0];
        y[i]=fparserfxplot.Eval(vals);
        fparserfxplot_EvalError=fparserfxplot.EvalError();
        EvalErrorfunHAF(fparserfxplot_EvalError,"f(x)",x[i],ndecimaux);
        if (fparserfxplot_EvalError!=0) { return;}
    }

    emit requestCleartable_plot();
    for (i=0; i<n; i++)
    {
        emit requestXY_plot(QString::number(x[i]),QString::number(y[i]),QString::number(dx,'f',ndecimaux));
    }
}
void CalculHaf::hafresolutionsysteqtlineaire_Gauss(QVariantList tabArrayxiyidata_linearsyst,int n )
{
    outputtext="";
    double a[10][10],c,x[10]={0};
    for(i=0;i<n;i++)
    {
        for(j=0;j<=n;j++)
        {
            a[i][j]=tabArrayxiyidata_linearsyst[i].toList().at(j).toFloat();
            /// qDebug() << "A["<<i<<"]["<<j<<"]="<< a[i][j] << "\n\n";
        }
    }
    //Transformation en matrice triangulaire supérieure//
    //*Processus d'élimination avant*//
    for(k=0;k<n-1;k++)for(i=k+1;i<=n-1;i++)
        {
            if(a[k][k]==0) {
                ///SysteqtsLineaires_textBrowser->clear();
                for( j = 0;j<=n;++j){
                    ///tableWidget_matrice_triangulaire_sup->setItem(0,j,new QTableWidgetItem(QString::number(a[0][j])));
                }
                indexRowPivotNul=k;
                if (indexRowPivotNul==0){
                    for(i = 0;i<n;++i){
                        for( j = 0;j<=n;++j){
                        }
                    }
                }
                emit requestDialog_linearsyst("Error!","The pivot is null, so the line permutation can solve the issue!");
                emit requesttextAffichageResultats_linearsyst("");
                goto fin2;
            }
            c=(a[i][k]/a[k][k]) ;
            for(j=k;j<=n;j++){
                a[i][j]-=c*a[k][j];
                if (j<i) {
                    if (abs(a[i][j])<numeric_limits<double>::epsilon()
                        || a[i][j]-(int)(a[i][j]/
                                            numeric_limits<double>::epsilon())*numeric_limits<double>::epsilon()==0) a[i][j]=0;// pb mulitple de eps (fmod)c++ 21-7-2021
                }
            }
        }
    //*Matrice triangulaire supérieure*//
    for(i=0;i<n;i++){
        if (n==2) {emit requestMatriTriaSupn2_linearsyst(QString::number(a[i][0]),QString::number(a[i][1]),QString::number(a[i][2]));}
        if (n==3) {emit requestMatriTriaSupn3_linearsyst(QString::number(a[i][0]),QString::number(a[i][1]),QString::number(a[i][2]),QString::number(a[i][3]));}
        if (n==4) {emit requestMatriTriaSupn4_linearsyst(QString::number(a[i][0]),QString::number(a[i][1]),QString::number(a[i][2]),QString::number(a[i][3]),QString::number(a[i][4]));}
        if (n==5) {emit requestMatriTriaSupn5_linearsyst(QString::number(a[i][0]),QString::number(a[i][1]),QString::number(a[i][2]),QString::number(a[i][3]),QString::number(a[i][4]),QString::number(a[i][5]));}
    }
    //*Substitution arrière*//
    //a[n-1][n] est b(n)
    if(a[n-1][n-1]==0) {
        emit requestDialog_linearsyst("Error!","The pivot is null, so the line permutation can solve the issue!");
        emit requesttextAffichageResultats_linearsyst("");
        goto fin2;
    }
    x[n-1]=a[n-1][n]/a[n-1][n-1];
    for(i=n-2;i>=0;i--)
    {c=0;for(j=i;j<=n-1;j++){
            c=c+a[i][j]*x[j];}
        x[i]=(a[i][n]-c)/a[i][i];}
    //*Affichage des résultats*//
    outputtext+=tr("The solution of the system by the Gaussian Elimination (Pivoting) method is: \n");
    for(i=0;i<n;i++){
        outputtext+="x"+QString::number(i+1)+"="+QString::number(x[i])+"   ";
    }

    emit requesttextAffichageResultats_linearsyst(outputtext);
    emit requestDialog_linearsyst("Results:",outputtext);

fin2:;

}
void CalculHaf::hafresolutionsysteqtlineaire_Gauss_Seidel(QVariantList tabArrayxiyidata_linearsyst,QVariantList tabArrayxo_linearsyst,int n,double maxitera_linearsyst,double tolerance_linearsyst)
{
    outputtext="";
    okToleranceReache_GaussSeidel=false;
    double a[10][10], b[10], m[10], x[10]={0}, e[10]={0}, xold[10]={0};
    int q;

    for(i=0;i<n;i++)
    {
        m[i]=tabArrayxo_linearsyst[0].toList().at(i).toFloat();
        qDebug() << "m["<<i<<"]="<< m[i] << "\n\n";

        for(j=0;j<=n;j++)
        {
            if (j==n){
                b[i]=tabArrayxiyidata_linearsyst[i].toList().at(j).toFloat();
                ///qDebug() << "b["<<i<<"]="<< b[i] << "\n\n";
            }else{
                a[i][j]=tabArrayxiyidata_linearsyst[i].toList().at(j).toFloat();
                ///qDebug() << "A["<<i<<"]["<<j<<"]="<< a[i][j] << "\n\n";
            }
        }
    }

    headtextH_SystEqtLineares_Gauss_Seidel+="MaxErreur";
    //cout << "\nEnter the no. of iteration : ";
    outputtext=tr("The solution of the system by the Gauss-Seidel method is: \n");

    q=maxitera_linearsyst;
    iter=0;
    for (i = 0; i < n; i++) {
        xold[i]=m[i];
    }
    double S;
    while (q > 0 ) {
        iter=iter+1;

        for (i = 0; i < n; i++) {
            S=0;
            for (j = 0; j < n; j++) {
                if (j < i)
                    S+=a[i][j] * x[j];
                if (j > i)
                    S+=a[i][j] * xold[j];
            }
            x[i] = (b[i] - S)/a[i][i] ;
        }

        for (i = 0; i < n; i++) {
            e[i]=fabs(x[i]-xold[i]);
            xold[i]=x[i];
        }
        Maxe=e[0];
        for(i = 0; i < n; i++)
        {
            if(e[i]>Maxe){
                Maxe=e[i];
            }
        }

        if (n==2) {emit requestMatriTriaSupn2GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(Maxe));}
        if (n==3) {emit requestMatriTriaSupn3GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(Maxe));}
        if (n==4) {emit requestMatriTriaSupn4GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(x[3]),QString::number(Maxe));}
        if (n==5) {emit requestMatriTriaSupn5GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(x[3]),QString::number(x[4]),QString::number(Maxe));}

        for (i = 0; i < n; i++) {
            qDebug() << "x["<<i<<"];  iter="<<iter<<" "<< QString::number(x[i]) << "\n\n";
        }

        if (Maxe<tolerance_linearsyst){
            okToleranceReache_GaussSeidel=true;
            break;
        }else{
            q--;
        }
    }
    //     //*Affichage des résultats*//
    if (okToleranceReache_GaussSeidel && !std::isnan(Maxe)){
        emit requestDialog_linearsyst("Results:","The precision condition is well respected after "+
                                                      QString::number(iter,'i',0)+ tr(" iterations!"));
        for (i = 0; i < n; i++) {
            outputtext+="x"+QString::number(i+1)+"="+QString::number(x[i])+"   ";
        }
        outputtext+=tr("\nafter ")+QString::number(iter,'i',0)+ tr(" iterations!");
        emit requesttextAffichageResultats_linearsyst(outputtext);
        emit requestDialog_linearsyst("Results:",outputtext);
        emit requestSelectEndtable_linearsyst();
    }else{
        emit requestDialog_linearsyst("Results:","The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                                  "Check the convergence condition of the method or increase the maximum number of iterations!.");
        emit requesttextAffichageResultats_linearsyst("");
    }

}
void CalculHaf::hafresolutionsysteqtlineaire_Jacobi(QVariantList tabArrayxiyidata_linearsyst,QVariantList tabArrayxo_linearsyst,int n,double maxitera_linearsyst,double tolerance_linearsyst)
{
    outputtext="";
    okToleranceReache_GaussSeidel=false;
    double a[10][10], b[10], m[10], x[10]={0}, e[10]={0}, xold[10]={0};
    int q;

    for(i=0;i<n;i++)
    {
        m[i]=tabArrayxo_linearsyst[0].toList().at(i).toFloat();
        qDebug() << "m["<<i<<"]="<< m[i] << "\n\n";

        for(j=0;j<=n;j++)
        {
            if (j==n){
                b[i]=tabArrayxiyidata_linearsyst[i].toList().at(j).toFloat();
                ///qDebug() << "b["<<i<<"]="<< b[i] << "\n\n";
            }else{
                a[i][j]=tabArrayxiyidata_linearsyst[i].toList().at(j).toFloat();
                ///qDebug() << "A["<<i<<"]["<<j<<"]="<< a[i][j] << "\n\n";
            }
        }
    }

    headtextH_SystEqtLineares_Gauss_Seidel+="MaxErreur";
    outputtext=tr("The solution of the system by the Jacobi method is: \n");

    q=maxitera_linearsyst;
    iter=0;
    for (i = 0; i < n; i++) {
        xold[i]=m[i];
    }
    double S;
    while (q > 0 ) {
        iter=iter+1;
        for (i = 0; i < n; i++) {
            S=0;
            for (j = 0; j < n; j++) {
                if (j == i)
                    continue;
                S+=a[i][j] * xold[j];
            }
            x[i] = (b[i] - S)/a[i][i] ;
        }
        for (i = 0; i < n; i++) {
            e[i]=fabs(x[i]-xold[i]);
            xold[i]=x[i];
        }
        Maxe=e[0];
        for(i = 0; i < n; i++)
        {
            if(e[i]>Maxe){
                Maxe=e[i];
            }
        }

        headtextV_SystEqtLineares_Gauss_Seidel+="Itér("+ QString::number(iter-1)+")";

        if (n==2) {emit requestMatriTriaSupn2GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(Maxe));}
        if (n==3) {emit requestMatriTriaSupn3GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(Maxe));}
        if (n==4) {emit requestMatriTriaSupn4GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(x[3]),QString::number(Maxe));}
        if (n==5) {emit requestMatriTriaSupn5GSJaco_linearsyst(QString::number(x[0]),QString::number(x[1]),QString::number(x[2]),QString::number(x[3]),QString::number(x[4]),QString::number(Maxe));}

        if (Maxe<tolerance_linearsyst){
            okToleranceReache_GaussSeidel=true;
            break;
        }else{
            q--;
        }
    }
    //*Affichage des résultats*//
    headtextV_SystEqtLineares_Gauss_Seidel+="Itér("+ QString::number(iter)+")";

    if (okToleranceReache_GaussSeidel && !std::isnan(Maxe)){
        emit requestDialog_linearsyst("Results:","The precision condition is well respected after "+
                                                      QString::number(iter,'i',0)+ tr(" iterations!"));
        for (i = 0; i < n; i++) {
            outputtext+="x"+QString::number(i+1)+"="+QString::number(x[i])+"   ";
        }
        outputtext+=tr("\nafter ")+QString::number(iter,'i',0)+ tr(" iterations!");
        emit requesttextAffichageResultats_linearsyst(outputtext);
        emit requestDialog_linearsyst("Results:",outputtext);
        emit requestSelectEndtable_linearsyst();
    }else{
        emit requestDialog_linearsyst("Results:","The maximum number of iterations has been reached without any solution satisfying the precision could be found: "
                                                  "Check the convergence condition of the method or increase the maximum number of iterations!.");
        emit requesttextAffichageResultats_linearsyst("");
    }

}
void CalculHaf::hafresolutionSysteqtnonlineaire_ptfixe(QString f1xy,QString f2xy, QString g1y, QString g2x, double x0, double y0, double eps, int nmax, int ndecimaux)
{
    i=0;
    double x[nmax];
    x[0]=x0;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Error!","The value of x0 exceeds the permissible limits!");
        return ;
    }
    double y[nmax];
    y[0]=y0;
    if(y[0]==std::numeric_limits<double>::infinity() || y[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Error!","The value of y0 exceeds the permissible limits!");
        return ;
    }

    while(true)
    {
        int res = fparserf1xy.Parse(f1xy.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf1xy.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in f1(x,y)",fparserf1xy.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserf1xy.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserf2xy.Parse(f2xy.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf2xy.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in f2(x,y)",fparserf2xy.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserf2xy.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserg1y.Parse(g1y.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserg1y.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in g1(x,y)",fparserg1y.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserg1y.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserg2x.Parse(g2x.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserg2x.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in g2(x,y)",fparserg2x.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserg2x.ErrorMsg() << "\n\n";
    }
    ///////////////
    valsxy[0]=x[0];
    valsxy[1]=y[0];

    emit requestXiPF_nonlinearsyst(QString::number(i),QString::number(x[i],'f',ndecimaux),QString::number(y[i],'f',ndecimaux),QString::number(fparserf1xy.Eval(valsxy),'f',ndecimaux),QString::number(fparserf2xy.Eval(valsxy),'f',ndecimaux));

    fparserf1xy_EvalError=fparserf1xy.EvalError();
    EvalErrorfunHAFxy(fparserf1xy_EvalError,"f1(x,y)",x[i], y[i],ndecimaux);
    fparserf2xy_EvalError=fparserf2xy.EvalError();
    EvalErrorfunHAFxy(fparserf2xy_EvalError,"f2(x,y)",x[i], y[i],ndecimaux);

    fparserg1y_EvalError=0;
    fparserg2x_EvalError=0;

    while (!(fabs(fparserf1xy.Eval(valsxy))<eps && fabs(fparserf2xy.Eval(valsxy))<eps) && i<nmax && fparserf1xy_EvalError==0 && fparserf2xy_EvalError==0 && fparserg1y_EvalError==0 && fparserg2x_EvalError==0)
    {
        valsxy[0]= x[i];
        valsxy[1]= y[i];

        x[i+1]=fparserg1y.Eval(valsxy);

        valsxy[0]= x[i+1];
        valsxy[1]= y[i];
        y[i+1]=fparserg2x.Eval(valsxy);
        /////cout<< "x("<<i<<")="<<x[i]<<" et y("<<i<<")="<< y[i]<<endl;

        fparserg1y_EvalError=fparserg1y.EvalError();
        EvalErrorfunHAFxy(fparserg1y_EvalError,"g1(x,y)",x[i],y[i],ndecimaux);
        fparserg2x_EvalError=fparserg2x.EvalError();
        EvalErrorfunHAFxy(fparserg2x_EvalError,"g2(x,y)",x[i],y[i],ndecimaux);

        valsxy[0]= x[i+1];
        valsxy[1]= y[i+1];

        emit requestXiPF_nonlinearsyst(QString::number(i+1),QString::number(x[i+1],'f',ndecimaux),QString::number(y[i+1],'f',ndecimaux),QString::number(fparserf1xy.Eval(valsxy),'f',ndecimaux),QString::number(fparserf2xy.Eval(valsxy),'f',ndecimaux));

        fparserf1xy_EvalError=fparserf1xy.EvalError();
        EvalErrorfunHAFxy(fparserf1xy_EvalError,"f1(x,y)",x[i], y[i],ndecimaux);
        fparserf2xy_EvalError=fparserf2xy.EvalError();
        EvalErrorfunHAFxy(fparserf2xy_EvalError,"f2(x,y)",x[i], y[i],ndecimaux);
        i=i+1;
        if(std::isnan(x[i]) ||
            std::isnan(y[i]) || std::isnan(fparserf1xy.Eval(valsxy)) || std::isnan(fparserf2xy.Eval(valsxy)) ||
            x[i]==std::numeric_limits<double>::infinity() || x[i]==-std::numeric_limits<double>::infinity() ||
            y[i]==std::numeric_limits<double>::infinity() || y[i]==-std::numeric_limits<double>::infinity()){
            break;
        }
    }
    if(fparserf1xy_EvalError==0 && fparserf2xy_EvalError==0 && fparserg1y_EvalError==0 && fparserg2x_EvalError==0 && i<nmax && !std::isnan(x[i]) && !std::isnan(y[i]) && !std::isnan(fparserf1xy.Eval(valsxy))&& !std::isnan(fparserf2xy.Eval(valsxy)) && x[i]!=std::numeric_limits<double>::infinity() && x[i]!=-std::numeric_limits<double>::infinity()&& y[i]!=std::numeric_limits<double>::infinity() && y[i]!=-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Results:",tr("The method converges to x=")+
                                                         QString::number(x[i],'f',ndecimaux)+tr(" and to y=")+
                                                         QString::number(y[i],'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlinearsyst("Results:",tr("The maximum number of iterations has been reached without any satisfactory solution the tolerance could be found:\n"
                                                        "Maybe you need to change g1(x,y) or/and g2(x,y) or/and x0 or/and y0! (or increase the tolerance or the maximum number of iterations)\n"
                                                        "Check the convergence condition of the method!"));
    }else if(fparserf1xy_EvalError!=0 || fparserf2xy_EvalError!=0 || fparserg1y_EvalError!=0 || fparserg2x_EvalError!=0){
        emit requestDialog_nonlinearsyst("Results:",tr("Incorrect data!"));
    }else{
        emit requestDialog_nonlinearsyst("Results:",tr("The method diverges: Maybe you need to change g1(x,y) or/and g2(x,y) or/and x0 or/and y0!"));
    }
    emit requestSelectEndtable_nonlinearsyst();
}
void CalculHaf::hafresolutionSysteqtnonlineaire_newtonraphson(QString f1xy,QString f2xy, QString f1xyprime, QString f2xyprime, double x0, double y0, double eps, int nmax, int ndecimaux)
{
    i=0;
    double x[nmax];
    x[0]=x0;
    if(x[0]==std::numeric_limits<double>::infinity() || x[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Error!","The value of x0 exceeds the permissible limits!");
        return ;
    }
    double y[nmax];
    y[0]=y0;
    if(y[0]==std::numeric_limits<double>::infinity() || y[0]==-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Error!","The value of y0 exceeds the permissible limits!");
        return ;
    }

    while(true)
    {
        int res = fparserf1xy.Parse(f1xy.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf1xy.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in f1(x,y)",fparserf1xy.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserf1xy.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserf2xy.Parse(f2xy.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf2xy.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in f2(x,y)",fparserf2xy.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserf2xy.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserf1xyprime.Parse(f1xyprime.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf1xyprime.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in df1(x,y)/dx",fparserf1xyprime.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserg1y.ErrorMsg() << "\n\n";
    }
    while(true)
    {
        int res = fparserf2xyprime.Parse(f2xyprime.toStdString(), "x,y");
        if(res < 0) break;
        if (strlen(fparserf2xyprime.ErrorMsg())!=0){
            emit requestDialog_nonlinearsyst("Error in df2(x,y)/dx",fparserf2xyprime.ErrorMsg());
            // break ;
            return ; // HAF 1-8-2020
        }
        std::cout << std::string(res+7, ' ') << "^\n"
                  << fparserg2x.ErrorMsg() << "\n\n";
    }
    ///////////////
    valsxy[0]=x[0];
    valsxy[1]=y[0];

    emit requestXiNR_nonlinearsyst(QString::number(i),QString::number(x[i],'f',ndecimaux),QString::number(y[i],'f',ndecimaux),QString::number(fparserf1xy.Eval(valsxy),'f',ndecimaux),QString::number(fparserf2xy.Eval(valsxy),'f',ndecimaux));

    fparserf1xy_EvalError=fparserf1xy.EvalError();
    EvalErrorfunHAFxy(fparserf1xy_EvalError,"f1(x,y)",x[i], y[i],ndecimaux);
    fparserf2xy_EvalError=fparserf2xy.EvalError();
    EvalErrorfunHAFxy(fparserf2xy_EvalError,"f2(x,y)",x[i], y[i],ndecimaux);

    fparserf1xyprime_EvalError=0;
    fparserf2xyprime_EvalError=0;

    /////cout<< "x("<<i<<")="<<x[i]<<" et y("<<i<<")="<< y[i]<<endl;

    while (!(fabs(fparserf1xy.Eval(valsxy))<eps && fabs(fparserf2xy.Eval(valsxy))<eps) && i<nmax && fparserf1xy_EvalError==0 && fparserf2xy_EvalError==0 && fparserf1xyprime_EvalError==0 && fparserf2xyprime_EvalError==0)
    {
        valsxy[0]= x[i];
        valsxy[1]= y[i];
        x[i+1]=x[i]-fparserf1xy.Eval(valsxy)/fparserf1xyprime.Eval(valsxy);
        valsxy[0]= x[i+1];
        valsxy[1]= y[i];
        y[i+1]=y[i]-fparserf2xy.Eval(valsxy)/fparserf2xyprime.Eval(valsxy);

        /////cout<< "x("<<i<<")="<<x[i]<<" et y("<<i<<")="<< y[i]<<endl;

        fparserf1xyprime_EvalError=fparserf1xyprime.EvalError();
        EvalErrorfunHAFxy(fparserf1xyprime_EvalError,"df1(x,y)/dx",x[i],y[i],ndecimaux);
        fparserf2xyprime_EvalError=fparserf2xyprime.EvalError();
        EvalErrorfunHAFxy(fparserf2xyprime_EvalError,"df2(x,y)/dy",x[i],y[i],ndecimaux);

        valsxy[0]= x[i+1];
        valsxy[1]= y[i+1];

        emit requestXiNR_nonlinearsyst(QString::number(i+1),QString::number(x[i+1],'f',ndecimaux),QString::number(y[i+1],'f',ndecimaux),QString::number(fparserf1xy.Eval(valsxy),'f',ndecimaux),QString::number(fparserf2xy.Eval(valsxy),'f',ndecimaux));

        fparserf1xy_EvalError=fparserf1xy.EvalError();
        EvalErrorfunHAFxy(fparserf1xy_EvalError,"f1(x,y)",x[i], y[i],ndecimaux);
        fparserf2xy_EvalError=fparserf2xy.EvalError();
        EvalErrorfunHAFxy(fparserf2xy_EvalError,"f2(x,y)",x[i], y[i],ndecimaux);
        i=i+1;
        if(std::isnan(x[i]) ||
            std::isnan(y[i]) || std::isnan(fparserf1xy.Eval(valsxy)) || std::isnan(fparserf2xy.Eval(valsxy)) ||
            x[i]==std::numeric_limits<double>::infinity() || x[i]==-std::numeric_limits<double>::infinity() ||
            y[i]==std::numeric_limits<double>::infinity() || y[i]==-std::numeric_limits<double>::infinity()){
            break;
        }
    }

    if(fparserf1xy_EvalError==0 && fparserf2xy_EvalError==0 && fparserf1xyprime_EvalError==0 && fparserf2xyprime_EvalError==0 && i<nmax && !std::isnan(x[i]) && !std::isnan(y[i]) && !std::isnan(fparserf1xy.Eval(valsxy))&& !std::isnan(fparserf2xy.Eval(valsxy)) && x[i]!=std::numeric_limits<double>::infinity() && x[i]!=-std::numeric_limits<double>::infinity()&& y[i]!=std::numeric_limits<double>::infinity() && y[i]!=-std::numeric_limits<double>::infinity()){
        emit requestDialog_nonlinearsyst("Results:",tr("The method converges to x=")+
                                                         QString::number(x[i],'f',ndecimaux)+tr(" and to y=")+
                                                         QString::number(y[i],'f',ndecimaux));
    }else if(i>=nmax){
        emit requestDialog_nonlinearsyst("Results:",tr("The maximum number of iterations has been reached without any satisfactory solution the tolerance could be found:\n"
                                                        "Maybe you need to increase the tolerance or max number of iterations\n"
                                                        "Maybe you need to change x0 or/and y0!\n"
                                                        "Maybe you need to swap the f1(x,y) with f2(x,y)!\n"
                                                        "Check the convergence condition of the (Jacobian) method!"));
    }else if(fparserf1xy_EvalError!=0 || fparserf2xy_EvalError!=0 || fparserf1xyprime_EvalError!=0 || fparserf2xyprime_EvalError!=0){
        ///tableWidget_donnees_Sysnonlineaire->clear();
        emit requestDialog_nonlinearsyst("Results:",tr("Incorrect data!"));
    }else{
        emit requestDialog_nonlinearsyst("Results:",tr("The method diverges: "
                                                        "Check the convergence condition of the method (Jacobian) or change x0 or/and y0!\n"
                                                        "or permute the functions f1(x,y) with f2(x,y)!\n"));
    }
    emit requestSelectEndtable_nonlinearsyst();
}
void CalculHaf::hafcalculApproximationPolynomiale_Lagrange(QVariantList tabArrayxiyi_polynoapproxi, int nbrePts_polynoapproxi, int id)
{
    for(i=0;i<nbrePts_polynoapproxi;i++)
    {
        xploy[i]=tabArrayxiyi_polynoapproxi[i].toList().at(0).toFloat();
        yploy[i]=tabArrayxiyi_polynoapproxi[i].toList().at(1).toFloat();

        ///qDebug() << "x["<<i<<"]="<< xploy[i] <<" ; " << "y["<<i<<"]="<< yploy[i] <<"\n\n";
    }

    outputtext="";
    n=nbrePts_polynoapproxi;

    m=n-1;
    ////
    for (i=0; i<=m; i++)
        s[i]=cof[i]=0.0;
    s[m] = -xploy[0];
    for (i=1; i<=m; i++)
    {
        for (j=m-i; j<=m-1; j++)
            s[j] -= xploy[i]*s[j+1];
        s[m] -= xploy[i];
    }
    for (j=0; j<=m; j++)
    {
        phi=m+1;
        for (k=m; k>=1; k--)
            phi=k*s[k]+xploy[j]*phi;
        ff=yploy[j]/phi;
        b=1.0;
        for (k=m; k>=0; k--)
        {
            cof[k] += b*ff;
            b=s[k]+xploy[j]*b;
        }
    }
    //for (i=m; i>=0; i--)
    //    qDebug()<<"cof["<<i<<"]="<<cof[i];
    //*Affichage des résultats*//
    switch (id) {
    case 0:
        outputtext+=tr("The coefficients of the Lagrange polynomial are: \n");
        break;
    case 1:
        outputtext+=tr("The coefficients of Newton's polynomial are: \n");
        break;
    }
    for (i=m; i>=0; i--){
        if (abs(cof[i])<numeric_limits<double>::epsilon()
            || cof[i]-(int)(cof[i]/
                               numeric_limits<double>::epsilon())*numeric_limits<double>::epsilon()==0) cof[i]=0; // pb mulitple de eps (fmod)c++ 21-7-2021
    }
    for(i=m; i>=0; i--){
        outputtext+="coef["+QString::number(m-i+1)+"]="+QString::number(cof[i])+"  ";
    }
    outputtext+="\n";
    outputtext+=tr("The polynomial is: P")+QString::number(m)+"(x)=";
    for(i=m; i>=0; i--){
        if (cof[i]>0 && i!=m && !(cof[i+1]==0 && i!=0)) outputtext+="+";
        if (cof[i]!=0 && QString::number(cof[i])!="1" && QString::number(cof[i])!="-1"){
            if (i==0){
                outputtext+=QString::number(cof[i]);
            }else{
                if (i==1){
                    outputtext+=QString::number(cof[i])+"*x";
                }else{
                    outputtext+=QString::number(cof[i])+"*x^"+QString::number(i);
                }
            }
        }else{
            if (QString::number(cof[i])=="1") {
                ///outputtext+="+";
                if (i==0){
                    outputtext+=QString::number(cof[i]);
                }else{
                    if (i==1){
                        outputtext+="x";
                    }else{
                        outputtext+="x^"+QString::number(i);
                    }
                }
            }
            if (QString::number(cof[i])=="-1") {
                if (i==0){
                    outputtext+=QString::number(cof[i]);
                }else{
                    if (i==1){
                        outputtext+="-x";
                    }else{
                        outputtext+="-x^"+QString::number(i);
                    }
                }
            }
        }
    }
    emit requesttextAffichageResultats_polynoapproxi(outputtext);
fin5:;

}
void CalculHaf::hafcalculApproximationPolynomiale_Newton(QVariantList tabArrayxiyi_polynoapproxi, int nbrePts_polynoapproxi, int id)
{
    for(i=0;i<nbrePts_polynoapproxi;i++)
    {
        xploy[i]=tabArrayxiyi_polynoapproxi[i].toList().at(0).toFloat();
        yploy[i]=tabArrayxiyi_polynoapproxi[i].toList().at(1).toFloat();

        /// qDebug() << "x["<<i<<"]="<< xploy[i] <<" ; " << "y["<<i<<"]="<< yploy[i] <<"\n\n";
    }
    hafcalculApproximationPolynomiale_Lagrange(tabArrayxiyi_polynoapproxi, nbrePts_polynoapproxi, 1);
    n=nbrePts_polynoapproxi;
    for(i=0;i<n;i++)
    {
        f[i][0]=yploy[i];

    }
    for(i=1;i<n;i++)
    {
        for( j = 1;j<=n;++j){
            f[i][j]= (f[i][j-1]-f[i-1][j-1])/(xploy[i]-xploy[i-j]);
            ///qDebug() << "f["<< i<< "]["<< j<< "]=" << f[i][j];
        }
    }
    for(i=0;i<n;i++)
    {
        for( j = 2;j<=n;++j){
            if (i>=j-1){
                ///qDebug() << "f["<< i<< "]["<< j<< "]=" << f[i][j-1];
                if (j==i+1) {
                    ///   tableWidget_donnees_ApproximationPolynomiale->item(i,j)->setBackground(hafcolorBackground);
                    ///  tableWidget_donnees_ApproximationPolynomiale->item(i,j)->setForeground(hafcolorForeground);
                }
            }
        }
    }
    j=0;
    for(i=0;i<n;i++)
    {
        emit request_polynoapproxi(QString::number(xploy[i]),QString::number(yploy[i]),number_to_qstring_HAF(f[i][j+1],i,j+1),number_to_qstring_HAF(f[i][j+2],i,j+2),number_to_qstring_HAF(f[i][j+3],i,j+3),number_to_qstring_HAF(f[i][j+4],i,j+4),number_to_qstring_HAF(f[i][j+5],i,j+5),number_to_qstring_HAF(f[i][j+6],i,j+6),number_to_qstring_HAF(f[i][j+7],i,j+7),number_to_qstring_HAF(f[i][j+8],i,j+8),number_to_qstring_HAF(f[i][j+9],i,j+9));
    }
}
QString CalculHaf::number_to_qstring_HAF(double xi,int i, int j)
{
    QString emptyqstring="";
    if (j>=i+1){
        return emptyqstring;
    }else{
        return QString::number(xi);
    }
}
void CalculHaf::nselonmethodechoisie(int n, int methodeindex_inteqt)
{
    const int m=99999; //le nbre max de lines dans le tableau x(i) et y(i).
    ///n=spinBox_nbre_pts_fx->text().toInt();
    if (methodeindex_inteqt==2)
    {
        int ksimp38[m];ksimp38[0]=4;
        for (i=1; i<m ;i++)
        {
            ksimp38[i]=3*i+4;
            if (n<=ksimp38[i])
            {
                n=ksimp38[i];
                goto finboucle1;
            }
        }
    finboucle1:;
        emit requestndxint(n,3,4);
        ///spinBox_nbre_pts_fx->setValue(n);
        ///spinBox_nbre_pts_fx->setSingleStep(3);
    }
    if (methodeindex_inteqt==1)
    {
        int ksimp13[m];ksimp13[0]=3;
        for (i=1; i<m ;i++)
        {
            ksimp13[i]=2*i+1;
            if (n<=ksimp13[i])
            {
                n=ksimp13[i];
                goto finboucle2;
            }
        }
    finboucle2:;
        emit requestndxint(n,2,3);
        ///spinBox_nbre_pts_fx->setValue(n);
        ///spinBox_nbre_pts_fx->setSingleStep(2);
    }
    if (methodeindex_inteqt==0)
    {
        emit requestndxint(n,1,2);
        ///spinBox_nbre_pts_fx->setSingleStep(1);
    }
}



