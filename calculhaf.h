// Copyright (C) 2023 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR BSD-3-Clause

#ifndef CALCULHAF_H
#define CALCULHAF_H

#include "fparser.hh"
#include <QMessageBox>

#include <QObject>


///QT_FORWARD_DECLARE_CLASS(QAbstractSeries)
QT_FORWARD_DECLARE_CLASS(QQuickView)

class CalculHaf : public QObject
{
    Q_OBJECT
public:
    explicit CalculHaf(QQuickView *appViewer, QObject *parent = nullptr);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_pointfixe(QString fx, QString gx, double x0, double eps, int nmax, int ndecimaux);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_newtonraphson(QString fx, QString fxprim, double x0, double eps, int nmax, int ndecimaux);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_secante(QString fx, double x0,double x1, double eps, int nmax, int ndecimaux);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_dichotomie(QString fx, double a, double b,double eps,int nmax,int ndecimaux);
    Q_INVOKABLE void hafresolutioneqtnonlineaire_fausseposition(QString fx, double a, double b,double eps,int nmax,int ndecimaux);

    Q_INVOKABLE void hafresolutioneqtdifferentielle_Euler_explicite(QString fxy_edoeqt, double a_edoeqt, double b_edoeqt,double dx_edoeqt,int ya_edoeqt,int nbrePts_edoeqt,int nbreDecim_edoeqt);
    Q_INVOKABLE void hafresolutioneqtdifferentielle_Runge_Kutta(QString fxy_edoeqt, double a_edoeqt, double b_edoeqt,double dx_edoeqt,int ya_edoeqt,int nbrePts_edoeqt,int nbreDecim_edoeqt);
    Q_INVOKABLE void hafresolutioneqtdifferentielle_Kutta_Merson(QString fxy_edoeqt, double a_edoeqt, double b_edoeqt,double dx_edoeqt,int ya_edoeqt,int nbrePts_edoeqt,int nbreDecim_edoeqt);
    Q_INVOKABLE void hafafficherIntegration(QString fxintegrale, QVariantList tabArrayxiyi_inteqt, double a, double b, double ntab, double nfx, bool usefx, bool fullTableView, int ndecimaux, int method);
    Q_INVOKABLE void hafplot(QString fxplot, double a, double b,double n,int ndecimaux);
    Q_INVOKABLE void hafresolutionsysteqtlineaire_Gauss(QVariantList tabArrayxiyidata_linearsyst,int n );
    Q_INVOKABLE void hafresolutionsysteqtlineaire_Gauss_Seidel(QVariantList tabArrayxiyidata_linearsyst,QVariantList tabArrayxo_linearsyst,int n,double maxitera_linearsyst,double tolerance_linearsyst);
    Q_INVOKABLE void hafresolutionsysteqtlineaire_Jacobi(QVariantList tabArrayxiyidata_linearsyst,QVariantList tabArrayxo_linearsyst,int n,double maxitera_linearsyst,double tolerance_linearsyst);
    Q_INVOKABLE void hafresolutionSysteqtnonlineaire_ptfixe(QString f1xy,QString f2xy, QString g1y, QString g2x, double x0, double y0, double eps, int nmax, int ndecimaux);
    Q_INVOKABLE void hafresolutionSysteqtnonlineaire_newtonraphson(QString f1xy,QString f2xy, QString f1xyprime, QString f2xyprime, double x0, double y0, double eps, int nmax, int ndecimaux);
    Q_INVOKABLE void hafcalculApproximationPolynomiale_Lagrange(QVariantList tabArrayxiyi_polynoapproxi, int nbrePts_polynoapproxi, int id);
    Q_INVOKABLE void hafcalculApproximationPolynomiale_Newton(QVariantList tabArrayxiyi_polynoapproxi, int nbrePts_polynoapproxi, int id);
    Q_INVOKABLE QString number_to_qstring_HAF(double xi, int i, int j);

    Q_INVOKABLE QString textChangedinfunctionfx(QString fx);
    Q_INVOKABLE QString textChangedinfunctiongxPF(QString gx);
    Q_INVOKABLE QString textChangedinfunctionfprimNR(QString fxfprimx);
    Q_INVOKABLE QString textChangedinfunctionyprime(QString yprim);
    Q_INVOKABLE QString textChangedinfx_integ(QString fx);
    Q_INVOKABLE QString textChangedinfx_plot(QString fx);

    Q_INVOKABLE QString textChangedinfunctionfxy1(QString fxy1_nonlinearsyst);
    Q_INVOKABLE QString textChangedinfunctionfxy2(QString fxy2_nonlinearsyst);
    Q_INVOKABLE QString textChangedinfunctiongxy1PF(QString gxy1PF_nonlinearsyst);
    Q_INVOKABLE QString textChangedinfunctiongxy2PF(QString gxy2PF_nonlinearsyst);
    Q_INVOKABLE QString textChangedinfunctiondf1xyNR(QString df1xyNR_nonlinearsyst);
    Q_INVOKABLE QString textChangedinfunctiondf2xyNR(QString df2xyNR_nonlinearsyst);

    std::size_t array_size=1000000;
    double* y = new double[array_size];
    double* x = new double[array_size];
    double* I = new double[array_size];
    double* error_truncation = new double[array_size];

    int n;
    int i;
    int j;
    int k;
    int m;
    int indexRowPivotNul;
    QString outputtext;
    double xm;
    QString message;
    double vals[1];
    QString fx;
    QString gx;
    QString fprimx;
    FunctionParser fparserfx;
    FunctionParser fparsergx;
    FunctionParser fparserfxprim;

