.class public final Lcarbeat/com/kooki/carbeat/a/a;
.super Landroid/support/v7/widget/RecyclerView$a;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcarbeat/com/kooki/carbeat/a/a$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/support/v7/widget/RecyclerView$a",
        "<",
        "Landroid/support/v7/widget/RecyclerView$u;",
        ">;"
    }
.end annotation


# instance fields
.field a:Landroid/content/Context;

.field b:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    invoke-direct {p0}, Landroid/support/v7/widget/RecyclerView$a;-><init>()V

    const-string v0, "RvAdapterCarDetails"

    iput-object v0, p0, Lcarbeat/com/kooki/carbeat/a/a;->b:Ljava/lang/String;

    iput-object p1, p0, Lcarbeat/com/kooki/carbeat/a/a;->a:Landroid/content/Context;

    return-void
.end method


# virtual methods
.method public final a()I
    .locals 1

    const/16 v0, 0xa

    return v0
.end method

.method public final a(Landroid/view/ViewGroup;I)Landroid/support/v7/widget/RecyclerView$u;
    .locals 3

    const/4 v0, 0x0

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v1

    packed-switch p2, :pswitch_data_0

    :goto_0
    return-object v0

    :pswitch_0
    const v0, 0x7f03002a

    const/4 v2, 0x0

    invoke-virtual {v1, v0, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    new-instance v0, Lcarbeat/com/kooki/carbeat/a/a$a;

    invoke-direct {v0, p0, v1}, Lcarbeat/com/kooki/carbeat/a/a$a;-><init>(Lcarbeat/com/kooki/carbeat/a/a;Landroid/view/View;)V

    goto :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final a(Landroid/support/v7/widget/RecyclerView$u;I)V
    .locals 9

    const/high16 v8, 0x41000000    # 8.0f

    const/high16 v7, 0x40c00000    # 6.0f

    const/high16 v6, 0x40800000    # 4.0f

    const/high16 v5, 0x40000000    # 2.0f

    const/4 v4, 0x1

    iget v0, p1, Landroid/support/v7/widget/RecyclerView$u;->f:I

    packed-switch v0, :pswitch_data_0

    :goto_0
    return-void

    :pswitch_0
    check-cast p1, Lcarbeat/com/kooki/carbeat/a/a$a;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/4 v2, 0x0

    invoke-direct {v1, v6, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    invoke-direct {v1, v8, v4}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/4 v2, 0x2

    invoke-direct {v1, v7, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/4 v2, 0x3

    invoke-direct {v1, v5, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/high16 v2, 0x41900000    # 18.0f

    const/4 v3, 0x4

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/high16 v2, 0x42340000    # 45.0f

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x42366666    # 45.6f

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x43acc000    # 345.5f

    const/4 v3, 0x7

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x44457333    # 789.8f

    const/16 v3, 0x8

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x42623d71    # 56.56f

    const/16 v3, 0x9

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x429d8f5c    # 78.78f

    const/16 v3, 0xa

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x41bccccd    # 23.6f

    const/16 v3, 0xb

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/16 v2, 0xc

    invoke-direct {v1, v6, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/16 v2, 0xd

    invoke-direct {v1, v8, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/16 v2, 0xe

    invoke-direct {v1, v7, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/16 v2, 0xf

    invoke-direct {v1, v5, v2}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const/high16 v2, 0x42340000    # 45.0f

    const/16 v3, 0x10

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x42366666    # 45.6f

    const/16 v3, 0x11

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x43acc000    # 345.5f

    const/16 v3, 0x12

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x44457333    # 789.8f

    const/16 v3, 0x13

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x42623d71    # 56.56f

    const/16 v3, 0x14

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x429d8f5c    # 78.78f

    const/16 v3, 0x15

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x41bccccd    # 23.6f

    const/16 v3, 0x16

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/j;

    const v2, 0x444571ec

    const/16 v3, 0x17

    invoke-direct {v1, v2, v3}, Lcom/github/mikephil/charting/d/j;-><init>(FI)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v1, Lcom/github/mikephil/charting/d/l;

    const-string v2, "Cells"

    invoke-direct {v1, v0, v2}, Lcom/github/mikephil/charting/d/l;-><init>(Ljava/util/List;Ljava/lang/String;)V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const-string v2, "January"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "February"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "March"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "April"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "May"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "June"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "July"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "August"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "September"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "October"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "November"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "December"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "January"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "February"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "March"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "April"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "May"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "June"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "July"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "August"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "September"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "October"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "November"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    const-string v2, "December"

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    new-instance v2, Lcom/github/mikephil/charting/d/k;

    invoke-direct {v2, v0, v1}, Lcom/github/mikephil/charting/d/k;-><init>(Ljava/util/List;Lcom/github/mikephil/charting/g/b/e;)V

    iput-boolean v4, v1, Lcom/github/mikephil/charting/d/l;->o:Z

    iput-boolean v4, v1, Lcom/github/mikephil/charting/d/l;->p:Z

    iput-boolean v4, v1, Lcom/github/mikephil/charting/d/m;->r:Z

    iget-object v0, p1, Lcarbeat/com/kooki/carbeat/a/a$a;->p:Lcom/github/mikephil/charting/charts/LineChart;

    invoke-virtual {v0, v2}, Lcom/github/mikephil/charting/charts/LineChart;->setData(Lcom/github/mikephil/charting/d/g;)V

    iget-object v0, p1, Lcarbeat/com/kooki/carbeat/a/a$a;->p:Lcom/github/mikephil/charting/charts/LineChart;

    invoke-virtual {v0}, Lcom/github/mikephil/charting/charts/LineChart;->s()V

    iget-object v0, p1, Lcarbeat/com/kooki/carbeat/a/a$a;->q:Landroid/widget/SeekBar;

    new-instance v1, Lcarbeat/com/kooki/carbeat/a/a$1;

    invoke-direct {v1, p0}, Lcarbeat/com/kooki/carbeat/a/a$1;-><init>(Lcarbeat/com/kooki/carbeat/a/a;)V

    invoke-virtual {v0, v1}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    goto/16 :goto_0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
    .end packed-switch
.end method

.method public final b(I)I
    .locals 1

    const/4 v0, 0x0

    return v0
.end method
