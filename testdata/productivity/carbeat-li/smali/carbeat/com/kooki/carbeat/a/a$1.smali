.class final Lcarbeat/com/kooki/carbeat/a/a$1;
.super Ljava/lang/Object;

# interfaces
.implements Landroid/widget/SeekBar$OnSeekBarChangeListener;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcarbeat/com/kooki/carbeat/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcarbeat/com/kooki/carbeat/a/a;


# direct methods
.method constructor <init>(Lcarbeat/com/kooki/carbeat/a/a;)V
    .locals 0

    iput-object p1, p0, Lcarbeat/com/kooki/carbeat/a/a$1;->a:Lcarbeat/com/kooki/carbeat/a/a;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onProgressChanged(Landroid/widget/SeekBar;IZ)V
    .locals 0

    return-void
.end method

.method public final onStartTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 0

    return-void
.end method

.method public final onStopTrackingTouch(Landroid/widget/SeekBar;)V
    .locals 5

    iget-object v0, p0, Lcarbeat/com/kooki/carbeat/a/a$1;->a:Lcarbeat/com/kooki/carbeat/a/a;

    iget-object v1, v0, Lcarbeat/com/kooki/carbeat/a/a;->a:Landroid/content/Context;

    const-string v2, "Wait"

    const-string v3, "Wait a second...."

    const/4 v4, 0x1

    invoke-static {v1, v2, v3, v4}, Landroid/app/ProgressDialog;->show(Landroid/content/Context;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Landroid/app/ProgressDialog;

    move-result-object v1

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/app/ProgressDialog;->setProgressStyle(I)V

    invoke-virtual {v1}, Landroid/app/ProgressDialog;->show()V

    new-instance v2, Landroid/os/Handler;

    invoke-direct {v2}, Landroid/os/Handler;-><init>()V

    new-instance v3, Lcarbeat/com/kooki/carbeat/a/a$2;

    invoke-direct {v3, v0, v1}, Lcarbeat/com/kooki/carbeat/a/a$2;-><init>(Lcarbeat/com/kooki/carbeat/a/a;Landroid/app/ProgressDialog;)V

    const-wide/16 v0, 0x7d0

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method