    int fparserfx_EvalError=0;
    int fparsergx_EvalError=0;
    int fparserfxprim_EvalError=0;
    int fparserfxa_EvalError=0;
    int fparserfxb_EvalError=0;
    int fparserfxr_EvalError=0;
    int fparserfxm_EvalError=0;

    QString yprim;
    FunctionParser fparseryprim;
    int fparseryprim_EvalError=0;

    QString fxintegrale;
    FunctionParser fparserfxintegrale;
    int fparserfxintegrale_EvalError=0;

    QString fxplot;
    FunctionParser fparserfxplot;
    int fparserfxplot_EvalError=0;

    double valsa[1];
    double valsb[1];
    double valsr[1];

    QStringList headtextH_SystEqtLineares_Gauss_Seidel;
    QStringList headtextV_SystEqtLineares_Gauss_Seidel;
    bool okToleranceReache_GaussSeidel;
    double Maxe;
    int iter;

    QString f1xy;
    FunctionParser fparserf1xy;
    int fparserf1xy_EvalError=0;
    QString f2xy;
    FunctionParser fparserf2xy;
    int fparserf2xy_EvalError=0;
    QString g1y;
    FunctionParser fparserg1y;
    int fparserg1y_EvalError=0;
    QString g2x;
    FunctionParser fparserg2x;
    int fparserg2x_EvalError=0;

    QString f1xyprime;
    FunctionParser fparserf1xyprime;
    int fparserf1xyprime_EvalError=0;
    QString f2xyprime;
    FunctionParser fparserf2xyprime;
    int fparserf2xyprime_EvalError=0;

    double valsxy[2];
    bool validf1xy=true;
    bool validf2xy=true;
    bool validg1y=true;
    bool validg2x=true;
    bool validf1xyprime=true;
    bool validf2xyprime=true;

    double xploy[11]={0};
    double yploy[11]={0};
    double s[11+1];
    double cof[11];
    double phi,ff,b;
    double f[11][11];
    int id;


signals:
    void requestDialog(QString title,QString error);
    void requestDialog_nonlineareqt(QString title,QString error);
    void requestDialog_edoeqt(QString title,QString error);
    void requestDialog_inteqt(QString title,QString error);
    void requestDialog_plot(QString title,QString error);
    void requestDialog_linearsyst(QString title,QString error);
    void requestDialog_nonlinearsyst(QString title,QString error);

    void requestXiPF(int i,double xi,double gxi,double fxi);
    void requestXiNR(int i,double xi,double frimxi,double fxi);
    void requestXiSEC(int i,double xi,double fxi);
    void requestXiBS(int i,double a,double b,double xm,double fxmxfxa);
    void requestXiRF(int i,double a,double b,double r,double fxaxfxr,double fxbxfxr);

    void requestXiodeeqt(int i,double xi,double yi);
    void requestXinteqt(QString xi,QString yi,QString Ij);
    void requestIjSimpinteqt(int rowi,QString Ij);

    void requestSelectEndtable_nonlineareqt();
    void requestSelectEndtable_inteqt();
    void requestSelectEndtable_linearsyst();

    void requestCleartable_inteqt();
    void requesttextAffichageResultats_inteqt(QString text);

    void requestXY_plot(QString xi,QString yi,QString dx);
    void requestCleartable_plot();

    void requesttextAffichageResultats_linearsyst(QString text);
    void requestMatriTriaSupn2_linearsyst(QString ai1,QString ai2,QString bi);
    void requestMatriTriaSupn3_linearsyst(QString ai1,QString ai2,QString ai3,QString bi);
    void requestMatriTriaSupn4_linearsyst(QString ai1,QString ai2,QString ai3,QString ai4,QString bi);
    void requestMatriTriaSupn5_linearsyst(QString ai1,QString ai2,QString ai3,QString ai4,QString ai5,QString bi);

    void requesttextAffichageResultatsGSJaco_linearsyst(QString text);
    void requestMatriTriaSupn2GSJaco_linearsyst(QString x1,QString x2,QString MaxErreur);
    void requestMatriTriaSupn3GSJaco_linearsyst(QString x1,QString x2,QString x3,QString MaxErreur);
    void requestMatriTriaSupn4GSJaco_linearsyst(QString x1,QString x2,QString x3,QString x4,QString MaxErreur);
    void requestMatriTriaSupn5GSJaco_linearsyst(QString x1,QString x2,QString x3,QString x4,QString x5,QString MaxErreur);

    void requestXiPF_nonlinearsyst(QString i,QString xi,QString yi,QString f1xiyi,QString f2xiyi);
    void requestXiNR_nonlinearsyst(QString i,QString xi,QString yi,QString f1xiyi,QString f2xiyi);
    void requestSelectEndtable_nonlinearsyst();

    void requesttextAffichageResultats_polynoapproxi(QString text);
    void request_polynoapproxi(QString xi,QString yi,QString ,QString ,QString ,QString ,QString ,QString ,QString ,QString ,QString );
    void requestDialog_polynoapproxi(QString title,QString error);

public slots:
    ///void generateData(int type, int rowCount, int colCount);

private slots:
    void EvalErrorfunHAF(int fparser_EvalError, QString fx, double x,int ndecimaux);
    void EvalErrorfunHAFxy(int fparser_EvalError, QString fx, double x,double y,int ndecimaux);

private:
    QQuickView *m_appViewer = nullptr;

};

#endif
