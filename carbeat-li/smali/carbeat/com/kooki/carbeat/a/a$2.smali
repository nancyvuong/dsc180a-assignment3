.class final Lcarbeat/com/kooki/carbeat/a/a$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcarbeat/com/kooki/carbeat/a/a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic a:Landroid/app/ProgressDialog;

.field final synthetic b:Lcarbeat/com/kooki/carbeat/a/a;


# direct methods
.method constructor <init>(Lcarbeat/com/kooki/carbeat/a/a;Landroid/app/ProgressDialog;)V
    .locals 0

    iput-object p1, p0, Lcarbeat/com/kooki/carbeat/a/a$2;->b:Lcarbeat/com/kooki/carbeat/a/a;

    iput-object p2, p0, Lcarbeat/com/kooki/carbeat/a/a$2;->a:Landroid/app/ProgressDialog;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 1

    iget-object v0, p0, Lcarbeat/com/kooki/carbeat/a/a$2;->a:Landroid/app/ProgressDialog;

    invoke-virtual {v0}, Landroid/app/ProgressDialog;->dismiss()V

    return-void
.end method
