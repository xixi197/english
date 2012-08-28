.class public Lcom/toni/android/english/englishword;
.super Landroid/app/Activity;
.source "englishword.java"


# instance fields
.field private handler:Landroid/os/Handler;

.field private meaningcontent:Ljava/lang/String;

.field private pd:Landroid/app/ProgressDialog;


# direct methods
.method public constructor <init>()V
    .locals 1

    .prologue
    .line 43
    invoke-direct {p0}, Landroid/app/Activity;-><init>()V

    .line 47
    const-string v0, ""

    iput-object v0, p0, Lcom/toni/android/english/englishword;->meaningcontent:Ljava/lang/String;

    .line 43
    return-void
.end method

.method private Pronounce(Ljava/lang/String;)V
    .locals 4
    .parameter "url"

    .prologue
    .line 151
    new-instance v2, Landroid/media/MediaPlayer;

    invoke-direct {v2}, Landroid/media/MediaPlayer;-><init>()V

    .line 153
    .local v2, mp3player:Landroid/media/MediaPlayer;
    :try_start_0
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v2, p0, v3}, Landroid/media/MediaPlayer;->setDataSource(Landroid/content/Context;Landroid/net/Uri;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 166
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Landroid/media/MediaPlayer;->prepare()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4

    .line 172
    :goto_1
    invoke-virtual {v2}, Landroid/media/MediaPlayer;->start()V

    .line 173
    return-void

    .line 154
    :catch_0
    move-exception v3

    move-object v1, v3

    .line 155
    .local v1, e1:Ljava/lang/IllegalArgumentException;
    invoke-virtual {v1}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_0

    .line 156
    .end local v1           #e1:Ljava/lang/IllegalArgumentException;
    :catch_1
    move-exception v3

    move-object v1, v3

    .line 157
    .local v1, e1:Ljava/lang/SecurityException;
    invoke-virtual {v1}, Ljava/lang/SecurityException;->printStackTrace()V

    goto :goto_0

    .line 158
    .end local v1           #e1:Ljava/lang/SecurityException;
    :catch_2
    move-exception v3

    move-object v1, v3

    .line 159
    .local v1, e1:Ljava/lang/IllegalStateException;
    invoke-virtual {v1}, Ljava/lang/IllegalStateException;->printStackTrace()V

    goto :goto_0

    .line 160
    .end local v1           #e1:Ljava/lang/IllegalStateException;
    :catch_3
    move-exception v3

    move-object v1, v3

    .line 161
    .local v1, e1:Ljava/io/IOException;
    invoke-virtual {v1}, Ljava/io/IOException;->printStackTrace()V

    goto :goto_0

    .line 168
    .end local v1           #e1:Ljava/io/IOException;
    :catch_4
    move-exception v0

    .line 170
    .local v0, e:Ljava/lang/Exception;
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_1
.end method

.method private ShowMeaning(Ljava/lang/String;)Ljava/lang/String;
    .locals 22
    .parameter "word"

    .prologue
    .line 99
    const-string v15, ""

    .line 101
    .local v15, showMsg:Ljava/lang/String;
    :try_start_0
    new-instance v19, Ljava/lang/StringBuilder;

    const-string v20, "http://www.google.com/dictionary/json?callback=dict_api.callbacks.id100&q="

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    move-object/from16 v0, v19

    move-object/from16 v1, p1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "&sl=en&tl=en&restrict=pr%2Cde&client=te"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Lcom/toni/android/english/JSONProvider;->getJSONData(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 102
    .local v4, content:Ljava/lang/String;
    const-string v19, "dict_api.callbacks.id100("

    const-string v20, ""

    move-object v0, v4

    move-object/from16 v1, v19

    move-object/from16 v2, v20

    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v19

    const-string v20, ",200,null)"

    const-string v21, ""

    invoke-virtual/range {v19 .. v21}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v4

    .line 103
    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 104
    .local v9, jsobj:Lorg/json/JSONObject;
    const-string v19, "primaries"

    move-object v0, v9

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v13

    .line 106
    .local v13, primaries:Lorg/json/JSONArray;
    const-string v16, ""

    .line 108
    .local v16, strMP3URL:Ljava/lang/String;
    const/4 v8, 0x0

    .local v8, j:I
    :goto_0
    invoke-virtual {v13}, Lorg/json/JSONArray;->length()I

    move-result v19

    move v0, v8

    move/from16 v1, v19

    if-lt v0, v1, :cond_0

    .line 137
    move-object/from16 v0, p0

    move-object/from16 v1, v16

    invoke-direct {v0, v1}, Lcom/toni/android/english/englishword;->Pronounce(Ljava/lang/String;)V

    .line 146
    .end local v4           #content:Ljava/lang/String;
    .end local v8           #j:I
    .end local v9           #jsobj:Lorg/json/JSONObject;
    .end local v13           #primaries:Lorg/json/JSONArray;
    .end local v16           #strMP3URL:Ljava/lang/String;
    :goto_1
    return-object v15

    .line 109
    .restart local v4       #content:Ljava/lang/String;
    .restart local v8       #j:I
    .restart local v9       #jsobj:Lorg/json/JSONObject;
    .restart local v13       #primaries:Lorg/json/JSONArray;
    .restart local v16       #strMP3URL:Ljava/lang/String;
    :cond_0
    invoke-virtual {v13, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    const-string v20, "terms"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v17

    .line 110
    .local v17, terms:Lorg/json/JSONArray;
    const-string v3, ""

    .line 111
    .local v3, PartofSpeech:Ljava/lang/String;
    const-string v12, ""

    .line 112
    .local v12, phonetic:Ljava/lang/String;
    const/4 v7, 0x0

    .local v7, i:I
    :goto_2
    invoke-virtual/range {v17 .. v17}, Lorg/json/JSONArray;->length()I

    move-result v19

    move v0, v7

    move/from16 v1, v19

    if-lt v0, v1, :cond_1

    .line 124
    invoke-virtual {v13, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    const-string v20, "entries"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v6

    .line 125
    .local v6, entries:Lorg/json/JSONArray;
    const-string v10, ""

    .line 126
    .local v10, meaning:Ljava/lang/String;
    const/4 v14, 0x0

    .line 127
    .local v14, rec:I
    const/4 v7, 0x0

    :goto_3
    invoke-virtual {v6}, Lorg/json/JSONArray;->length()I

    move-result v19

    move v0, v7

    move/from16 v1, v19

    if-lt v0, v1, :cond_5

    .line 135
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v15}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v20, "\u25c6"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object v1, v3

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    move-object/from16 v0, v19

    move-object v1, v10

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v15

    .line 108
    add-int/lit8 v8, v8, 0x1

    goto :goto_0

    .line 113
    .end local v6           #entries:Lorg/json/JSONArray;
    .end local v10           #meaning:Ljava/lang/String;
    .end local v14           #rec:I
    :cond_1
    move-object/from16 v0, v17

    move v1, v7

    invoke-virtual {v0, v1}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 114
    .local v11, obj:Lorg/json/JSONObject;
    const-string v19, "type"

    move-object v0, v11

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 115
    .local v18, type:Ljava/lang/String;
    const-string v19, "text"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_3

    .line 116
    const-string v19, "labels"

    move-object v0, v11

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v19

    const/16 v20, 0x0

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v19

    const-string v20, "text"

    invoke-virtual/range {v19 .. v20}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 112
    :cond_2
    :goto_4
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    .line 117
    :cond_3
    const-string v19, "phonetic"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_4

    .line 118
    const-string v19, "text"

    move-object v0, v11

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    goto :goto_4

    .line 119
    :cond_4
    const-string v19, "sound"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_2

    .line 120
    const-string v19, "text"

    move-object v0, v11

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v16

    goto :goto_4

    .line 128
    .end local v11           #obj:Lorg/json/JSONObject;
    .end local v18           #type:Ljava/lang/String;
    .restart local v6       #entries:Lorg/json/JSONArray;
    .restart local v10       #meaning:Ljava/lang/String;
    .restart local v14       #rec:I
    :cond_5
    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v11

    .line 129
    .restart local v11       #obj:Lorg/json/JSONObject;
    const-string v19, "type"

    move-object v0, v11

    move-object/from16 v1, v19

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v18

    .line 130
    .restart local v18       #type:Ljava/lang/String;
    const-string v19, "meaning"

    invoke-virtual/range {v18 .. v19}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v19

    if-eqz v19, :cond_6

    .line 132
    new-instance v19, Ljava/lang/StringBuilder;

    invoke-static {v10}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v20

    invoke-direct/range {v19 .. v20}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v14, v14, 0x1

    move-object/from16 v0, v19

    move v1, v14

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ". "

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, "terms"

    move-object v0, v11

    move-object/from16 v1, v20

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v20

    const/16 v21, 0x0

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v20

    const-string v21, "text"

    invoke-virtual/range {v20 .. v21}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v20

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    const-string v20, ".\n"

    invoke-virtual/range {v19 .. v20}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v19

    invoke-virtual/range {v19 .. v19}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Lorg/apache/http/client/ClientProtocolException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    move-result-object v10

    .line 127
    :cond_6
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_3

    .line 139
    .end local v3           #PartofSpeech:Ljava/lang/String;
    .end local v4           #content:Ljava/lang/String;
    .end local v6           #entries:Lorg/json/JSONArray;
    .end local v7           #i:I
    .end local v8           #j:I
    .end local v9           #jsobj:Lorg/json/JSONObject;
    .end local v10           #meaning:Ljava/lang/String;
    .end local v11           #obj:Lorg/json/JSONObject;
    .end local v12           #phonetic:Ljava/lang/String;
    .end local v13           #primaries:Lorg/json/JSONArray;
    .end local v14           #rec:I
    .end local v16           #strMP3URL:Ljava/lang/String;
    .end local v17           #terms:Lorg/json/JSONArray;
    .end local v18           #type:Ljava/lang/String;
    :catch_0
    move-exception v19

    move-object/from16 v5, v19

    .line 140
    .local v5, e:Lorg/json/JSONException;
    invoke-virtual {v5}, Lorg/json/JSONException;->printStackTrace()V

    goto/16 :goto_1

    .line 141
    .end local v5           #e:Lorg/json/JSONException;
    :catch_1
    move-exception v19

    move-object/from16 v5, v19

    .line 142
    .local v5, e:Lorg/apache/http/client/ClientProtocolException;
    invoke-virtual {v5}, Lorg/apache/http/client/ClientProtocolException;->printStackTrace()V

    goto/16 :goto_1

    .line 143
    .end local v5           #e:Lorg/apache/http/client/ClientProtocolException;
    :catch_2
    move-exception v19

    move-object/from16 v5, v19

    .line 144
    .local v5, e:Ljava/io/IOException;
    invoke-virtual {v5}, Ljava/io/IOException;->printStackTrace()V

    goto/16 :goto_1
.end method

.method static synthetic access$0(Lcom/toni/android/english/englishword;Landroid/app/ProgressDialog;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 45
    iput-object p1, p0, Lcom/toni/android/english/englishword;->pd:Landroid/app/ProgressDialog;

    return-void
.end method

.method static synthetic access$1(Lcom/toni/android/english/englishword;)Landroid/app/ProgressDialog;
    .locals 1
    .parameter

    .prologue
    .line 45
    iget-object v0, p0, Lcom/toni/android/english/englishword;->pd:Landroid/app/ProgressDialog;

    return-object v0
.end method

.method static synthetic access$2(Lcom/toni/android/english/englishword;)Ljava/lang/String;
    .locals 1
    .parameter

    .prologue
    .line 47
    iget-object v0, p0, Lcom/toni/android/english/englishword;->meaningcontent:Ljava/lang/String;

    return-object v0
.end method

.method static synthetic access$3(Lcom/toni/android/english/englishword;Landroid/os/Handler;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 46
    iput-object p1, p0, Lcom/toni/android/english/englishword;->handler:Landroid/os/Handler;

    return-void
.end method

.method static synthetic access$4(Lcom/toni/android/english/englishword;Ljava/lang/String;)Ljava/lang/String;
    .locals 1
    .parameter
    .parameter

    .prologue
    .line 98
    invoke-direct {p0, p1}, Lcom/toni/android/english/englishword;->ShowMeaning(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static synthetic access$5(Lcom/toni/android/english/englishword;Ljava/lang/String;)V
    .locals 0
    .parameter
    .parameter

    .prologue
    .line 47
    iput-object p1, p0, Lcom/toni/android/english/englishword;->meaningcontent:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$6(Lcom/toni/android/english/englishword;)Landroid/os/Handler;
    .locals 1
    .parameter

    .prologue
    .line 46
    iget-object v0, p0, Lcom/toni/android/english/englishword;->handler:Landroid/os/Handler;

    return-object v0
.end method


# virtual methods
.method public getWords()[Ljava/lang/String;
    .locals 4

    .prologue
    .line 176
    const/4 v0, 0x0

    check-cast v0, [Ljava/lang/String;

    .line 177
    .local v0, array:[Ljava/lang/String;
    const/16 v2, 0x159f

    new-array v0, v2, [Ljava/lang/String;

    .end local v0           #array:[Ljava/lang/String;
    const/4 v2, 0x0

    const-string v3, "1. a art.\u4e00(\u4e2a)\uff1b\u6bcf\u4e00(\u4e2a)\uff1b(\u540c\u7c7b\u4e8b\u7269\u4e2d)\u4efb\u4e00\u4e2a"

    aput-object v3, v0, v2

    const/4 v2, 0x1

    .line 178
    const-string v3, "2. propaganda n.\u5ba3\u4f20(\u673a\u6784)\uff1b[\u5929\u4e3b\u6559]\u4f20\u9053\u603b\u4f1a"

    aput-object v3, v0, v2

    const/4 v2, 0x2

    .line 179
    const-string v3, "3. panda n.\u718a\u732b"

    aput-object v3, v0, v2

    const/4 v2, 0x3

    .line 180
    const-string v3, "4. agenda n.\u8bae\u4e8b\u65e5\u7a0b\uff0c\u8bb0\u4e8b\u518c"

    aput-object v3, v0, v2

    const/4 v2, 0x4

    .line 181
    const-string v3, "5. soda n.\u82cf\u6253,\u6c7d\u6c34"

    aput-object v3, v0, v2

    const/4 v2, 0x5

    .line 182
    const-string v3, "6. idea n.\u60f3\u6cd5\uff0c\u5ff5\u5934\uff1b\u6982\u5ff5\uff0c\u89c2\u5ff5\uff1b\u610f\u89c1\uff0c\u4e3b\u610f"

    aput-object v3, v0, v2

    const/4 v2, 0x6

    .line 183
    const-string v3, "7. plea n.(\u6cd5\u5f8b)\u6297\u8fa9\uff1b\u8bf7\u6c42\uff0c\u6073\u6c42\uff0c\u6258\u8bcd\uff0c\u53e3\u5b9e"

    aput-object v3, v0, v2

    const/4 v2, 0x7

    .line 184
    const-string v3, "8. pea n.\u8c4c\u8c46"

    aput-object v3, v0, v2

    const/16 v2, 0x8

    .line 185
    const-string v3, "9. area n.\u9762\u79ef\uff1b\u5730\u533a\uff0c\u5730\u57df\uff1b\u9886\u57df\uff0c\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x9

    .line 186
    const-string v3, "10. sea n.\u6d77\uff0c\u6d77\u6d0b\uff0c\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xa

    .line 187
    const-string v3, "11. tea n.\u8336(\u53f6)\uff1b\u5348\u540e\u8336\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0xb

    .line 188
    const-string v3, "12. sofa n.\u957f\u6c99\u53d1\uff0c\u6c99\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0xc

    .line 189
    const-string v3, "13. encyclopedia n.(encyclopaedia)\u767e\u79d1\u5168\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0xd

    .line 190
    const-string v3, "14. pneumonia n.\u80ba\u708e"

    aput-object v3, v0, v2

    const/16 v2, 0xe

    .line 191
    const-string v3, "15. cafeteria n.\u81ea\u52a9\u98df\u5802"

    aput-object v3, v0, v2

    const/16 v2, 0xf

    .line 192
    const-string v3, "16. inertia n.\u4e0d\u6d3b\u52a8,\u60f0\u6027;\u60ef\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x10

    .line 193
    const-string v3, "17. via prep.\u7ecf\uff1b\u901a\u8fc7\uff1b\u51ed\u501f"

    aput-object v3, v0, v2

    const/16 v2, 0x11

    .line 194
    const-string v3, "18. umbrella n.\u4f1e"

    aput-object v3, v0, v2

    const/16 v2, 0x12

    .line 195
    const-string v3, "19. formula n.(pl.formulae)\u516c\u5f0f;\u89c4\u5219;\u5206\u5b50\u5f0f;\u836f\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0x13

    .line 196
    const-string v3, "20. peninsula n.\u534a\u5c9b"

    aput-object v3, v0, v2

    const/16 v2, 0x14

    .line 197
    const-string v3, "21. drama n.\u5267\u672c,\u620f\u5267;\u620f\u5267\u6027\u4e8b\u4ef6\u6216\u573a\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x15

    .line 198
    const-string v3, "22. panorama n.\u5168\u666f,\u5168\u666f\u753b,\u5168\u666f\u6444\u5f71,\u5168\u666f\u7167\u7247[\u88c5\u7f6e]"

    aput-object v3, v0, v2

    const/16 v2, 0x16

    .line 199
    const-string v3, "23. cinema n.\u7535\u5f71\u9662;\u7535\u5f71,\u5f71\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x17

    .line 200
    const-string v3, "24. dilemma n.(\u8fdb\u9000\u4e24\u96be\u7684)\u7a98\u5883,\u56f0\u5883"

    aput-object v3, v0, v2

    const/16 v2, 0x18

    .line 201
    const-string v3, "25. diploma n.\u6bd5\u4e1a\u6587\u51ed,\u5b66\u4f4d\u8bc1\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0x19

    .line 202
    const-string v3, "26. banana n.\u9999\u8549"

    aput-object v3, v0, v2

    const/16 v2, 0x1a

    .line 203
    const-string v3, "27. china n.\u74f7\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x1b

    .line 204
    const-string v3, "28. antenna n.(\u65e0\u7ebf\u7535\u6216\u7535\u89c6\u7684)\u5929\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x1c

    .line 205
    const-string v3, "29. zebra n.\u6591\u9a6c"

    aput-object v3, v0, v2

    const/16 v2, 0x1d

    .line 206
    const-string v3, "30. era n.\u65f6\u4ee3,\u5e74\u4ee3,\u9636\u6bb5,\u7eaa\u5143"

    aput-object v3, v0, v2

    const/16 v2, 0x1e

    .line 207
    const-string v3, "31. camera n.\u7167\u76f8\u673a,\u6444\u5f71\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x1f

    .line 208
    const-string v3, "32. opera n.\u6b4c\u5267"

    aput-object v3, v0, v2

    const/16 v2, 0x20

    .line 209
    const-string v3, "33. orchestra n.\u7ba1\u5f26\u4e50\u961f"

    aput-object v3, v0, v2

    const/16 v2, 0x21

    .line 210
    const-string v3, "34. extra a.\u989d\u5916\u7684,\u9644\u52a0\u7684 n.\u9644\u52a0\u7269,\u989d\u5916\u7684\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x22

    .line 211
    const-string v3, "35. visa n.(\u62a4\u7167\u7b49\u7684)\u7b7e\u8bc1;\u7ef4\u8428\u4fe1\u7528\u5361 vt.\u7b7e\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x23

    .line 212
    const-string v3, "36. data n.(datum\u7684\u590d\u6570)\u8d44\u6599\uff0c\u6570\u636e"

    aput-object v3, v0, v2

    const/16 v2, 0x24

    .line 213
    const-string v3, "37. quota n.(\u751f\u4ea7\u3001\u8fdb\u51fa\u53e3\u7b49\u7684)\u914d\u989d\uff0c(\u79fb\u6c11\u7684)\u9650\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x25

    .line 214
    const-string v3, "38. cab n.\u51fa\u79df\u8f66\uff0c\u51fa\u79df\u9a6c\u8f66\uff1b\u9a7e\u9a76\u5ba4 vi.\u4e58\u51fa\u79df\u9a6c\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x26

    .line 215
    const-string v3, "39. lab n.(laboratory)\u5b9e\u9a8c\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x27

    .line 216
    const-string v3, "40. crab n.\u8783\u87f9,\u87f9\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x28

    .line 217
    const-string v3, "41. grab v./n.(at)\u6293(\u4f4f);\u593a(\u5f97)"

    aput-object v3, v0, v2

    const/16 v2, 0x29

    .line 218
    const-string v3, "42. stab v./n.\u523a,\u6233"

    aput-object v3, v0, v2

    const/16 v2, 0x2a

    .line 219
    const-string v3, "43. ebb vi.\u8870\u9000\uff0c\u51cf\u9000 n.\u5904\u4e8e\u4f4e\u6f6e\uff0c\u5904\u4e8e\u8870\u9000\u72b6\u6001"

    aput-object v3, v0, v2

    const/16 v2, 0x2b

    .line 220
    const-string v3, "44. web n.\u7f51,\u8718\u86db\u7f51"

    aput-object v3, v0, v2

    const/16 v2, 0x2c

    .line 221
    const-string v3, "45. rib n.\u808b\u9aa8,\u808b\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x2d

    .line 222
    const-string v3, "46. bulb n.\u706f\u6ce1,\u7403\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x2e

    .line 223
    const-string v3, "47. lamb n.\u7f94\u7f8a,\u5c0f\u7f8a;\u7f94\u7f8a\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x2f

    .line 224
    const-string v3, "48. limb n.\u80a2,\u7ffc,\u5927\u6811\u679d"

    aput-object v3, v0, v2

    const/16 v2, 0x30

    .line 225
    const-string v3, "49. climb v./n.\u6500\u767b,\u722c"

    aput-object v3, v0, v2

    const/16 v2, 0x31

    .line 226
    const-string v3, "50. bomb n.\u70b8\u5f39 v.\u6295\u5f39\u4e8e,\u8f70\u70b8"

    aput-object v3, v0, v2

    const/16 v2, 0x32

    .line 227
    const-string v3, "51. comb n.\u68b3\u5b50 v.\u68b3(\u7406)"

    aput-object v3, v0, v2

    const/16 v2, 0x33

    .line 228
    const-string v3, "52. tomb n.\u575f,\u51a2"

    aput-object v3, v0, v2

    const/16 v2, 0x34

    .line 229
    const-string v3, "53. dumb a.\u54d1\u7684,\u65e0\u8a00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35

    .line 230
    const-string v3, "54. thumb n.\u62c7\u6307 v.\u793a\u610f\u8981\u6c42\u642d\u8f66\uff1b\u8fc5\u901f\u7ffb\u9605"

    aput-object v3, v0, v2

    const/16 v2, 0x36

    .line 231
    const-string v3, "55. numb a.\u9ebb\u6728\u7684,\u5931\u53bb\u611f\u89c9\u7684 v.\u4f7f\u9ebb\u6728"

    aput-object v3, v0, v2

    const/16 v2, 0x37

    .line 232
    const-string v3, "56. job n.\u5de5\u4f5c\uff0c\u804c\u4f4d\uff1b\u96f6\u6d3b\uff0c\u4e00\u4ef6\u5de5\u4f5c\uff1b\u4efb\u52a1\uff0c\u804c\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0x38

    .line 233
    const-string v3, "57. mob n.\u4e4c\u5408\u4e4b\u4f17(\u5c24\u6307\u66b4\u529b\u8005) vi.\u56f4\u653b\uff0c\u805a\u4f17\u95f9\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x39

    .line 234
    const-string v3, "58. knob n.\u95e8\u628a,(\u7403\u5f62)\u628a\u624b,\u65cb\u7ebd"

    aput-object v3, v0, v2

    const/16 v2, 0x3a

    .line 235
    const-string v3, "59. rob v.(of)\u62a2\u52ab,\u76d7\u53d6;\u975e\u6cd5\u5265\u593a"

    aput-object v3, v0, v2

    const/16 v2, 0x3b

    .line 236
    const-string v3, "60. sob v./n.\u54ed\u6ce3,\u545c\u54bd"

    aput-object v3, v0, v2

    const/16 v2, 0x3c

    .line 237
    const-string v3, "61. herb n.\u836f\u8349\uff0c(\u8c03\u5473\u7528\u7684)\u9999\u8349\uff0c\u8349\u672c\u690d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x3d

    .line 238
    const-string v3, "62. superb a.\u6781\u597d\u7684,\u6770\u51fa\u7684\uff1b\u534e\u4e3d\u7684\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x3e

    .line 239
    const-string v3, "63. verb n.\u52a8\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x3f

    .line 240
    const-string v3, "64. adverb n.\u526f\u8bcd a.\u526f\u8bcd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x40

    .line 241
    const-string v3, "65. absorb vt.\u5438\u6536(\u6c34\u3001\u5149\u3001\u84b8\u6c7d\u7b49\uff09\uff1b\u4f7f\u5168\u795e\u8d2f\u6ce8"

    aput-object v3, v0, v2

    const/16 v2, 0x41

    .line 242
    const-string v3, "66. suburb n.\u5e02\u90ca,\u90ca\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x42

    .line 243
    const-string v3, "67. curb n.\u8def\u8fb9\uff0c\u573a\u5916\u8bc1\u5238\u5e02\u573a\uff0cvt.\u5236\u6b62\uff0c\u6291\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0x43

    .line 244
    const-string v3, "68. disturb v.\u6270\u4e71,\u59a8\u788d,\u4f7f\u4e0d\u5b89"

    aput-object v3, v0, v2

    const/16 v2, 0x44

    .line 245
    const-string v3, "69. club n.\u4ff1\u4e50\u90e8,\u591c\u603b\u4f1a;\u793e\u56e2;\u68cd\u68d2,\u7403\u68d2"

    aput-object v3, v0, v2

    const/16 v2, 0x45

    .line 246
    const-string v3, "70. pub n.(\u82f1\u56fd)\u5c0f\u9152\u5e97\uff1b\u5c0f\u65c5\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0x46

    .line 247
    const-string v3, "71. rub v.\u64e6,\u6469\u64e6"

    aput-object v3, v0, v2

    const/16 v2, 0x47

    .line 248
    const-string v3, "72. tub n.\u6728\u76c6,\u6fa1\u76c6"

    aput-object v3, v0, v2

    const/16 v2, 0x48

    .line 249
    const-string v3, "73. mosaic n.\u9a6c\u8d5b\u514b;\u9576\u5d4c\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x49

    .line 250
    const-string v3, "74. traffic n.\u4ea4\u901a,\u4ea4\u901a\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x4a

    .line 251
    const-string v3, "75. specific a.\u660e\u786e\u7684,\u5177\u4f53\u7684;\u7279\u5b9a\u7684,\u7279\u6709\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4b

    .line 252
    const-string v3, "76. terrific a.\u6781\u597d\u7684,\u975e\u5e38\u7684,\u6781\u5ea6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4c

    .line 253
    const-string v3, "77. scientific a.\u79d1\u5b66\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4d

    .line 254
    const-string v3, "78. magic n.\u9b54\u672f,\u9b54(\u9b45)\u529b,\u5deb\u672f a.\u6709\u9b54\u529b\u7684,\u9b54\u672f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4e

    .line 255
    const-string v3, "79. tragic a.\u60b2\u5267\u7684,\u60b2\u60e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4f

    .line 256
    const-string v3, "80. logic n.\u903b\u8f91,\u903b\u8f91\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x50

    .line 257
    const-string v3, "81. graphic a.\u7ed8\u753b\u4f3c\u7684, \u56fe\u89e3\u7684,\u751f\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x51

    .line 258
    const-string v3, "82. public a.\u516c\u5171\u7684,\u516c\u7528\u7684;\u516c\u5f00\u7684,\u516c\u7136 n.\u516c\u4f17,\u6c11\u4f17"

    aput-object v3, v0, v2

    const/16 v2, 0x52

    .line 259
    const-string v3, "83. republic n.\u5171\u548c\u56fd,\u5171\u548c\u653f\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x53

    .line 260
    const-string v3, "84. Catholic a.\u5929\u4e3b\u6559\u7684 n.\u5929\u4e3b\u6559\u5f92"

    aput-object v3, v0, v2

    const/16 v2, 0x54

    .line 261
    const-string v3, "85. garlic n.\u849c\uff0c\u5927\u849c\u7c89"

    aput-object v3, v0, v2

    const/16 v2, 0x55

    .line 262
    const-string v3, "86. dynamic a.\u52a8\u529b\u7684,\u7535\u52a8\u7684;\u6709\u751f\u6c14\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x56

    .line 263
    const-string v3, "87. academic a.\u5b66\u9662\u7684\uff0c\u5927\u5b66\u7684\uff1b\u5b66\u672f\u6027\u7684\uff1b\u7406\u8bba\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x57

    .line 264
    const-string v3, "88. epidemic a.\u6d41\u884c\u6027\u7684;\u4f20\u67d3\u7684 n.\u6d41\u884c\u75c5;\u4f20\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0x58

    .line 265
    const-string v3, "89. comic a.\u559c\u5267\u7684\uff0c\u6ed1\u7a3d\u7684n.\u8fde\u73af\u6f2b\u753b\u6742\u5fd7\uff1b\u559c\u5267\u6f14\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x59

    .line 266
    const-string v3, "90. economic a.\u7ecf\u6d4e(\u4e0a)\u7684,\u7ecf\u6d4e\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5a

    .line 267
    const-string v3, "91. cosmic a.\u5b87\u5b99\u7684\uff1b\u65e0\u6bd4\u5de8\u5927\u7684\uff0c\u65e0\u7a77\u5c3d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5b

    .line 268
    const-string v3, "92. organic a.\u5668\u5b98\u7684;\u6709\u673a\u7684;\u6709\u673a\u4f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5c

    .line 269
    const-string v3, "93. mechanic n.\u6280\u5de5,\u673a\u4fee\u5de5"

    aput-object v3, v0, v2

    const/16 v2, 0x5d

    .line 270
    const-string v3, "94. panic n./a.\u6050\u614c(\u7684),\u60ca\u614c(\u7684) vt.\u4f7f\u60ca\u614c,\u4f7f\u5bb3\u6015"

    aput-object v3, v0, v2

    const/16 v2, 0x5e

    .line 271
    const-string v3, "95. picnic n.\u91ce\u9910 v.(\u53bb)\u91ce\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x5f

    .line 272
    const-string v3, "96. ethnic a.\u79cd\u65cf\u7684\uff1b\u4eba\u79cd\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x60

    .line 273
    const-string v3, "97. clinic n.\u8bca\u6240"

    aput-object v3, v0, v2

    const/16 v2, 0x61

    .line 274
    const-string v3, "98. chronic a.(\u75be\u75c5)\u6162\u6027\u7684;\u79ef\u4e60\u96be\u6539\u7684;\u4e25\u91cd\u7684,\u574f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x62

    .line 275
    const-string v3, "99. electronic a.\u7535\u5b50\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x63

    .line 276
    const-string v3, "100. supersonic a.\u8d85\u97f3\u901f\u7684,\u8d85\u58f0\u6ce2\u7684 n.\u8d85\u58f0\u6ce2\uff0c\u8d85\u58f0\u9891"

    aput-object v3, v0, v2

    const/16 v2, 0x64

    .line 277
    const-string v3, "101. heroic a.\u82f1\u96c4\u7684\uff0c\u82f1\u52c7\u7684\uff0c\u5d07\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x65

    .line 278
    const-string v3, "102. tropic n.\u56de\u5f52\u7ebf\uff1b[the T-s]\u70ed\u5e26\u5730\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x66

    .line 279
    const-string v3, "103. topic n.\u8bdd\u9898,\u4e3b\u9898,\u9898\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0x67

    .line 280
    const-string v3, "104. fabric n.\u7ec7\u7269;\u7ec7\u54c1;\u7ed3\u6784;\u6784\u9020;\u5efa\u7b51\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x68

    .line 281
    const-string v3, "105. historic a.\u6709\u5386\u53f2\u610f\u4e49\u7684;\u5386\u53f2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x69

    .line 282
    const-string v3, "106. electric a.\u7535\u7684,\u5bfc\u7535\u7684,\u7535\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6a

    .line 283
    const-string v3, "107. metric a.\u7c73\u5236\u7684,\u516c\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6b

    .line 284
    const-string v3, "108. eccentric a.\u53e4\u602a\u7684\uff0c\u602a\u7656\u7684\uff0c\u5f02\u4e4e\u5bfb\u5e38\u7684n.\u53e4\u602a\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x6c

    .line 285
    const-string v3, "109. basic a.\u57fa\u672c\u7684,\u57fa\u7840\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6d

    .line 286
    const-string v3, "110. intrinsic a.(\u6307\u4ef7\u503c\u3001\u6027\u8d28)\u56fa\u6709\u7684\uff0c\u672c\u8d28\u7684\uff0c\u5185\u5728\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6e

    .line 287
    const-string v3, "111. classic n.(pl.)\u6770\u4f5c,\u540d\u8457 a.\u7b2c\u4e00\u6d41\u7684,\u4e0d\u673d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f

    .line 288
    const-string v3, "112. music n.\u97f3\u4e50\uff0c\u4e50\u66f2\uff0c\u4e50\u8c31"

    aput-object v3, v0, v2

    const/16 v2, 0x70

    .line 289
    const-string v3, "113. dramatic a.\u620f\u5267\u7684,\u620f\u5267\u6027\u7684;\u5267\u70c8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x71

    .line 290
    const-string v3, "114. systematic a.(systematical)\u7cfb\u7edf\u7684,\u6709\u7ec4\u7ec7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x72

    .line 291
    const-string v3, "115. diplomatic a.\u5916\u4ea4\u7684,\u4ece\u4e8b\u5916\u4ea4\u7684;\u7b56\u7565\u7684,\u6709\u624b\u8155\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x73

    .line 292
    const-string v3, "116. automatic a.\u81ea\u52a8(\u88c5\u7f6e)\u7684\uff1b\u65e0\u610f\u8bc6\u7684\uff1bn.\u81ea\u52a8\u673a\u68b0"

    aput-object v3, v0, v2

    const/16 v2, 0x74

    .line 293
    const-string v3, "117. democratic a.\u6c11\u4e3b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x75

    .line 294
    const-string v3, "118. static a.(statical)\u9759\u6001\u7684,\u9759\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x76

    .line 295
    const-string v3, "119. tactic n.(tactics)\u7b56\u7565,\u6218\u672f"

    aput-object v3, v0, v2

    const/16 v2, 0x77

    .line 296
    const-string v3, "120. energetic a.\u7cbe\u529b\u65fa\u76db\u7684;\u79ef\u6781\u7684;\u6709\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x78

    .line 297
    const-string v3, "121. pathetic a.\u53ef\u601c\u7684, \u60b2\u60e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x79

    .line 298
    const-string v3, "122. sympathetic a.\u6709\u540c\u60c5\u5fc3\u7684\uff1b\u8d5e\u540c\u7684\uff1bn.\u4ea4\u611f\u795e\u7ecf"

    aput-object v3, v0, v2

    const/16 v2, 0x7a

    .line 299
    const-string v3, "123. synthetic a.\u5408\u6210\u7684,\u4eba\u9020\u7684;\u7efc\u5408\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7b

    .line 300
    const-string v3, "124. aesthetic a.(esthetic)\u7f8e\u5b66\u7684\uff0c\u827a\u672f\u7684\uff1b\u5ba1\u7f8e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7c

    .line 301
    const-string v3, "125. arithmetic n.\u7b97\u672f\uff0c\u56db\u5219\u8fd0\u7b97"

    aput-object v3, v0, v2

    const/16 v2, 0x7d

    .line 302
    const-string v3, "126. genetic a.\u9057\u4f20(\u5b66)\u7684 n.[-s]\u9057\u4f20\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x7e

    .line 303
    const-string v3, "127. magnetic a.\u78c1\u7684,\u6709\u78c1\u6027\u7684;\u6709\u5438\u5f15\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7f

    .line 304
    const-string v3, "128. critic n.\u6279\u8bc4\u5bb6,\u8bc4\u8bba\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0x80

    .line 305
    const-string v3, "129. gigantic a.\u5de8\u5927\u7684,\u5e9e\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x81

    .line 306
    const-string v3, "130. romantic a.\u6d6a\u6f2b\u7684,\u4f20\u5947\u5f0f\u7684;\u4e0d\u5207\u5b9e\u9645\u7684,\u597d\u5e7b\u60f3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x82

    .line 307
    const-string v3, "131. authentic a.\u771f\u7684\uff0c\u771f\u6b63\u7684\uff1b\u53ef\u9760\u7684\uff0c\u53ef\u4fe1\u7684\uff0c\u6709\u6839\u636e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x83

    .line 308
    const-string v3, "132. patriotic a.\u7231\u56fd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x84

    .line 309
    const-string v3, "133. exotic a.\u5947\u5f02\u7684;\u5f02\u56fd\u60c5\u8c03\u7684;\u5916(\u56fd)\u6765\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x85

    .line 310
    const-string v3, "134. sarcastic a.\u8bbd\u523a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x86

    .line 311
    const-string v3, "135. enthusiastic a.\u70ed\u60c5\u7684,\u70ed\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x87

    .line 312
    const-string v3, "136. elastic a.\u5f39\u6027\u7684 n.\u677e\u7d27\u5e26,\u6a61\u76ae\u5708"

    aput-object v3, v0, v2

    const/16 v2, 0x88

    .line 313
    const-string v3, "137. plastic n.(\u5e38pl.)\u5851\u6599,\u5851\u6599\u5236\u54c1 a.\u53ef\u5851\u7684,\u5851\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x89

    .line 314
    const-string v3, "138. drastic a.\u6fc0\u70c8\u7684,\u4e25\u5389\u7684;(\u836f\u6027\u7b49)\u731b\u70c8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8a

    .line 315
    const-string v3, "139. fantastic a.(fantastical)\u5947\u5f02\u7684,\u5e7b\u60f3\u7684,\u5f02\u60f3\u5929\u5f00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8b

    .line 316
    const-string v3, "140. domestic a.\u5bb6\u91cc\u7684;\u672c\u56fd\u7684;\u9a6f\u517b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8c

    .line 317
    const-string v3, "141. realistic a.\u73b0\u5b9e(\u4e3b\u4e49)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8d

    .line 318
    const-string v3, "142. pessimistic a.\u60b2\u89c2(\u4e3b\u4e49)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8e

    .line 319
    const-string v3, "143. optimistic a.\u4e50\u89c2\u4e3b\u4e49\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8f

    .line 320
    const-string v3, "144. characteristic a.(of)\u7279\u6709\u7684,\u72ec\u7279\u7684 n.\u7279\u5f81,\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x90

    .line 321
    const-string v3, "145. artistic a.\u827a\u672f(\u5bb6)\u7684\uff0c\u7f8e\u672f(\u5bb6)\u7684\uff1b\u5584\u4e8e\u827a\u672f\u521b\u4f5c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x91

    .line 322
    const-string v3, "146. linguistic a.\u8bed\u8a00\u7684\uff0c\u8bed\u8a00\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x92

    .line 323
    const-string v3, "147. analytic a.(analytical)\u5206\u6790\u7684\uff1b\u5206\u89e3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x93

    .line 324
    const-string v3, "148. toxic a.\u6709\u6bd2\u7684\uff1b\u4e2d\u6bd2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94

    .line 325
    const-string v3, "149. zinc n.\u950c"

    aput-object v3, v0, v2

    const/16 v2, 0x95

    .line 326
    const-string v3, "150. disc n.(disk)\u5706\u76d8,\u5706\u9762,\u76d8\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x96

    .line 327
    const-string v3, "151. bad a.\u574f\u7684\uff1b\u4f4e\u52a3\u7684\uff1b\u4e0d\u8212\u670d\u7684\uff1b\u8150\u8d25\u7684\uff1b\u4e25\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x97

    .line 328
    const-string v3, "152. dead a.\u6b7b\u7684\uff1b\u65e0\u751f\u547d\u7684\uff1b\u6b7b\u6c14\u6c89\u6c89\u7684 ad.\u5b8c\u5168\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x98

    .line 329
    const-string v3, "153. head n.\u5934\uff1b\u9876\u90e8\uff1b\u9886\u5bfc,\u9996\u8111 v.\u4e3b\u7ba1\uff1b\u4f4d\u4e8e..\u9876\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x99

    .line 330
    const-string v3, "154. ahead ad.\u5728\u524d\u9762(\u5934)\uff1b\u5411(\u671d)\u524d\uff1b\u63d0\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0x9a

    .line 331
    const-string v3, "155. forehead n.\u524d\u989d;(\u4efb\u4f55\u4e8b\u7269\u7684)\u524d\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x9b

    .line 332
    const-string v3, "156. overhead a.\u5728\u5934\u9876\u4e0a\u7684;\u67b6\u7a7a\u7684 ad.\u5728\u5934\u9876\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x9c

    .line 333
    const-string v3, "157. lead v.\u9886\u5bfc;\u9886\u5148;\u901a\u5411,\u5bfc\u81f4 n.\u5e26\u9886,\u5f15\u5bfc;\u94c5"

    aput-object v3, v0, v2

    const/16 v2, 0x9d

    .line 334
    const-string v3, "158. plead v.\u6073\u6c42,\u8bf7\u6c42;\u4e3a\u2026\u8fa9\u62a4;\u63d0\u51fa\u2026\u4e3a\u7406\u7531"

    aput-object v3, v0, v2

    const/16 v2, 0x9e

    .line 335
    const-string v3, "159. mislead v.\u628a\u2026\u5e26\u9519\u8def,\u4f7f\u8bef\u5165\u5c90\u9014"

    aput-object v3, v0, v2

    const/16 v2, 0x9f

    .line 336
    const-string v3, "160. read v.\u6717\u8bfb\uff1b\u9605\u8bfb vt.\u8fa8\u8ba4\uff0c\u89c2\u5bdf vi.\u8bfb\u5230\uff0c\u83b7\u6089"

    aput-object v3, v0, v2

    const/16 v2, 0xa0

    .line 337
    const-string v3, "161. bread n.\u9762\u5305"

    aput-object v3, v0, v2

    const/16 v2, 0xa1

    .line 338
    const-string v3, "162. dread v./n.\u6050\u60e7,\u62c5\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0xa2

    .line 339
    const-string v3, "163. thread n.\u7ebf,\u7ec6\u4e1d;\u7ebf\u7d22,\u601d\u8def;\u87ba\u7eb9 v.\u7a7f\u7ebf,\u7a7f\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xa3

    .line 340
    const-string v3, "164. spread v./n.\u4f38\u5f00,\u4f38\u5c55;\u6563\u5e03,\u4f20\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0xa4

    .line 341
    const-string v3, "165. widespread a.\u5206\u5e03\u5e7f\u6cdb\u7684,\u666e\u904d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa5

    .line 342
    const-string v3, "166. instead ad.\u4ee3\u66ff,\u9876\u66ff"

    aput-object v3, v0, v2

    const/16 v2, 0xa6

    .line 343
    const-string v3, "167. lad n.\u7537\u5b69,\u5c0f\u4f19\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xa7

    .line 344
    const-string v3, "168. salad n.\u8272\u62c9,\u51c9\u62cc\u83dc"

    aput-object v3, v0, v2

    const/16 v2, 0xa8

    .line 345
    const-string v3, "169. glad a.\u9ad8\u5174\u7684\uff0c\u5feb\u6d3b\u7684\uff1b\u4e50\u610f\u7684\uff0c\u60c5\u613f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9

    .line 346
    const-string v3, "170. mad a.\u53d1\u75af\u7684;\u72c2\u70ed\u7684,\u7740\u8ff7\u7684;\u607c\u706b\u7684,\u751f\u6c14\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa

    .line 347
    const-string v3, "171. load v.\u88c5(\u8d27),\u88c5\u8f7d n.\u88c5\u8f7d(\u91cf),\u8d1f\u8377(\u91cf);(\u4e00)\u62c5"

    aput-object v3, v0, v2

    const/16 v2, 0xab

    .line 348
    const-string v3, "172. unload vi.\u5378\u8d27;\u9000\u5b50\u5f39 vt.\u6446\u8131...\u4e4b\u8d1f\u62c5;\u503e\u9500"

    aput-object v3, v0, v2

    const/16 v2, 0xac

    .line 349
    const-string v3, "173. road n.\u8def,\u9053\u8def,\u9014\u5f84"

    aput-object v3, v0, v2

    const/16 v2, 0xad

    .line 350
    const-string v3, "174. broad a.\u5bbd\u7684,\u5e7f\u9614\u7684;\u5e7f\u5927\u7684;\u5bbd\u5b8f\u7684,\u8c41\u8fbe\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xae

    .line 351
    const-string v3, "175. abroad ad.\u5230\u56fd\u5916\uff0c\u5728\u56fd\u5916\uff1b\u5728\u4f20\u64ad\uff0c\u5728\u6d41\u4f20"

    aput-object v3, v0, v2

    const/16 v2, 0xaf

    .line 352
    const-string v3, "176. railroad n.(railway)\u94c1\u8def v.\u7531\u94c1\u9053\u8fd0\u8f93"

    aput-object v3, v0, v2

    const/16 v2, 0xb0

    .line 353
    const-string v3, "177. pad n.\u57ab,\u886c\u57ab;\u4fbf\u7b3a\u7c3f v.\u52a0\u4e0a\u886c\u57ab"

    aput-object v3, v0, v2

    const/16 v2, 0xb1

    .line 354
    const-string v3, "178. sad a.\u60b2\u54c0\u7684,\u5fe7\u6101\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb2

    .line 355
    const-string v3, "179. add vt.\u52a0\uff1b\u589e\u52a0(\u8fdb)\uff1b\u8fdb\u4e00\u6b65\u8bf4/\u5199 vi.(to)\u589e\u6dfb"

    aput-object v3, v0, v2

    const/16 v2, 0xb3

    .line 356
    const-string v3, "180. odd a.\u5947\u6570\u7684;\u5947\u602a\u7684;\u5355\u53ea\u7684;\u4e34\u65f6\u7684;\u5e26\u96f6\u5934\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb4

    .line 357
    const-string v3, "181. bed n.\u5e8a,\u5e8a\u4f4d\uff1b(\u82d7)\u5e8a,\u575b\uff1b\u6cb3\u5e8a\uff0c(\u6e56\u3001\u6d77\u7684)\u5e95"

    aput-object v3, v0, v2

    const/16 v2, 0xb5

    .line 358
    const-string v3, "182. embed vt.\u628a\u2026\u5d4c(\u57cb\u3001\u63d2)\u5165\uff0c\u624e\u7262\uff1b\u4f7f\u6df1\u7559\u8111\u4e2d"

    aput-object v3, v0, v2

    const/16 v2, 0xb6

    .line 359
    const-string v3, "183. advanced a.\u8d85\u524d\u7684\uff0c\u5148\u8fdb\u7684\uff1b\u9ad8\u7ea7\u7684\uff1b\u5f00\u660e\u7684\uff1b\u524d\u8fdb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb7

    .line 360
    const-string v3, "184. provided conj.\u5018\u82e5,\u53ea\u8981,\u5047\u5982"

    aput-object v3, v0, v2

    const/16 v2, 0xb8

    .line 361
    const-string v3, "185. succeed vi.\u6210\u529f\uff1b\u7ee7\u627f\uff0c\u63a5\u66ff vt.\u63a5\u66ff\uff1b\u7ee7\u2026\u4e4b\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0xb9

    .line 362
    const-string v3, "186. proceed v.\u8fdb\u884c,\u7ee7\u7eed\u4e0b\u53bb;\u53d1\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xba

    .line 363
    const-string v3, "187. exceed v.\u8d85\u8fc7,\u80dc\u8fc7;\u8d8a\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0xbb

    .line 364
    const-string v3, "188. deed n.\u884c\u4e3a,\u884c\u52a8;\u529f\u7ee9,\u4e8b\u8ff9;\u8bc1\u4e66\uff1b\u5951\u636e"

    aput-object v3, v0, v2

    const/16 v2, 0xbc

    .line 365
    const-string v3, "189. indeed ad.\u786e\u5b9e,\u5b9e\u5728;\u771f\u6b63\u5730,\u591a\u4e48"

    aput-object v3, v0, v2

    const/16 v2, 0xbd

    .line 366
    const-string v3, "190. feed v.(on,with)\u5582\u517b,\u9972\u517b;(with)\u5411\u2026\u4f9b\u7ed9"

    aput-object v3, v0, v2

    const/16 v2, 0xbe

    .line 367
    const-string v3, "191. bleed v.\u51fa\u8840,\u6d41\u8840"

    aput-object v3, v0, v2

    const/16 v2, 0xbf

    .line 368
    const-string v3, "192. need aux.v./v.\u9700\u8981\uff1b\u5fc5\u987b n.\u9700\u8981\uff1b\u8d2b\u56f0\uff0c\u56f0\u7a98"

    aput-object v3, v0, v2

    const/16 v2, 0xc0

    .line 369
    const-string v3, "193. speed n.\u901f\u5ea6,\u5feb v.\u8fc5\u901f,\u524d\u8fdb,\u6025\u884c;\u52a0\u901f,\u4f7f\u52a0\u901f"

    aput-object v3, v0, v2

    const/16 v2, 0xc1

    .line 370
    const-string v3, "194. reed n.\u82a6\u82c7,\u82c7\u4e1b;\u82a6\u7b1b,\u7267\u7b1b"

    aput-object v3, v0, v2

    const/16 v2, 0xc2

    .line 371
    const-string v3, "195. breed v.(\u4f7f)\u7e41\u6b96,\u751f\u6b96;\u4ea7\u751f;\u6559\u517b,\u629a\u517b n.\u54c1\u79cd"

    aput-object v3, v0, v2

    const/16 v2, 0xc3

    .line 372
    const-string v3, "196. seed n.\u79cd\u5b50 v.\u64ad\u79cd;\u7ed3\u5b9e,\u7ed3\u7c7d"

    aput-object v3, v0, v2

    const/16 v2, 0xc4

    .line 373
    const-string v3, "197. weed n.\u6742\u8349,\u91ce\u8349 v.\u9664\u8349,\u9504\u8349"

    aput-object v3, v0, v2

    const/16 v2, 0xc5

    .line 374
    const-string v3, "198. wretched a.\u53ef\u601c\u7684;\u60b2\u60e8\u7684;\u80ae\u810f\u7684;\u6076\u52a3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xc6

    .line 375
    const-string v3, "199. shed v.\u6d41\u51fa;\u53d1\u6563,\u6563\u53d1,\u8131\u843d,\u8131\u53bb n.\u68da,\u5c0f\u5c4b"

    aput-object v3, v0, v2

    const/16 v2, 0xc7

    .line 376
    const-string v3, "200. married a.\u5df2\u5a5a\u7684,\u592b\u5987\u7684;(to)\u4e0e\u2026\u7ed3\u5a5a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xc8

    .line 377
    const-string v3, "201. naked a.\u88f8\u4f53\u7684,\u65e0\u906e\u655d\u7684,\u65e0\u63a9\u9970\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xc9

    .line 378
    const-string v3, "202. wicked a.\u574f\u7684;\u90aa\u6076\u7684;\u4e0d\u9053\u5fb7\u7684;\u6076\u52a3\u7684;\u6dd8\u6c14\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xca

    .line 379
    const-string v3, "203. so-called a.(\u8d2c)\u6240\u8c13\u7684\uff0c\u53f7\u79f0\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xcb

    .line 380
    const-string v3, "204. skilled a.(in)\u719f\u7ec3\u7684,\u6709\u6280\u80fd\u7684;\u9700\u8981\u6280\u80fd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xcc

    .line 381
    const-string v3, "205. ashamed a.\u60ed\u6127\u7684\uff0c\u7f9e\u803b\u7684\uff0c\u5bb3\u81ca\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xcd

    .line 382
    const-string v3, "206. accustomed a.\u60ef\u5e38\u7684\uff1b\u4e60\u60ef\u7684\uff0c\u9002\u5e94\u7684(\u4e00\u822c\u4f5c\u8868\u8bed)"

    aput-object v3, v0, v2

    const/16 v2, 0xce

    .line 383
    const-string v3, "207. learned a.\u535a\u5b66\u7684,\u6709\u5b66\u95ee\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xcf

    .line 384
    const-string v3, "208. red a.\u7ea2\u7684\uff0c\u7ea2\u8272\u7684 n.\u7ea2\u8272\uff1b\u7ea2\u8272\u989c\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xd0

    .line 385
    const-string v3, "209. infrared a./n.\u7ea2\u5916\u7ebf(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xd1

    .line 386
    const-string v3, "210. sacred a.\u795e\u5723\u7684;\u5b97\u6559\u7684;\u5e84\u4e25\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd2

    .line 387
    const-string v3, "211. hundred num.\u767e\uff0c\u4e00\u767e\uff1b[pl.]\u8bb8\u591a a.\u4e00\u767e\u7684\uff1b\u8bb8\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0xd3

    .line 388
    const-string v3, "212. tired a.\u75b2\u52b3\u7684;\u538c\u5026\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd4

    .line 389
    const-string v3, "213. hatred n.\u618e\u6068,\u618e\u6076,\u6028\u6068"

    aput-object v3, v0, v2

    const/16 v2, 0xd5

    .line 390
    const-string v3, "214. used a.\u7528\u65e7\u4e86\u7684\uff0c\u65e7\u7684\uff1b\u4e60\u60ef\u4e8e\u2026\uff1b\u8fc7\u53bb\u60ef/\u7ecf\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0xd6

    .line 391
    const-string v3, "215. complicated a.\u9519\u7efc\u590d\u6742\u7684,\u9ebb\u70e6\u7684,\u96be\u89e3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd7

    .line 392
    const-string v3, "216. sophisticated a.\u5c16\u7aef\u7684,\u590d\u6742\u7684,\u5148\u8fdb\u7684;\u8001\u7ec3\u7684,\u8001\u4e8e\u4e16\u6545\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd8

    .line 393
    const-string v3, "217. situated a.\u5750\u843d\u5728\u2026\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd9

    .line 394
    const-string v3, "218. unexpected a.\u60f3\u4e0d\u5230\u7684, \u610f\u5916\u7684, \u672a\u9884\u6599\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0xda

    .line 395
    const-string v3, "219. limited a.\u6709\u9650\u7684,\u88ab\u9650\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdb

    .line 396
    const-string v3, "220. beloved a./n.\u53d7\u7231\u6234\u7684,\u656c\u7231\u7684;\u7231\u4eba,\u88ab\u5fc3\u7231\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xdc

    .line 397
    const-string v3, "221. aid n.\u63f4\u52a9\uff0c\u6551\u62a4\uff1b\u52a9\u624b\uff0c\u8f85\u52a9\u7269 vi.\u63f4\u52a9\uff0c\u6551\u63f4"

    aput-object v3, v0, v2

    const/16 v2, 0xdd

    .line 398
    const-string v3, "222. maid n.\u5c11\u5973,\u5904\u5973,\u5973\u4ec6"

    aput-object v3, v0, v2

    const/16 v2, 0xde

    .line 399
    const-string v3, "223. raid n/v..\u88ad\u51fb,\u641c\u67e5"

    aput-object v3, v0, v2

    const/16 v2, 0xdf

    .line 400
    const-string v3, "224. afraid adj.\u5bb3\u6015\u7684\uff0c\u6050\u60e7\u7684\uff1b\u72af\u6101\u7684\uff0c\u4e0d\u4e50\u610f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe0

    .line 401
    const-string v3, "225. bid v.\u795d\u613f;\u547d\u4ee4,\u5429\u5490;\u62a5\u4ef7,\u6295\u6807 n.\u51fa\u4f17,\u6295\u6807"

    aput-object v3, v0, v2

    const/16 v2, 0xe1

    .line 402
    const-string v3, "226. forbid v.\u7981\u6b62,\u4e0d\u8bb8"

    aput-object v3, v0, v2

    const/16 v2, 0xe2

    .line 403
    const-string v3, "227. acid n.\u9178,\u9178\u6027\u7269\u8d28a.\u9178\u7684,\u9178\u5473\u7684\uff1b\u5c16\u523b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe3

    .line 404
    const-string v3, "228. splendid a.\u58ee\u4e3d\u7684,\u8f89\u714c\u7684;\u6781\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe4

    .line 405
    const-string v3, "229. rigid a.\u521a\u6027\u7684;\u523b\u677f\u7684;\u4e25\u5389\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe5

    .line 406
    const-string v3, "230. kid n.\u5c0f\u5b69,\u513f\u7ae5 v.\u620f\u5f04,\u53d6\u7b11"

    aput-object v3, v0, v2

    const/16 v2, 0xe6

    .line 407
    const-string v3, "231. lid n.\u76d6"

    aput-object v3, v0, v2

    const/16 v2, 0xe7

    .line 408
    const-string v3, "232. valid a.\u6709\u6548\u7684;\u6709\u6839\u636e\u7684;\u6b63\u5f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe8

    .line 409
    const-string v3, "233. invalid n.\u75c5\u4eba,\u4f24\u6b8b\u4eba a.\u6709\u75c5\u7684,\u4f24\u6b8b\u7684;\u65e0\u6548\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe9

    .line 410
    const-string v3, "234. solid a.\u56fa\u4f53\u7684;\u7ed3\u5b9e\u7684,\u7a33\u56fa\u7684,\u53ef\u9760\u7684 n.\u56fa\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xea

    .line 411
    const-string v3, "235. amid prep.\u5728\u2026\u4e2d\u95f4\uff0c\u5728\u2026\u4e4b\u4e2d\uff0c\u88ab\u2026\u56f4\u7ed5"

    aput-object v3, v0, v2

    const/16 v2, 0xeb

    .line 412
    const-string v3, "236. pyramid n.\u91d1\u5b57\u5854"

    aput-object v3, v0, v2

    const/16 v2, 0xec

    .line 413
    const-string v3, "237. timid a.\u80c6\u602f\u7684,\u602f\u61e6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xed

    .line 414
    const-string v3, "238. humid a.\u6e7f\u7684,\u6e7f\u6c14\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xee

    .line 415
    const-string v3, "239. void a.\u7a7a\u865a\u7684;\u6ca1\u6709\u7684;\u65e0\u6548\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xef

    .line 416
    const-string v3, "240. avoid vt.\u9632\u6b62\uff0c\u907f\u514d\uff1b\u9003\u907f\uff0c\u907f\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0xf0

    .line 417
    const-string v3, "241. rapid a.\u5feb,\u6025\u901f\u7684 n.(pl.)\u6025\u6d41,\u6e4d\u6ee9"

    aput-object v3, v0, v2

    const/16 v2, 0xf1

    .line 418
    const-string v3, "242. stupid a.\u611a\u8822\u7684,\u8fdf\u949d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf2

    .line 419
    const-string v3, "243. rid v.(of)\u4f7f\u6446\u8131,\u4f7f\u53bb\u6389"

    aput-object v3, v0, v2

    const/16 v2, 0xf3

    .line 420
    const-string v3, "244. fluid a.\u6d41\u52a8\u7684,\u6db2\u4f53\u7684 n.\u6d41\u4f53,\u6db2\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xf4

    .line 421
    const-string v3, "245. liquid n.\u6db2\u4f53 a.\u6db2\u4f53\u7684,\u6db2\u6001\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf5

    .line 422
    const-string v3, "246. vivid a.\u9c9c\u8273\u7684;\u751f\u52a8\u7684,\u6829\u6829\u5982\u751f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf6

    .line 423
    const-string v3, "247. bald a.\u79c3\u7684,\u79c3\u5934\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf7

    .line 424
    const-string v3, "248. field n.\u7530\u91ce\uff1b\u8fd0\u52a8\u573a\uff1b(\u7535\u6216\u78c1)\u573a\uff1b\u9886\u57df\uff0c\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0xf8

    .line 425
    const-string v3, "249. shield n.\u9632\u62a4\u7269,\u62a4\u7f69;\u76fe,\u76fe\u72b6\u7269 v.\u4fdd\u62a4,\u9632\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0xf9

    .line 426
    const-string v3, "250. yield v.\u51fa\u4ea7,\u751f\u957f;(to)\u5c48\u670d,\u670d\u4ece n.\u4ea7\u91cf,\u6536\u83b7"

    aput-object v3, v0, v2

    const/16 v2, 0xfa

    .line 427
    const-string v3, "251. "

    aput-object v3, v0, v2

    const/16 v2, 0xfb

    .line 428
    const-string v3, "252. "

    aput-object v3, v0, v2

    const/16 v2, 0xfc

    .line 429
    const-string v3, "253. weld v.\u710a\u63a5 n.\u710a\u63a5,\u710a\u7f1d"

    aput-object v3, v0, v2

    const/16 v2, 0xfd

    .line 430
    const-string v3, "254. child n.( [pl.] children)\u5c0f\u5b69\uff0c\u513f\u7ae5\uff0c\u513f\u5973"

    aput-object v3, v0, v2

    const/16 v2, 0xfe

    .line 431
    const-string v3, "255. mild a.\u6e29\u548c\u7684,\u8f7b\u5fae\u7684,\u5473\u6de1\u7684,\u4e0d\u542b\u6709\u5bb3\u7269\u8d28\u7684\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xff

    .line 432
    const-string v3, "256. build vt.\u5efa\u9020\uff0c\u5efa\u7b51\uff1b\u5efa\u8bbe\uff0c\u5efa\u7acb vi.\u589e\u5927\uff0c\u589e\u5f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x100

    .line 433
    const-string v3, "257. wild a.\u91ce\u6027\u7684,\u91ce\u751f\u7684;\u91ce\u86ee\u7684;\u72c2\u70ed\u7684;\u8352\u829c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101

    .line 434
    const-string v3, "258. old a.\u5e74\u8001\u7684\uff1b\u2026\u5c81\u7684\uff1b\u957f\u65f6\u95f4\u7684\uff0c\u8001\u7684\uff1b\u8fc7\u53bb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102

    .line 435
    const-string v3, "259. bold a.\u5927\u80c6\u7684,\u52c7\u6562\u7684;\u5192\u5931\u7684;\u9ed1\u4f53\u7684,\u7c97\u4f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103

    .line 436
    const-string v3, "260. cold a.\u51b7\u7684\uff0c\u5bd2\u51b7\u7684\uff1b\u51b7\u6de1\u7684 n.\u51b7\uff0c\u5bd2\u51b7\uff1b\u4f24\u98ce"

    aput-object v3, v0, v2

    const/16 v2, 0x104

    .line 437
    const-string v3, "261. scold v.\u8d23\u9a82,\u8bad\u65a5"

    aput-object v3, v0, v2

    const/16 v2, 0x105

    .line 438
    const-string v3, "262. fold v.\u6298\u53e0;\u5408\u62e2;\u62b1\u4f4f n.\u8936,\u8936\u75d5;\u7f8a\u680f;\u4fe1\u5f92"

    aput-object v3, v0, v2

    const/16 v2, 0x106

    .line 439
    const-string v3, "263. unfold vt.\u6253\u5f00;\u663e\u9732;\u5c55\u793a vi.\u5448\u73b0;\u663e\u793a;\u5c55\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x107

    .line 440
    const-string v3, "264. gold n.\u91d1\uff0c\u9ec4\u91d1\uff1b\u91d1\u5e01\uff1b\u91d1\u9ec4\u8272 a.\u91d1\u7684\uff0c\u91d1\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x108

    .line 441
    const-string v3, "265. hold v.\u62ff\u7740;\u4fdd\u6709;\u6258\u4f4f;\u4e3e\u884c;\u7ee7\u7eed n.\u63e1\u4f4f;\u8239\u8231"

    aput-object v3, v0, v2

    const/16 v2, 0x109

    .line 442
    const-string v3, "266. household n.\u5bb6\u5ead\uff0c\u5bb6\u4eba a.\u5bb6\u5ead(\u52a1)\u7684\uff0c\u5bb6\u5e38\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10a

    .line 443
    const-string v3, "267. withhold vt.\u4f7f\u505c\u6b62;\u62d2\u7ed9;\u4fdd\u7559;\u6291\u5236 vi.\u5fcd\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x10b

    .line 444
    const-string v3, "268. uphold vt.\u652f\u6301,\u8d5e\u6210;\u4e3e\u8d77;\u575a\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x10c

    .line 445
    const-string v3, "269. threshold n.\u95e8\u69db;\u5165\u95e8,\u5f00\u7aef"

    aput-object v3, v0, v2

    const/16 v2, 0x10d

    .line 446
    const-string v3, "270. world n.\u4e16\u754c\uff0c\u5730\u7403\uff1b\u2026\u754c\uff0c\u9886\u57df\uff1b\u4e16\u95f4\uff1b\u5168\u4e16\u754c"

    aput-object v3, v0, v2

    const/16 v2, 0x10e

    .line 447
    const-string v3, "271. could v.aux.(\u53e3\u8bed)(\u8868\u793a\u8bb8\u53ef\u6216\u8bf7\u6c42\uff09\u53ef\u4ee5...\uff0c\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x10f

    .line 448
    const-string v3, "272. should aux.v.\u5e94\u8be5\uff1b\u4e07\u4e00\uff1b\u53ef\u80fd\uff0c\u8be5\uff1b\u5c31\uff1b\u7adf\u7136\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x110

    .line 449
    const-string v3, "273. mould n.(mold)\u6a21\u5b50\uff0c\u94f8\u578b v.\u6d47\u94f8\uff0c\u9020\u578b\uff0c\u5851\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x111

    .line 450
    const-string v3, "274. would aux./v.\u5c06\uff1b\u53ef\u80fd\uff1b\u5c06\u4f1a\uff1b\u603b\u662f\uff0c\u603b\u4f1a\uff1b\u5b81\u613f"

    aput-object v3, v0, v2

    const/16 v2, 0x112

    .line 451
    const-string v3, "275. and conj.\u548c\uff0c\u4e0e\uff0c\u800c\u4e14\uff1b\u90a3\u4e48\uff1b\u63a5\u8fde\uff0c\u53c8"

    aput-object v3, v0, v2

    const/16 v2, 0x113

    .line 452
    const-string v3, "276. band n.\u6761,\u5e26;\u4e50\u961f;\u6ce2\u6bb5;\u4e00\u7fa4,\u4e00\u4f19 v.\u7f1a,\u7ed1\u624e"

    aput-object v3, v0, v2

    const/16 v2, 0x114

    .line 453
    const-string v3, "277. husband n.\u4e08\u592b"

    aput-object v3, v0, v2

    const/16 v2, 0x115

    .line 454
    const-string v3, "278. hand n.\u624b\uff0c\u4eba\u624b\uff0c\u96c7\u5458\uff1b\u4e13\u95e8\u4e1a\u4eba\u5458\uff1b\u6307\u9488 v.\u4ea4"

    aput-object v3, v0, v2

    const/16 v2, 0x116

    .line 455
    const-string v3, "279. beforehand ad.\u9884\u5148,\u4e8b\u5148"

    aput-object v3, v0, v2

    const/16 v2, 0x117

    .line 456
    const-string v3, "280. shorthand n.\u901f\u8bb0"

    aput-object v3, v0, v2

    const/16 v2, 0x118

    .line 457
    const-string v3, "281. land n.\u9646\u5730,\u571f\u5730,\u56fd\u5bb6 v.(\u4f7f)\u9760\u5cb8(\u767b\u9646,\u964d\u843d)"

    aput-object v3, v0, v2

    const/16 v2, 0x119

    .line 458
    const-string v3, "282. highland n. \u9ad8\u5730,\u9ad8\u539f"

    aput-object v3, v0, v2

    const/16 v2, 0x11a

    .line 459
    const-string v3, "283. inland a./ad.\u56fd\u5185,\u5185\u5730,\u5185\u9646"

    aput-object v3, v0, v2

    const/16 v2, 0x11b

    .line 460
    const-string v3, "284. mainland n.\u5927\u9646,\u672c\u571f"

    aput-object v3, v0, v2

    const/16 v2, 0x11c

    .line 461
    const-string v3, "285. island n.\u5c9b\uff0c\u5c9b\u5c7f\uff1b(\u9053\u8def\u4e0a\u7684)\u4ea4\u901a\u5b89\u5168\u5c9b"

    aput-object v3, v0, v2

    const/16 v2, 0x11d

    .line 462
    const-string v3, "286. demand n./v.\u8981\u6c42,\u8bf7\u6c42,\u9700\u8981(\u91cf) v.\u67e5\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0x11e

    .line 463
    const-string v3, "287. command n./v.\u547d\u4ee4\uff0c\u6307\u6325\uff0c\u63a7\u5236 n.\u638c\u63e1\uff0c\u8fd0\u7528\u80fd\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x11f

    .line 464
    const-string v3, "288. expand v.(\u4f7f)\u81a8\u80c0,(\u4f7f)\u6269\u5f20;\u5f20\u5f00,\u5c55\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x120

    .line 465
    const-string v3, "289. brand n.\u5546\u6807,\u6807\u8bb0,\u724c\u5b50 v.\u4f7f\u94ed\u8bb0;\u6253\u706b\u5370,\u6253\u70d9\u5370"

    aput-object v3, v0, v2

    const/16 v2, 0x121

    .line 466
    const-string v3, "290. grand a.\u76db\u5927\u7684,\u8c6a\u534e\u7684;\u91cd\u5927\u7684,\u4e3b\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x122

    .line 467
    const-string v3, "291. sand n.\u6c99;(pl.)\u6c99\u6ee9,\u6c99\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x123

    .line 468
    const-string v3, "292. thousand num./n./a.\u4e00\u5343\uff1b[pl.]\u8bb8\u8bb8\u591a\u591a\uff0c\u6210\u5343\u4e0a\u4e07"

    aput-object v3, v0, v2

    const/16 v2, 0x124

    .line 469
    const-string v3, "293. stand vi.\u7ad9\u7acb\uff1b\u4f4d\u4e8e\uff1b\u7ecf\u53d7 n.\u53f0\uff0c\u5ea7\uff1b\u8d27\u644a\uff1b\u7acb\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x125

    .line 470
    const-string v3, "294. withstand vt.\u62b5\u6297,\u7ecf\u53d7\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x126

    .line 471
    const-string v3, "295. understand v.\u61c2,\u7406\u89e3;\u83b7\u6089,\u542c\u8bf4;\u63e3\u6d4b,\u8ba4\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x127

    .line 472
    const-string v3, "296. misunderstand v.\u8bef\u89e3,\u8bef\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x128

    .line 473
    const-string v3, "297. end n.\u672b\u7aef\uff0c\u7aef\uff0c\u68a2\uff1b\u76ee\u6807\uff0c\u76ee\u7684 v.\u7ec8\u6b62\uff0c\u7ed3\u675f"

    aput-object v3, v0, v2

    const/16 v2, 0x129

    .line 474
    const-string v3, "298. bend v.(\u4f7f)\u5f2f\u66f2;\u5c48\u4ece,\u5c48\u670d n.\u5f2f\u66f2(\u5904),\u66f2\u6298\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x12a

    .line 475
    const-string v3, "299. ascend vi.\u6e10\u6e10\u4e0a\u5347\uff0c\u5347\u9ad8vt.\u6500\u767b\uff0c\u767b\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x12b

    .line 476
    const-string v3, "300. descend v.\u4e0b\u6765,\u4e0b\u964d;\u9057\u4f20(\u6307\u8d22\u4ea7,\u6c14\u8d28,\u6743\u5229)"

    aput-object v3, v0, v2

    const/16 v2, 0x12c

    .line 477
    const-string v3, "301. transcend vt.\u8d85\u51fa,\u8d85\u8d8a(\u7ecf\u9a8c\u3001\u77e5\u8bc6\u3001\u80fd\u529b\u7684\u8303\u56f4\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x12d

    .line 478
    const-string v3, "302. dividend n.\u7ea2\u5229\uff0c\u80a1\u606f\uff1b\u56de\u62a5\uff0c\u6548\u76ca\uff1b\u88ab\u9664\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x12e

    .line 479
    const-string v3, "303. defend v.\u9632\u5b88,\u4fdd\u536b;\u4e3a\u2026\u8fa9\u62a4,\u4e3a\u2026\u7b54\u8fa9"

    aput-object v3, v0, v2

    const/16 v2, 0x12f

    .line 480
    const-string v3, "304. offend v.\u72af\u7f6a,\u5192\u72af,\u8fdd\u53cd,\u5f97\u7f6a,\u4f7f...\u4e0d\u6109\u5feb"

    aput-object v3, v0, v2

    const/16 v2, 0x130

    .line 481
    const-string v3, "305. legend n.\u4f20\u8bf4,\u4f20\u5947"

    aput-object v3, v0, v2

    const/16 v2, 0x131

    .line 482
    const-string v3, "306. comprehend vt.\u7406\u89e3\uff0c\u9886\u4f1a\uff1b\u5305\u542b\uff0c\u5305\u62ec"

    aput-object v3, v0, v2

    const/16 v2, 0x132

    .line 483
    const-string v3, "307. friend n.\u670b\u53cb"

    aput-object v3, v0, v2

    const/16 v2, 0x133

    .line 484
    const-string v3, "308. weekend n.\u5468\u672b"

    aput-object v3, v0, v2

    const/16 v2, 0x134

    .line 485
    const-string v3, "309. lend vt.\u501f\u7ed9,\u8d37(\u6b3e)"

    aput-object v3, v0, v2

    const/16 v2, 0x135

    .line 486
    const-string v3, "310. blend n.\u6df7\u5408(\u7269) v.\u6df7\u548c,\u6df7\u6742"

    aput-object v3, v0, v2

    const/16 v2, 0x136

    .line 487
    const-string v3, "311. mend v.\u4fee\u7406,\u7f1d\u8865;\u6539\u6b63,\u6539\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x137

    .line 488
    const-string v3, "312. amend vt.\u4fee\u6539\uff0c\u4fee\u8ba2\uff0c\u6539\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x138

    .line 489
    const-string v3, "313. commend v.\u79f0\u8d5e\uff0c\u8868\u626c\uff1a\u59d4\u6258\u4fdd\u7ba1\uff1b\u63a8\u8350"

    aput-object v3, v0, v2

    const/16 v2, 0x139

    .line 490
    const-string v3, "314. recommend v.\u63a8\u8350,\u4ecb\u7ecd;\u529d\u544a,\u5efa\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0x13a

    .line 491
    const-string v3, "315. depend v.(on)\u53d6\u51b3\u4e8e,\u4f9d\u9760,\u4fe1\u8d56,\u76f8\u4fe1"

    aput-object v3, v0, v2

    const/16 v2, 0x13b

    .line 492
    const-string v3, "316. spend v.\u82b1\u8d39;\u6d88\u8017,\u7528\u5c3d;\u5ea6\u8fc7,\u6d88\u78e8"

    aput-object v3, v0, v2

    const/16 v2, 0x13c

    .line 493
    const-string v3, "317. suspend v.\u60ac(\u6d6e)\uff0c\u6302\uff1b\u6682\u505c\uff0c\u53d6\u6d88\uff1b\u63a8\u8fdf"

    aput-object v3, v0, v2

    const/16 v2, 0x13d

    .line 494
    const-string v3, "318. expend v.\u6d88\u8d39,\u82b1\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0x13e

    .line 495
    const-string v3, "319. trend n.\u503e\u5411,\u8d8b\u52bf vi.\u4f38\u5411,\u503e\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x13f

    .line 496
    const-string v3, "320. send v.(sent,sent)1.\u6253\u53d1\uff1b\u6d3e\u9063 2.\u9001\uff1b\u5bc4\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x140

    .line 497
    const-string v3, "321. tend v.\u8d8b\u5411,\u5f80\u5f80\u662f;\u7167\u6599,\u770b\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x141

    .line 498
    const-string v3, "322. pretend v.\u5047\u88c5,\u5047\u6258,\u501f\u53e3,(\u5728\u6f14\u620f\u4e2d)\u88c5\u626e"

    aput-object v3, v0, v2

    const/16 v2, 0x142

    .line 499
    const-string v3, "323. intend vt.\u60f3\u8981,\u6253\u7b97,\u4f01\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x143

    .line 500
    const-string v3, "324. contend v.\u7ade\u4e89,\u6597\u4e89;\u575a\u51b3\u4e3b\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0x144

    .line 501
    const-string v3, "325. attend vt.\u51fa\u5e2d\uff0c\u53c2\u52a0\uff1b\u7167\u987e\uff0c\u62a4\u7406 vi.\u6ce8\u610f\uff1b\u4f8d\u5949"

    aput-object v3, v0, v2

    const/16 v2, 0x145

    .line 502
    const-string v3, "326. extend v.\u5ef6\u957f,\u5ef6\u4f38;\u6269\u5145;\u7ed9\u4e88;\u63d0\u4f9b;\u4f30\u4ef7"

    aput-object v3, v0, v2

    const/16 v2, 0x146

    .line 503
    const-string v3, "327. bind v.\u6346,\u7ed1,\u5305\u62ec,\u675f\u7f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x147

    .line 504
    const-string v3, "328. find v.(found,found)\u627e\u5230\uff1b\u53d1\u73b0\uff1b\u53d1\u89c9\uff1b\u611f\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x148

    .line 505
    const-string v3, "329. behind prep.\u5728...\u7684\u80cc\u540e\uff0c(\u9057\u7559)\u5728..\u540e\u9762\uff1b\u843d\u540e\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x149

    .line 506
    const-string v3, "330. kind a.\u4ec1\u6148\u7684\uff0c\u53cb\u597d\u7684\uff0c\u4eb2\u5207\u7684\uff0c\u548c\u853c\u7684 n.\u79cd\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x14a

    .line 507
    const-string v3, "331. mankind n.\u4eba\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x14b

    .line 508
    const-string v3, "332. blind a.\u76f2\u7684\uff0c\u778e\u7684\uff1b\u76f2\u76ee\u7684 vt.\u4f7f\u5931\u660e n.\u767e\u53f6\u7a97"

    aput-object v3, v0, v2

    const/16 v2, 0x14c

    .line 509
    const-string v3, "333. mind n.\u7cbe\u795e,\u7406\u667a,\u610f\u89c1,\u8bb0\u5fc6\u529b v.\u6ce8\u610f,\u4ecb\u610f,\u53cd\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x14d

    .line 510
    const-string v3, "334. remind v.(of)\u63d0\u9192,\u4f7f\u60f3\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x14e

    .line 511
    const-string v3, "335. grind v.\u78e8(\u788e),\u78be(\u788e)"

    aput-object v3, v0, v2

    const/16 v2, 0x14f

    .line 512
    const-string v3, "336. wind n.\u98ce;\u6c14\u606f v.\u8f6c\u52a8;\u7f20\u7ed5;\u4e0a\u53d1\u6761,;\u873f\u8712\u800c\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x150

    .line 513
    const-string v3, "337. bond n.\u7ed3\u5408(\u7269),\u7c98\u7ed3(\u5242),\u8054\u7ed3;\u516c\u503a,\u503a\u5238,\u5951\u7ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x151

    .line 514
    const-string v3, "338. second a.\u7b2c\u4e8c;\u6b21\u7b49\u7684,\u4e8c\u7b49\u7684 n.\u79d2 v.\u8d5e\u6210,\u9644\u548c"

    aput-object v3, v0, v2

    const/16 v2, 0x152

    .line 515
    const-string v3, "339. fond a.(of)\u559c\u7231\u7684,\u7231\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x153

    .line 516
    const-string v3, "340. diamond n.\u91d1\u94a2\u77f3,\u94bb\u77f3;\u83f1\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x154

    .line 517
    const-string v3, "341. pond n.\u6c60\u5858"

    aput-object v3, v0, v2

    const/16 v2, 0x155

    .line 518
    const-string v3, "342. respond v.\u56de\u7b54,\u54cd\u5e94,\u4f5c\u51fa\u53cd\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x156

    .line 519
    const-string v3, "343. correspond v.\u901a\u4fe1,(with)\u7b26\u5408,\u4e00\u81f4;(to)\u76f8\u5f53\u4e8e,\u5bf9\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x157

    .line 520
    const-string v3, "344. beyond prep.\u5728(\u6216\u5411)...\u7684\u90a3\u8fb9\uff0c\u8fdc\u4e8e\uff1b\u8d85\u51fa\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x158

    .line 521
    const-string v3, "345. fund n.\u8d44\u91d1,\u57fa\u91d1;\u5b58\u6b3e,\u73b0\u6b3e;(\u77e5\u8bc6\u7b49\u7684)\u7d2f\u79ef"

    aput-object v3, v0, v2

    const/16 v2, 0x159

    .line 522
    const-string v3, "346. refund n.\u5f52\u8fd8,\u507f\u8fd8\u989d,\u9000\u6b3e v.\u9000\u8fd8,\u507f\u8fd8,\u507f\u4ed8"

    aput-object v3, v0, v2

    const/16 v2, 0x15a

    .line 523
    const-string v3, "347. bound v./n.\u8df3(\u8dc3) a.\u88ab\u675f\u7f1a\u7684\uff0c\u4e00\u5b9a\u7684\uff1bn.\u754c\u9650"

    aput-object v3, v0, v2

    const/16 v2, 0x15b

    .line 524
    const-string v3, "348. abound vi.\u5927\u91cf\u5b58\u5728\uff1b(in\uff0cwith)\u5145\u6ee1\uff0c\u5bcc\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x15c

    .line 525
    const-string v3, "349. found vt.\u5efa\u7acb;\u521b\u7acb;\u521b\u529e;\u4f7f\u6709\u6839\u636e;\u94f8\u9020;\u7194\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0x15d

    .line 526
    const-string v3, "350. profound a.\u6df1\u523b\u7684,\u610f\u4e49\u6df1\u8fdc\u7684;\u6e0a\u535a\u7684,\u9020\u8be3\u6df1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x15e

    .line 527
    const-string v3, "351. hound n.\u730e\u72d7\uff1b\u5351\u9119\u7684\u4eba vt.\u7528\u730e\u72d7\u8ffd\uff0c\u8ffd\u9010"

    aput-object v3, v0, v2

    const/16 v2, 0x15f

    .line 528
    const-string v3, "352. pound n.\u78c5;\u82f1\u9551 v.(\u8fde\u7eed)\u731b\u51fb,(\u731b\u70c8)\u6572\u6253,\u6363\u788e"

    aput-object v3, v0, v2

    const/16 v2, 0x160

    .line 529
    const-string v3, "353. compound n.\u6df7\u5408\u7269,\u5316\u5408\u7269 a.\u6df7\u5408\u7684,\u5316\u5408\u7684\uff1bvt.\u6df7\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x161

    .line 530
    const-string v3, "354. round a.\u5706\u7684prep.\u56f4\u7ed5ad.\u5728\u5468\u56f4v.\u7ed5\u884cn.(\u4e00)\u56de\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x162

    .line 531
    const-string v3, "355. around ad.\u5728...\u5468\u56f4\uff0c\u5230\u5904 prep.\u5728..\u56db\u5468(\u6216\u9644\u8fd1)"

    aput-object v3, v0, v2

    const/16 v2, 0x163

    .line 532
    const-string v3, "356. ground n.\u5730\uff0c\u5730\u9762\uff0c\u571f\u5730\uff1b\u573a\u5730\uff0c\u573a\u6240\uff1b\u7406\u7531\uff0c\u6839\u636e"

    aput-object v3, v0, v2

    const/16 v2, 0x164

    .line 533
    const-string v3, "357. background n.\u80cc\u666f,\u7ecf\u5386\uff1b\u5e55\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0x165

    .line 534
    const-string v3, "358. underground a.\u5730\u4e0b\u7684;\u79d8\u5bc6\u7684 n.\u5730\u94c1 ad.\u5728\u5730\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x166

    .line 535
    const-string v3, "359. playground n.\u8fd0\u52a8\u573a,\u6e38\u620f\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x167

    .line 536
    const-string v3, "360. surround vt.\u5305\u56f4\uff0c\u73af\u7ed5 n.\u73af\u7ed5\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x168

    .line 537
    const-string v3, "361. sound n.\u58f0\u97f3v.\u53d1\u58f0,\u54cda.\u5065\u5168\u7684,\u5b8c\u597d\u7684;\u6b63\u5f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x169

    .line 538
    const-string v3, "362. wound n.\u521b\u4f24,\u4f24\u53e3 v.\u4f24,\u4f24\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0x16a

    .line 539
    const-string v3, "363. god n.\u4e0a\u5e1d(\u5c0f\u5199god\u6cdb\u6307\u6240\u6709\u7684\u201c\u795e\uff0c\u795e\u50cf\u201d)"

    aput-object v3, v0, v2

    const/16 v2, 0x16b

    .line 540
    const-string v3, "364. method n.\u65b9\u6cd5,\u529e\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x16c

    .line 541
    const-string v3, "365. period n.\u65f6\u671f,\u65f6\u4ee3;\u5b66\u65f6;\u5468\u671f,\u4e00\u6bb5\u65f6\u95f4;\u53e5\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x16d

    .line 542
    const-string v3, "366. nod v.\u70b9(\u5934),\u70b9\u5934\u62db\u547c n.\u70b9\u5934\u62db\u547c;\u6253\u76f9,\u778c\u7761"

    aput-object v3, v0, v2

    const/16 v2, 0x16e

    .line 543
    const-string v3, "367. food n.\u98df\u7269\uff0c\u7cae\u98df\uff0c\u517b\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x16f

    .line 544
    const-string v3, "368. good a.\u597d\u7684;\u5584\u826f\u7684;\u64c5\u957f\u7684;\u4e56\u7684 n.\u597d\u5904;\u5229\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0x170

    .line 545
    const-string v3, "369. childhood n.\u5e7c\u5e74,\u7ae5\u5e74"

    aput-object v3, v0, v2

    const/16 v2, 0x171

    .line 546
    const-string v3, "370. likelihood n.\u53ef\u80fd\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x172

    .line 547
    const-string v3, "371. neighborhood n.(neighbourhood)\u90bb\u5c45;\u56db\u90bb,\u8857\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x173

    .line 548
    const-string v3, "372. blood n.\u8840\u6db2\uff0c\u8840\uff1b\u8840\u7edf\uff0c\u8840\u4eb2\uff1b\u8840\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x174

    .line 549
    const-string v3, "373. flood n.\u6d2a\u6c34,\u6c34\u707e v.\u6df9\u6ca1,\u53d1\u5927\u6c34,\u6cdb\u6ee5"

    aput-object v3, v0, v2

    const/16 v2, 0x175

    .line 550
    const-string v3, "374. mood n.\u5fc3\u60c5,\u60c5\u7eea;\u8bed\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x176

    .line 551
    const-string v3, "375. wood n.\u6728\u6750\uff0c\u6728\u5934\uff0c\u6728\u6599\uff1b(pl.)\u68ee\u6797\uff0c\u6797\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x177

    .line 552
    const-string v3, "376. rod n.\u6746,\u68d2"

    aput-object v3, v0, v2

    const/16 v2, 0x178

    .line 553
    const-string v3, "377. card n.\u5361\u7247,\u540d\u7247;\u7eb8\u724c;\u7eb8\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x179

    .line 554
    const-string v3, "378. discard vt.\u4e22\u5f03\uff0c\u629b\u5f03\uff0c\u9057\u5f03"

    aput-object v3, v0, v2

    const/16 v2, 0x17a

    .line 555
    const-string v3, "379. postcard n.\u660e\u4fe1\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x17b

    .line 556
    const-string v3, "380. standard n.\u6807\u51c6,\u89c4\u5219 a.\u6807\u51c6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x17c

    .line 557
    const-string v3, "381. beard n.\u80e1\u987b"

    aput-object v3, v0, v2

    const/16 v2, 0x17d

    .line 558
    const-string v3, "382. regard v.(as)\u628a\u2026\u770b\u4f5c\u4e3a;\u8003\u8651n.(pl.)\u656c\u91cd,\u95ee\u5019"

    aput-object v3, v0, v2

    const/16 v2, 0x17e

    .line 559
    const-string v3, "383. disregard vt.\u4e0d\u7406\u4f1a;\u5ffd\u89c6;\u6f20\u89c6 n.\u5ffd\u89c6;\u6f20\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x17f

    .line 560
    const-string v3, "384. hard a.\u575a\u786c\u7684\uff1b\u7ed3\u5b9e\u7684\uff1b\u56f0\u96be\u7684\uff1b\u96be\u5fcd\u7684\uff1b\u4e25\u5389\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x180

    .line 561
    const-string v3, "385. orchard n.\u679c\u56ed,\u679c\u56ed\u91cc\u7684\u5168\u90e8\u679c\u6811,<\u7f8e\u4fda>\u68d2\u7403\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x181

    .line 562
    const-string v3, "386. board n.\u677f,\u6728\u677f;\u5168\u4f53\u59d4\u5458;\u4f19\u98df v.\u4e0a\u8239(\u8f66,\u98de\u673a)"

    aput-object v3, v0, v2

    const/16 v2, 0x182

    .line 563
    const-string v3, "387. aboard ad.&prep.\u5728\u8239(\u98de\u673a\u3001\u8f66)\u4e0a\uff1bad.\u4e0a\u8239(\u98de\u673a)"

    aput-object v3, v0, v2

    const/16 v2, 0x183

    .line 564
    const-string v3, "388. blackboard n.\u9ed1\u677f"

    aput-object v3, v0, v2

    const/16 v2, 0x184

    .line 565
    const-string v3, "389. cupboard n.\u7897\u67dc,\u5c0f\u6a71"

    aput-object v3, v0, v2

    const/16 v2, 0x185

    .line 566
    const-string v3, "390. keyboard n.\u952e\u76d8 vt.\u7528\u952e\u76d8\u8f93\u5165(\u4fe1\u606f)"

    aput-object v3, v0, v2

    const/16 v2, 0x186

    .line 567
    const-string v3, "391. guard v./n.\u4fdd\u536b\uff0c\u5b88\u536b\uff0c\u63d0\u9632 n.\u54e8\u5175\uff0c\u8b66\u536b\uff0c\u770b\u5b88"

    aput-object v3, v0, v2

    const/16 v2, 0x187

    .line 568
    const-string v3, "392. safeguard v.\u7ef4\u62a4,\u4fdd\u62a4,\u634d\u536b n.\u5b89\u5168\u88c5\u7f6e,\u5b89\u5168\u63aa\u65bd"

    aput-object v3, v0, v2

    const/16 v2, 0x188

    .line 569
    const-string v3, "393. ward n.\u75c5\u623f;\u884c\u653f\u533a;\u76d1\u62a4;\u88ab\u76d1\u62a4\u4eba vt.\u6321\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x189

    .line 570
    const-string v3, "394. award vt.\u6388\u4e88,\u7ed9\u4e88\uff1b\u5224\u5b9a n.\u5956,\u5956\u91d1\uff1b\u4ef2\u88c1"

    aput-object v3, v0, v2

    const/16 v2, 0x18a

    .line 571
    const-string v3, "395. reward n.(for)\u62a5\u916c,\u8d4f\u91d1 v.(for)\u916c\u52b3;\u916c\u8c22"

    aput-object v3, v0, v2

    const/16 v2, 0x18b

    .line 572
    const-string v3, "396. steward n.\u4e58\u52a1\u5458\uff0c\u670d\u52a1\u5458\uff1b\u770b\u7ba1\u4eba\uff1b\u81b3\u98df\u7ba1\u7406\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x18c

    .line 573
    const-string v3, "397. backward a.\u5411\u540e\u7684,\u5012\u884c\u7684;\u8fdf\u949d\u7684 ad.\u5411\u540e,\u671d\u53cd\u65b9\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x18d

    .line 574
    const-string v3, "398. awkward   a.\u7b28\u62d9\u7684\uff1b\u5c34\u5c2c\u7684\uff1b\u4f7f\u7528\u4e0d\u4fbf\u7684\uff1b\u96be\u5904\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x18e

    .line 575
    const-string v3, "399. inward ad.\u5411\u5185,\u5728\u5185 a.\u5411\u5185\u7684,\u5728\u5185\u7684,\u91cc\u9762\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x18f

    .line 576
    const-string v3, "400. downward  a.\u5411\u4e0b\u7684 ad.(also downwards)\u5411\u4e0b,\u5f80\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x190

    .line 577
    const-string v3, "401. coward n.\u61e6\u592b,\u80c6\u602f\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x191

    .line 578
    const-string v3, "402. toward    prep.(towards)\u671d\uff0c\u5411\uff1b\u5c06\u8fd1\uff1b\u5bf9\u4e8e\uff1b\u4e3a\u4e86"

    aput-object v3, v0, v2

    const/16 v2, 0x192

    .line 579
    const-string v3, "403. upward a.\u5411\u4e0a\u7684,\u4e0a\u5347\u7684 ad.\u5411\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x193

    .line 580
    const-string v3, "404. afterward ad.(afterwards)\u4ee5\u540e\uff0c\u540e\u6765"

    aput-object v3, v0, v2

    const/16 v2, 0x194

    .line 581
    const-string v3, "405. forward ad.(also forwards)\u5411\u524d a.\u5411\u524d\u7684 v.\u8f6c\u4ea4"

    aput-object v3, v0, v2

    const/16 v2, 0x195

    .line 582
    const-string v3, "406. straightforward a.\u6b63\u76f4\u7684;\u7b80\u5355\u7684,\u6613\u61c2\u7684 ad.\u5766\u7387\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x196

    .line 583
    const-string v3, "407. outward a.\u5916\u9762\u7684,\u516c\u5f00\u7684,\u5411\u5916\u7684ad.\u5411\u5916,\u5728\u5916n.\u5916\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x197

    .line 584
    const-string v3, "408. yard n.\u9662\u5b50,\u573a\u5730;\u7801"

    aput-object v3, v0, v2

    const/16 v2, 0x198

    .line 585
    const-string v3, "409. courtyard n.\u9662\u5b50\uff0c\u5ead\u9662\uff0c\u5929\u4e95"

    aput-object v3, v0, v2

    const/16 v2, 0x199

    .line 586
    const-string v3, "410. hazard n.\u5371\u9669,\u5192\u9669,\u5371\u5bb3 v.\u5192\u9669,\u62fc\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0x19a

    .line 587
    const-string v3, "411. herd n.\u7fa4,\u517d\u7fa4,\u725b\u7fa4 v.\u653e\u7267,\u7fa4\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x19b

    .line 588
    const-string v3, "412. shepherd n.\u7267\u6c11,\u7267\u7f8a\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x19c

    .line 589
    const-string v3, "413. bird n.\u9e1f\uff0c\u96c0\uff1b\u5973\u4eba\uff1b\u5618\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x19d

    .line 590
    const-string v3, "414. weird a.\u53e4\u602a\u7684\uff0c\u79bb\u5947\u7684\uff1b\u602a\u8bde\u7684\uff0c\u795e\u79d8\u800c\u53ef\u6015\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x19e

    .line 591
    const-string v3, "415. third num.\u7b2c\u4e09(\u4e2a)\uff0c\u4e09\u5206\u4e4b\u4e00(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x19f

    .line 592
    const-string v3, "416. cord n.\u7ef3,\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x1a0

    .line 593
    const-string v3, "417. accord vt.\u7ed9\u4e88(\u6b22\u8fce\u3001\u79f0\u9882\u7b49) vi.&n.\u7b26\u5408\uff0c\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1a1

    .line 594
    const-string v3, "418. record n.\u8bb0\u5f55;\u6700\u9ad8\u8bb0\u5f55;\u5c65\u5386;\u5531\u7247v.\u8bb0\u5f55;\u5f55\u97f3"

    aput-object v3, v0, v2

    const/16 v2, 0x1a2

    .line 595
    const-string v3, "419. afford vt.\u62c5\u8d1f\u5f97\u8d77(\u635f\u5931\u3001\u8d39\u7528\u3001\u540e\u679c\u7b49)\uff0c\u4e70\u5f97\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x1a3

    .line 596
    const-string v3, "420. lord n.(Lord)\u4e0a\u5e1d,\u4e3b;\u4e3b\u4eba,\u957f\u5b98,\u541b\u4e3b,\u8d35\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1a4

    .line 597
    const-string v3, "421. landlord n.\u623f\u4e1c,\u5730\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0x1a5

    .line 598
    const-string v3, "422. word n.\u8bcd\uff0c\u8bcd\u8bed\uff1b\u8a00\u8bed\uff0c\u8bdd\uff1b\u8c08\u8bdd\uff1b\u6d88\u606f\uff0c\u4fe1\u606f"

    aput-object v3, v0, v2

    const/16 v2, 0x1a6

    .line 599
    const-string v3, "423. sword n.\u5251\uff0c\u5200\uff1b\u6b66\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x1a7

    .line 600
    const-string v3, "424. absurd a.\u8352\u8c2c\u7684\uff0c\u8352\u8bde\u7684\uff0c\u8352\u5510\u53ef\u7b11\u7684\uff1b\u4e0d\u5408\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1a8

    .line 601
    const-string v3, "425. applaud vt.\u9f13\u638c\u6b22\u8fce\uff1b\u8d5e\u540c vi.\u9f13\u638c\u6b22\u8fce\uff0c\u6b22\u547c"

    aput-object v3, v0, v2

    const/16 v2, 0x1a9

    .line 602
    const-string v3, "426. fraud n.\u6b3a\u8bc8\uff0c\u8bc8\u9a97\uff1b\u6b3a\u9a97(\u884c\u4e3a)\uff1b\u9a97\u5b50\uff1b\u5047\u8d27"

    aput-object v3, v0, v2

    const/16 v2, 0x1aa

    .line 603
    const-string v3, "427. bud n.\u82bd,\u82b1\u82de v.\u53d1\u82bd,\u542b\u82de\u6b32\u653e"

    aput-object v3, v0, v2

    const/16 v2, 0x1ab

    .line 604
    const-string v3, "428. mud n.\u6ce5\uff0c\u6ce5\u6d46 v.\u5f04\u810f\uff0c\u4f7f\u6cbe\u6c61\u6ce5"

    aput-object v3, v0, v2

    const/16 v2, 0x1ac

    .line 605
    const-string v3, "429. loud a.\u5927\u58f0\u7684,\u54cd\u4eae\u7684;\u5435\u95f9\u7684,\u55a7\u56a3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1ad

    .line 606
    const-string v3, "430. aloud adv.\u51fa\u58f0\u5730\uff0c\u5927\u58f0\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1ae

    .line 607
    const-string v3, "431. cloud n.\u4e91(\u72b6\u7269);\u906e\u6697\u7269,\u9634\u5f71;\u4e00\u5927\u7fa4"

    aput-object v3, v0, v2

    const/16 v2, 0x1af

    .line 608
    const-string v3, "432. proud a.(of)\u81ea\u8c6a\u7684;\u5f15\u4ee5\u81ea\u8c6a\u7684;\u5984\u81ea\u5c0a\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1b0

    .line 609
    const-string v3, "433. shrewd a.\u673a\u7075\u7684,\u654f\u9510\u7684;\u7cbe\u660e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1b1

    .line 610
    const-string v3, "434. crowd n.\u4eba\u7fa4;\u4e00\u7fa4,\u4e00\u4f19 v.\u805a\u96c6,\u7fa4\u96c6;\u6324\u6ee1,\u62e5\u6324"

    aput-object v3, v0, v2

    const/16 v2, 0x1b2

    .line 611
    const-string v3, "435. be v.(\u5c31)\u662f\uff0c\u7b49\u4e8e\uff1b(\u5b58)\u5728\uff1b\u5230\u8fbe\uff0c\u6765\u5230\uff0c\u53d1\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x1b3

    .line 612
    const-string v3, "436. bribe n.\u8d3f\u8d42 v.\u5411\u2026\u884c\u8d3f,\u4e70\u901a"

    aput-object v3, v0, v2

    const/16 v2, 0x1b4

    .line 613
    const-string v3, "437. subscribe vi.(to)\u8ba2\u9605\uff0c\u8ba2\u8d2d\uff1b\u540c\u610fvt.\u6350\u52a9\uff0c\u8d5e\u52a9"

    aput-object v3, v0, v2

    const/16 v2, 0x1b5

    .line 614
    const-string v3, "438. describe v.\u63cf\u8ff0,\u5f62\u5bb9"

    aput-object v3, v0, v2

    const/16 v2, 0x1b6

    .line 615
    const-string v3, "439. prescribe v.\u6307\u793a,\u89c4\u5b9a;\u5904(\u65b9),\u5f00(\u836f)"

    aput-object v3, v0, v2

    const/16 v2, 0x1b7

    .line 616
    const-string v3, "440. tribe n.\u79cd\u65cf\uff0c\u90e8\u843d\uff1b(\u690d\u7269\uff0c\u52a8\u7269)\u65cf\uff0c\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x1b8

    .line 617
    const-string v3, "441. globe n.\u7403\u4f53,\u5730\u7403\u4eea;\u5730\u7403,\u4e16\u754c"

    aput-object v3, v0, v2

    const/16 v2, 0x1b9

    .line 618
    const-string v3, "442. robe n.\u957f\u888d,\u4e0a\u8863"

    aput-object v3, v0, v2

    const/16 v2, 0x1ba

    .line 619
    const-string v3, "443. wardrobe n.\u8863\u67dc,\u8863\u53a8;\u8863\u670d;\u884c\u5934;\u5267\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x1bb

    .line 620
    const-string v3, "444. probe n.\u63a2\u9488,\u63a2\u6d4b\u5668 v.(\u4ee5\u63a2\u9488\u7b49)\u63a2\u67e5,\u7a7f\u523a,\u67e5\u7a76"

    aput-object v3, v0, v2

    const/16 v2, 0x1bc

    .line 621
    const-string v3, "445. cube n.\u7acb\u65b9\u5f62,\u7acb\u65b9\u4f53;\u7acb\u65b9,\u4e09\u6b21\u5e42"

    aput-object v3, v0, v2

    const/16 v2, 0x1bd

    .line 622
    const-string v3, "446. tube n.\u7ba1,\u8f6f\u7ba1;\u7535\u5b50\u7ba1,\u663e\u50cf\u7ba1;\u5730\u94c1"

    aput-object v3, v0, v2

    const/16 v2, 0x1be

    .line 623
    const-string v3, "447. maybe adv.\u53ef\u80fd\uff1b\u5927\u6982\uff1b\u4e5f\u8bb8"

    aput-object v3, v0, v2

    const/16 v2, 0x1bf

    .line 624
    const-string v3, "448. peace n.\u548c\u5e73;\u5e73\u9759,\u5b89\u5b81"

    aput-object v3, v0, v2

    const/16 v2, 0x1c0

    .line 625
    const-string v3, "449. face n.\u8138,\u9762\u8c8c;\u8868\u60c5;\u6b63\u9762 v.\u9762\u5bf9\u7740;\u671d,\u9762\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x1c1

    .line 626
    const-string v3, "450. preface n.\u5e8f\u8a00,\u5f15\u8a00,\u524d\u8a00 v.\u4f5c\u5e8f,\u5199\u524d\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x1c2

    .line 627
    const-string v3, "451. interface n.\u63a5\u5408\u90e8\u4f4d\uff0c\u5206\u754c\u9762 v.(\u4f7f)\u4e92\u76f8\u8054\u7cfb"

    aput-object v3, v0, v2

    const/16 v2, 0x1c3

    .line 628
    const-string v3, "452. surface n.\u8868\u9762\uff1b\u5916\u8868 a.\u8868\u9762\u7684\uff0c\u80a4\u6d45\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1c4

    .line 629
    const-string v3, "453. lace n.\u82b1\u8fb9;\u5e26\u5b50,\u978b\u5e26 v.\u7cfb\u5e26,\u624e\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x1c5

    .line 630
    const-string v3, "454. palace n.\u5bab,\u5bab\u6bbf"

    aput-object v3, v0, v2

    const/16 v2, 0x1c6

    .line 631
    const-string v3, "455. necklace n.\u9879\u94fe\uff0c\u9879\u5708"

    aput-object v3, v0, v2

    const/16 v2, 0x1c7

    .line 632
    const-string v3, "456. place n.\u5730\u65b9;\u540d\u6b21;\u5730\u4f4d;\u5bd3\u6240 v.\u5b89\u6392;\u653e\u7f6e;\u6295(\u8d44)"

    aput-object v3, v0, v2

    const/16 v2, 0x1c8

    .line 633
    const-string v3, "457. replace vt.\u53d6\u4ee3,\u66ff\u6362,\u4ee3\u66ff,\u628a...\u653e\u56de\u539f\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x1c9

    .line 634
    const-string v3, "458. fireplace n.\u58c1\u7089"

    aput-object v3, v0, v2

    const/16 v2, 0x1ca

    .line 635
    const-string v3, "459. commonplace a.\u666e\u901a\u7684\uff0c\u5e73\u5eb8\u7684n.\u5bfb\u5e38\u7684\u4e8b\u7269\uff0c\u5e73\u5eb8\u7684\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x1cb

    .line 636
    const-string v3, "460. displace v.\u79fb\u7f6e,\u8f6c\u79fb;\u53d6\u4ee3,\u7f6e\u6362"

    aput-object v3, v0, v2

    const/16 v2, 0x1cc

    .line 637
    const-string v3, "461. menace vt./n.\u6709\u5371\u9669\u6027\u7684\u4eba(\u6216\u7269)\uff1b\u5a01\u80c1\uff0c\u5a01\u5413"

    aput-object v3, v0, v2

    const/16 v2, 0x1cd

    .line 638
    const-string v3, "462. furnace n.\u7089\u5b50,\u7194\u7089"

    aput-object v3, v0, v2

    const/16 v2, 0x1ce

    .line 639
    const-string v3, "463. pace n.\u6b65,\u6b65\u4f10,\u6b65\u8c03,\u901f\u5ea6 v.\u8e31\u6b65,\u7528\u6b65\u6d4b"

    aput-object v3, v0, v2

    const/16 v2, 0x1cf

    .line 640
    const-string v3, "464. space n.\u95f4\u9694;\u7a7a\u5730,\u4f59\u5730;\u7a7a\u95f4 v.\u7559\u95f4\u9694,\u9694\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x1d0

    .line 641
    const-string v3, "465. cyberspace n.\u865a\u62df\u4fe1\u606f\u7a7a\u95f4;\u7f51\u7edc\u7a7a\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1d1

    .line 642
    const-string v3, "466. race n.\u8d5b\u8dd1;\u4eba\u79cd,\u79cd\u65cf;\u5c5e,\u79cd v.\u8d5b\u8dd1"

    aput-object v3, v0, v2

    const/16 v2, 0x1d2

    .line 643
    const-string v3, "467. brace v.\u4f7f\u9632\u5907;\u652f\u6491;\u4f7f(\u624b,\u8db3,\u80a9\u7b49)\u7ef7\u7d27 n.\u6258\u67b6"

    aput-object v3, v0, v2

    const/16 v2, 0x1d3

    .line 644
    const-string v3, "468. embrace v.\u62e5\u62b1;\u5305\u542b;\u5305\u56f4;\u73af\u7ed5;\u91c7\u7528;\u63a5\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0x1d4

    .line 645
    const-string v3, "469. grace n.\u4f18\u7f8e,\u6587\u96c5;\u6069\u60e0,\u6069\u6cfd;\u5bbd\u9650,\u7f13\u5211;\u611f\u6069\u7977\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0x1d5

    .line 646
    const-string v3, "470. disgrace n.\u5931\u5ba0,\u803b\u8fb1 v.\u4f7f\u5931\u5ba0;\u73b7\u8fb1,\u4f7f\u8499\u7f9e"

    aput-object v3, v0, v2

    const/16 v2, 0x1d6

    .line 647
    const-string v3, "471. trace n.\u75d5\u8ff9,\u8e2a\u8ff9;\u6781\u5c11\u91cf v.\u63cf\u7ed8;\u8ddf\u8e2a,\u8ffd\u8e2a"

    aput-object v3, v0, v2

    const/16 v2, 0x1d7

    .line 648
    const-string v3, "472. niece n.\u4f84\u5973,\u7525\u5973"

    aput-object v3, v0, v2

    const/16 v2, 0x1d8

    .line 649
    const-string v3, "473. piece n.(\u4e00)\u4ef6/\u7247/\u7bc7;\u788e\u7247v.(together)\u62fc\u5408,\u62fc\u51d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1d9

    .line 650
    const-string v3, "474. masterpiece n.\u6770\u4f5c,\u540d\u8457"

    aput-object v3, v0, v2

    const/16 v2, 0x1da

    .line 651
    const-string v3, "475. ice n.\u51b0\uff1b\u51b0\u51bb\u751c\u98df vt.\u51b0\u51bb\uff0c\u4f7f\u6210\u51b0"

    aput-object v3, v0, v2

    const/16 v2, 0x1db

    .line 652
    const-string v3, "476. prejudice n.\u504f\u89c1,\u6210\u89c1;\u635f\u5bb3,\u4fb5\u5bb3 v.\u4f7f\u62b1\u504f\u89c1,\u635f\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0x1dc

    .line 653
    const-string v3, "477. office n.\u529e\u516c\u5ba4,\u529e\u4e8b\u5904;\u804c\u52a1,\u516c\u804c;\u90e8,\u5c40,\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x1dd

    .line 654
    const-string v3, "478. suffice v.\u5145\u8db3\uff0c\u8db3\u591f\uff1bvt.(\u98df\u7269\u7b49)\u4f7f(\u67d0\u4eba)\u6ee1\u8db3"

    aput-object v3, v0, v2

    const/16 v2, 0x1de

    .line 655
    const-string v3, "479. sacrifice n.\u727a\u7272,\u727a\u7272\u54c1;\u796d\u54c1 v.(for,to)\u727a\u7272,\u732e\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x1df

    .line 656
    const-string v3, "480. police n.\u8b66\u5bdf,\u8b66\u5bdf\u673a\u5173 a.\u8b66\u5bdf\u7684 v.\u7ba1\u8f96"

    aput-object v3, v0, v2

    const/16 v2, 0x1e0

    .line 657
    const-string v3, "481. slice n.\u8584\u7247,\u5207\u7247;\u4e00\u4efd;\u90e8\u5206\u5207(\u7247)"

    aput-object v3, v0, v2

    const/16 v2, 0x1e1

    .line 658
    const-string v3, "482. nice a.\u7f8e\u597d\u7684\uff0c\u4ee4\u4eba\u6109\u5feb\u7684\uff1b\u53cb\u597d\u7684\uff0c\u4eb2\u5207\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1e2

    .line 659
    const-string v3, "483. choice n.\u9009\u62e9(\u673a\u4f1a),\u6289\u62e9,\u9009\u62e9\u9879;\u5165\u9009\u8005 a.\u7cbe\u9009\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1e3

    .line 660
    const-string v3, "484. rejoice v.(\u4f7f)\u6b23\u559c,(\u4f7f)\u9ad8\u5174"

    aput-object v3, v0, v2

    const/16 v2, 0x1e4

    .line 661
    const-string v3, "485. voice n.\u58f0\u97f3;\u55d3\u97f3;\u53d1\u97f3\u80fd\u529b;\u610f\u89c1,\u53d1\u8a00\u6743;\u8bed\u6001"

    aput-object v3, v0, v2

    const/16 v2, 0x1e5

    .line 662
    const-string v3, "486. rice n.\u7a3b,\u7c73"

    aput-object v3, v0, v2

    const/16 v2, 0x1e6

    .line 663
    const-string v3, "487. price n.\u4ef7\u683c,\u4ef7\u94b1;\u4ee3\u4ef7 v.\u6807\u4ef7"

    aput-object v3, v0, v2

    const/16 v2, 0x1e7

    .line 664
    const-string v3, "488. practice n.\u7ec3\u4e60,\u5b9e\u8df5,\u5b9e\u9645,\u4e1a\u52a1,\u60ef\u4f8b,\u4e60\u60ef"

    aput-object v3, v0, v2

    const/16 v2, 0x1e8

    .line 665
    const-string v3, "489. notice n.\u901a\u77e5,\u901a\u544a,\u5e03\u544a;\u6ce8\u610f,\u8ba4\u8bc6 v.\u6ce8\u610f\u5230,\u6ce8\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x1e9

    .line 666
    const-string v3, "490. justice n.\u516c\u6b63,\u516c\u5e73;\u5ba1\u5224,\u53f8\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x1ea

    .line 667
    const-string v3, "491. juice n.(\u6c34\u679c\u7b49)\u6c41,\u6db2"

    aput-object v3, v0, v2

    const/16 v2, 0x1eb

    .line 668
    const-string v3, "492. vice n.\u90aa\u6076;\u6076\u4e60;(pl.)\u53f0\u94b3,\u8001\u864e\u94b3"

    aput-object v3, v0, v2

    const/16 v2, 0x1ec

    .line 669
    const-string v3, "493. advice n.\u529d\u544a\uff0c\u5fe0\u544a\uff0c(\u533b\u751f\u7b49\u7684)\u610f\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x1ed

    .line 670
    const-string v3, "494. device n.\u88c5\u7f6e,\u8bbe\u5907,\u4eea\u8868;\u65b9\u6cd5,\u8bbe\u8ba1"

    aput-object v3, v0, v2

    const/16 v2, 0x1ee

    .line 671
    const-string v3, "495. service n.\u670d\u52a1;\u516c\u5171\u8bbe\u65bd;\u7ef4\u4fee\u4fdd\u517b;\u884c\u653f\u90e8\u95e8v.\u7ef4\u4fee"

    aput-object v3, v0, v2

    const/16 v2, 0x1ef

    .line 672
    const-string v3, "496. twice ad.\u4e24\u6b21,\u4e24\u500d"

    aput-object v3, v0, v2

    const/16 v2, 0x1f0

    .line 673
    const-string v3, "497. disturbance n.\u52a8\u4e71,\u9a9a\u4e71,\u5e72\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x1f1

    .line 674
    const-string v3, "498. significance n.\u610f\u4e49,\u542b\u4e49;\u91cd\u8981\u6027,\u91cd\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1f2

    .line 675
    const-string v3, "499. dance n.\u821e(\u8e48)\uff1b\u821e\u66f2\uff0c\u821e\u4f1a v.\u8df3\u821e;\u8df3\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x1f3

    .line 676
    const-string v3, "500. guidance n.\u5f15\u5bfc,\u6307\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0x1f4

    .line 677
    const-string v3, "501. attendance n.\u51fa\u5e2d\uff1b\u51fa\u5e2d\u4eba\u6570\uff1b\u62a4\u7406\uff0c\u7167\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x1f5

    .line 678
    const-string v3, "502. abundance n.\u4e30\u5bcc\uff0c\u5145\u88d5\uff0c\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1f6

    .line 679
    const-string v3, "503. "

    aput-object v3, v0, v2

    const/16 v2, 0x1f7

    .line 680
    const-string v3, "504. "

    aput-object v3, v0, v2

    const/16 v2, 0x1f8

    .line 681
    const-string v3, "505. accordance n.\u4e00\u81f4\uff0c\u548c\u8c10\uff0c\u7b26\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x1f9

    .line 682
    const-string v3, "506. chance n.\u673a\u4f1a;\u53ef\u80fd\u6027;\u5076\u7136\u6027,\u8fd0\u6c14v.\u78b0\u5de7,\u5076\u7136\u53d1\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x1fa

    .line 683
    const-string v3, "507. enhance v.\u63d0\u9ad8,\u589e\u5f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x1fb

    .line 684
    const-string v3, "508. reliance n.\u4fe1\u4efb,\u4fe1\u5fc3,\u4f9d\u9760,\u4f9d\u9760\u7684\u4eba\u6216\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1fc

    .line 685
    const-string v3, "509. alliance n.\u540c\u76df\uff0c\u540c\u76df\u56fd\uff1b\u7ed3\u76df\uff0c\u8054\u59fb"

    aput-object v3, v0, v2

    const/16 v2, 0x1fd

    .line 686
    const-string v3, "510. appliance n.\u7535\u5668\uff1b\u5668\u68b0\uff0c\u88c5\u7f6e\uff1b\u5e94\u7528\uff0c\u9002\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x1fe

    .line 687
    const-string v3, "511. balance v.\u79f0,(\u4f7f)\u5e73\u8861 n.\u5929\u5e73;\u5e73\u8861,\u5747\u8861;\u5dee\u989d,\u4f59\u6b3e"

    aput-object v3, v0, v2

    const/16 v2, 0x1ff

    .line 688
    const-string v3, "512. resemblance n.\u76f8\u4f3c,\u76f8\u4f3c\u6027[\u70b9,\u7269]"

    aput-object v3, v0, v2

    const/16 v2, 0x200

    .line 689
    const-string v3, "513. glance v.(at,over)\u626b\u89c6 n.\u5306\u5306\u770b,\u4e00\u77a5,\u4e00\u773c"

    aput-object v3, v0, v2

    const/16 v2, 0x201

    .line 690
    const-string v3, "514. ambulance n.\u6551\u62a4\u8f66\uff0c\u6551\u62a4\u8239\uff0c\u6551\u62a4\u98de\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x202

    .line 691
    const-string v3, "515. romance n.\u4f20\u5947,\u7231\u60c5\u6545\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x203

    .line 692
    const-string v3, "516. performance n.\u5c65\u884c,\u6267\u884c;\u8868\u6f14,\u6f14\u51fa;\u6027\u80fd,\u7279\u6027;\u6210\u7ee9"

    aput-object v3, v0, v2

    const/16 v2, 0x204

    .line 693
    const-string v3, "517. maintenance n.\u7ef4\u4fee,\u4fdd\u517b,\u7ef4\u6301,\u4fdd\u6301,\u751f\u6d3b\u8d39\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x205

    .line 694
    const-string v3, "518. finance n.\u8d22\u653f,\u91d1\u878d v.\u4e3a\u2026\u63d0\u4f9b\u8d44\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x206

    .line 695
    const-string v3, "519. appearance n.\u51fa\u73b0\uff0c\u9732\u9762\uff1b\u5916\u8868\uff1b(\u5728\u4f1a\u8bae\u7b49)\u4f5c\u77ed\u6682\u9732\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x207

    .line 696
    const-string v3, "520. tolerance n.\u5bbd\u5bb9\uff1b\u5bb9\u5fcd,\u5fcd\u53d7\uff1b\u8010\u836f\u529b\uff1b\u516c\u5dee"

    aput-object v3, v0, v2

    const/16 v2, 0x208

    .line 697
    const-string v3, "521. ignorance n.\u65e0\u77e5,\u611a\u6627;\u4e0d\u77e5\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x209

    .line 698
    const-string v3, "522. entrance n.\u5165\u53e3,\u95e8\u53e3;\u8fdb\u5165;\u5165\u5b66,\u5165\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x20a

    .line 699
    const-string v3, "523. endurance n.\u5fcd\u8010(\u529b),\u6301\u4e45(\u529b),\u8010\u4e45(\u6027)"

    aput-object v3, v0, v2

    const/16 v2, 0x20b

    .line 700
    const-string v3, "524. insurance n.\u4fdd\u9669,\u4fdd\u9669\u8d39,\u4fdd\u9669\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0x20c

    .line 701
    const-string v3, "525. assurance n.\u4fdd\u8bc1,\u62c5\u4fdd\uff1b\u786e\u4fe1,\u65ad\u8a00\uff1b\u4fe1\u5fc3,\u4fe1\u5ff5"

    aput-object v3, v0, v2

    const/16 v2, 0x20d

    .line 702
    const-string v3, "526. nuisance n.\u8ba8\u538c\u7684\u4eba(\u6216\u4e1c\u897f);\u9ebb\u70e6\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x20e

    .line 703
    const-string v3, "527. renaissance n.[the R-]\u6587\u827a\u590d\u5174(\u65f6\u671f)\uff1b\u65b0\u751f\uff0c\u590d\u5174"

    aput-object v3, v0, v2

    const/16 v2, 0x20f

    .line 704
    const-string v3, "528. acquaintance n.\u8ba4\u8bc6\uff0c\u76f8\u8bc6\uff0c\u4e86\u89e3\uff1b\u76f8\u8bc6\u7684\u4eba\uff0c\u719f\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x210

    .line 705
    const-string v3, "529. acceptance n.\u63a5\u53d7\uff0c\u63a5\u6536\uff0c\u9a8c\u6536\uff0c\u63a5\u7eb3\uff1b\u627f\u8ba4\uff0c\u8ba4\u53ef"

    aput-object v3, v0, v2

    const/16 v2, 0x211

    .line 706
    const-string v3, "530. importance n.\u91cd\u8981,\u91cd\u8981\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x212

    .line 707
    const-string v3, "531. substance n.\u7269\u8d28\uff1b\u5b9e\u8d28\uff0c\u672c\u8d28\uff1b\u4e3b\u65e8\uff1b\u8d22\u4ea7\uff0c\u8d44\u4ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x213

    .line 708
    const-string v3, "532. distance n.\u8ddd\u79bb,\u95f4\u9694,\u8fdc\u65b9,\u8def\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0x214

    .line 709
    const-string v3, "533. resistance n.(to)\u62b5\u6297,\u53cd\u6297;\u62b5\u6297\u529b,\u963b\u529b;\u7535\u963b"

    aput-object v3, v0, v2

    const/16 v2, 0x215

    .line 710
    const-string v3, "534. assistance n.\u534f\u4f5c; \u63f4\u52a9; \u5e2e\u52a9"

    aput-object v3, v0, v2

    const/16 v2, 0x216

    .line 711
    const-string v3, "535. instance n.\u4f8b\u5b50,\u4e8b\u4f8b,\u4f8b\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x217

    .line 712
    const-string v3, "536. advance n.\u524d\u8fdb\uff0c\u9884\u4ed8 vi.\u524d\u8fdb\uff0c\u8fdb\u5c55 vt.\u4fc3\u8fdb\uff0c\u63a8\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x218

    .line 713
    const-string v3, "537. allowance n.\u8865\u8d34\uff0c\u6d25\u8d34\uff1b\u96f6\u7528\u94b1\uff1b\u51cf\u4ef7\uff0c\u6298\u6263\uff1b\u5141\u8bb8"

    aput-object v3, v0, v2

    const/16 v2, 0x219

    .line 714
    const-string v3, "538. incidence n.\u5f71\u54cd\u7a0b\u5ea6\uff0c\u5f71\u54cd\u8303\u56f4\uff1b\u53d1\u751f\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x21a

    .line 715
    const-string v3, "539. coincidence n.\u5de7\u5408\uff1b\u540c\u65f6\u53d1\u751f\uff0c\u5171\u540c\u5b58\u5728\uff1b\u7b26\u5408\uff0c\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x21b

    .line 716
    const-string v3, "540. confidence n.(in)\u4fe1\u4efb;\u4fe1\u5fc3,\u81ea\u4fe1;\u79d8\u5bc6,\u673a\u5bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x21c

    .line 717
    const-string v3, "541. residence n.\u4f4f\u5904,\u4f4f\u5b85"

    aput-object v3, v0, v2

    const/16 v2, 0x21d

    .line 718
    const-string v3, "542. evidence n.\u660e\u663e;\u663e\u8457;\u6839\u636e;\u8bc1\u636e;\u8ff9\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x21e

    .line 719
    const-string v3, "543. independence n.\u72ec\u7acb,\u81ea\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0x21f

    .line 720
    const-string v3, "544. correspondence n.\u901a\u4fe1,\u4fe1\u4ef6;(with)\u7b26\u5408;(to)\u76f8\u5f53\u4e8e,\u5bf9\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x220

    .line 721
    const-string v3, "545. fence n.\u7bf1\u7b06;\u56f4\u680f;\u5251\u672f v.\u7528\u7bf1\u7b06\u74e6\u56f4\u4f4f;\u51fb\u5251"

    aput-object v3, v0, v2

    const/16 v2, 0x221

    .line 722
    const-string v3, "546. defence n.(defense)\u9632\u5fa1,\u4fdd\u536b;\u9632\u52a1\u5de5\u4e8b;\u8fa9\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x222

    .line 723
    const-string v3, "547. intelligence n.\u667a\u529b,\u806a\u660e;\u7406\u89e3\u529b;\u60c5\u62a5,\u6d88\u606f,\u62a5\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0x223

    .line 724
    const-string v3, "548. hence ad.\u4ece\u6b64,\u4eca\u540e;\u56e0\u6b64"

    aput-object v3, v0, v2

    const/16 v2, 0x224

    .line 725
    const-string v3, "549. science n.\u79d1\u5b66;\u5b66\u79d1"

    aput-object v3, v0, v2

    const/16 v2, 0x225

    .line 726
    const-string v3, "550. conscience n.\u826f\u5fc3,\u826f\u77e5"

    aput-object v3, v0, v2

    const/16 v2, 0x226

    .line 727
    const-string v3, "551. obedience n.\u670d\u4ece,\u987a\u4ece"

    aput-object v3, v0, v2

    const/16 v2, 0x227

    .line 728
    const-string v3, "552. audience n.\u542c\u4f17\uff0c\u89c2\u4f17\uff0c\u8bfb\u8005\uff1b\u89c1\u9762\uff0c\u4f1a\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x228

    .line 729
    const-string v3, "553. convenience n.\u4fbf\u5229,\u65b9\u4fbf;(pl.)\u4fbf\u5229\u8bbe\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x229

    .line 730
    const-string v3, "554. experience n./vt.\u7ecf\u9a8c;\u7ecf\u5386;\u4f53\u9a8c;\u9605\u5386"

    aput-object v3, v0, v2

    const/16 v2, 0x22a

    .line 731
    const-string v3, "555. patience n.\u8010\u5fc3,\u5fcd\u8010"

    aput-object v3, v0, v2

    const/16 v2, 0x22b

    .line 732
    const-string v3, "556. silence n.\u5bc2\u9759,\u6c89\u9ed8 v.\u4f7f\u6c89\u9ed8,\u4f7f\u5b89\u9759"

    aput-object v3, v0, v2

    const/16 v2, 0x22c

    .line 733
    const-string v3, "557. violence n.\u731b\u70c8,\u5f3a\u70c8;\u66b4\u529b,\u66b4\u884c;\u5f3a\u66b4"

    aput-object v3, v0, v2

    const/16 v2, 0x22d

    .line 734
    const-string v3, "558. commence vt.\u5f00\u59cb vi.\u83b7\u5f97\u5b66\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x22e

    .line 735
    const-string v3, "559. reference n.\u63d0\u53ca,\u6d89\u53ca;\u53c2\u8003,\u53c2\u8003\u4e66\u76ee;\u8bc1\u660e\u4e66\uff08\u4eba\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x22f

    .line 736
    const-string v3, "560. preference n.(for,to)\u504f\u7231,\u559c\u7231;\u4f18\u60e0;\u4f18\u5148\u9009\u62e9"

    aput-object v3, v0, v2

    const/16 v2, 0x230

    .line 737
    const-string v3, "561. difference n.\u5dee\u522b,\u5dee\u5f02,\u5206\u6b67"

    aput-object v3, v0, v2

    const/16 v2, 0x231

    .line 738
    const-string v3, "562. circumference n.\u5706\u5468,\u5468\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x232

    .line 739
    const-string v3, "563. inference n.\u63a8\u8bba,\u63a8\u7406,\u63a8\u65ad;\u7ed3\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x233

    .line 740
    const-string v3, "564. conference n.(\u6b63\u5f0f)\u4f1a\u8bae\uff1b\u8ba8\u8bba\uff0c\u5546\u8c08"

    aput-object v3, v0, v2

    const/16 v2, 0x234

    .line 741
    const-string v3, "565. interference n.(in)\u5e72\u6d89,\u5e72\u9884;(with)\u59a8\u788d,\u6253\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x235

    .line 742
    const-string v3, "566. occurrence n.\u53d1\u751f,\u51fa\u73b0;\u4e8b\u4ef6,\u4e8b\u6545,\u53d1\u751f\u7684\u4e8b\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x236

    .line 743
    const-string v3, "567. absence n.\u7f3a\u4e4f\uff0c\u4e0d\u5b58\u5728\uff1b\u7f3a\u5e2d\uff0c\u4e0d\u5728\uff1b\u7f3a\u5e2d\u7684\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x237

    .line 744
    const-string v3, "568. presence n.\u51fa\u5e2d,\u5230\u573a,\u5b58\u5728,\u5728"

    aput-object v3, v0, v2

    const/16 v2, 0x238

    .line 745
    const-string v3, "569. essence n.\u672c\u8d28,\u5b9e\u8d28"

    aput-object v3, v0, v2

    const/16 v2, 0x239

    .line 746
    const-string v3, "570. sentence n.\u53e5\u5b50;\u5224\u51b3,\u5ba3\u5224 v.\u5ba3\u5224,\u5224\u51b3"

    aput-object v3, v0, v2

    const/16 v2, 0x23a

    .line 747
    const-string v3, "571. existence n.\u5b58\u5728,\u5b9e\u5728;\u751f\u5b58,\u751f\u6d3b(\u65b9\u5f0f)"

    aput-object v3, v0, v2

    const/16 v2, 0x23b

    .line 748
    const-string v3, "572. influence n.(on)\u5f71\u54cd,\u611f\u5316;\u52bf\u529b,\u6743\u52bf v.\u5f71\u54cd,\u611f\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x23c

    .line 749
    const-string v3, "573. sequence n.\u5148\u540e,\u6b21\u5e8f;\u8fde\u7eed,\u6570\u5217"

    aput-object v3, v0, v2

    const/16 v2, 0x23d

    .line 750
    const-string v3, "574. consequence n.\u7ed3\u679c,\u540e\u679c,\u5f71\u54cd;\u91cd\u8981\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x23e

    .line 751
    const-string v3, "575. prince n.\u738b\u5b50,\u4eb2\u738b"

    aput-object v3, v0, v2

    const/16 v2, 0x23f

    .line 752
    const-string v3, "576. since prep.\u81ea\u4ece conj.\u81ea\u4ece\uff1b\u56e0\u4e3a\uff0c\u65e2\u7136  ad.\u540e\u6765"

    aput-object v3, v0, v2

    const/16 v2, 0x240

    .line 753
    const-string v3, "577. convince v.(of)\u4f7f\u4fe1\u670d,\u4f7f\u786e\u4fe1"

    aput-object v3, v0, v2

    const/16 v2, 0x241

    .line 754
    const-string v3, "578. province n.\u7701;\u9886\u57df,\u8303\u56f4,\u672c\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x242

    .line 755
    const-string v3, "579. once ad.\u4e00\u6b21\uff0c\u66fe\u7ecf conj.\u4e00(\u65e6)\u2026\u5c31\u2026 n.\u4e00\u6b21"

    aput-object v3, v0, v2

    const/16 v2, 0x243

    .line 756
    const-string v3, "580. ounce n.\u76ce\u53f8,\u82f1\u4e24"

    aput-object v3, v0, v2

    const/16 v2, 0x244

    .line 757
    const-string v3, "581. bounce n./vi.(\u7403)\u5f39\u8d77,\u5f39\u56de\uff1b\u5f39\u8d77,\u8df3\u8d77\uff1bn.\u5f39\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x245

    .line 758
    const-string v3, "582. denounce vt.\u516c\u5f00\u6307\u8d23,\u516c\u7136\u62a8\u51fb;\u8c34\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0x246

    .line 759
    const-string v3, "583. announce v.\u6b63\u5f0f\u5ba3\u5e03\uff1b\u53d1\u8868\uff1b\u901a\u544a\uff1b\u5e7f\u64ad\uff08\u7535\u53f0\u8282\u76ee\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x247

    .line 760
    const-string v3, "584. pronounce v.\u53d1\u2026\u7684\u97f3;\u5ba3\u5e03,\u5ba3\u5224"

    aput-object v3, v0, v2

    const/16 v2, 0x248

    .line 761
    const-string v3, "585. scarce a.\u7f3a\u4e4f\u7684,\u4e0d\u8db3\u7684;\u7a00\u5c11\u7684,\u7f55\u89c1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x249

    .line 762
    const-string v3, "586. fierce a.\u51f6\u731b\u7684,\u6b8b\u5fcd\u7684;\u72c2\u70ed\u7684,\u5f3a\u70c8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x24a

    .line 763
    const-string v3, "587. pierce v.\u524c\u7a7f,\u523a\u7834"

    aput-object v3, v0, v2

    const/16 v2, 0x24b

    .line 764
    const-string v3, "588. commerce n.\u5546\u4e1a\uff0c\u8d38\u6613\uff1b\u4ea4\u9645\uff0c\u4ea4\u5f80"

    aput-object v3, v0, v2

    const/16 v2, 0x24c

    .line 765
    const-string v3, "589. force n.\u529b\u91cf,\u529b;\u52bf\u529b;(pl.)(\u603b\u79f0)\u519b\u961f v.\u5f3a\u8feb"

    aput-object v3, v0, v2

    const/16 v2, 0x24d

    .line 766
    const-string v3, "590. enforce v.\u5b9e\u65bd,\u6267\u884c;\u5f3a\u5236;\u652f\u6301,\u575a\u6301(\u8981\u6c42,\u4e3b\u5f20\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x24e

    .line 767
    const-string v3, "591. reinforce v.\u589e\u63f4,\u52a0\u5f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x24f

    .line 768
    const-string v3, "592. divorce v./n.\u79bb\u5a5a,\u5206\u79bb"

    aput-object v3, v0, v2

    const/16 v2, 0x250

    .line 769
    const-string v3, "593. source n.\u6e90,\u6e90\u6cc9;\u6765\u6e90,\u51fa\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x251

    .line 770
    const-string v3, "594. resource n.(pl.)\u8d44\u6e90,\u8d22\u529b;\u529e\u6cd5,\u667a\u8c0b;\u5e94\u53d8\u4e4b\u624d"

    aput-object v3, v0, v2

    const/16 v2, 0x252

    .line 771
    const-string v3, "595. sauce n.\u9171\u6c41,\u8c03\u5473\u6c41"

    aput-object v3, v0, v2

    const/16 v2, 0x253

    .line 772
    const-string v3, "596. deduce vt.(from)\u6f14\u7ece,\u63a8\u65ad,\u63a8\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x254

    .line 773
    const-string v3, "597. reduce v.\u51cf\u5c11,\u7f29\u5c0f;\u7b80\u5316,\u8fd8\u539f"

    aput-object v3, v0, v2

    const/16 v2, 0x255

    .line 774
    const-string v3, "598. induce v.\u5f15\u8bf1,\u529d\u4f7f;\u5f15\u8d77,\u5bfc\u81f4;\u611f\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x256

    .line 775
    const-string v3, "599. produce v.\u751f\u4ea7,\u5236\u9020,\u663e\u793a,\u6f14\u51fa,\u5bfc\u81f4 n.\u4ea7\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x257

    .line 776
    const-string v3, "600. reproduce v.\u751f\u6b96;\u7ffb\u7248;\u7e41\u6b96;\u590d\u5236,\u4eff\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x258

    .line 777
    const-string v3, "601. introduce vt.\u4ecb\u7ecd\uff1b\u5f15\u8fdb\uff0c\u4f20\u5165\uff1b\u63d0\u51fa(\u8bae\u6848\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x259

    .line 778
    const-string v3, "602. decade n.\u5341\u5e74"

    aput-object v3, v0, v2

    const/16 v2, 0x25a

    .line 779
    const-string v3, "603. fade v.\u892a\u8272;\u8870\u51cf,\u6d88\u5931n.\u6de1\u5165(\u51fa)n.\u4e4f\u5473(\u5e73\u6de1)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x25b

    .line 780
    const-string v3, "604. shade n.\u836b,\u9634\u5f71;\u906e\u5149\u7269,\u7f69 v.\u906e\u853d,\u906e\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x25c

    .line 781
    const-string v3, "605. blade n.\u5200\u5203\uff0c\u5200\u7247\uff1b\u6868\u53f6\uff1b\u8349\u53f6\uff0c\u53f6\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x25d

    .line 782
    const-string v3, "606. spade n.\u94c1\u9539,\u94f2\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x25e

    .line 783
    const-string v3, "607. parade n./v.\u6e38\u884c,\u5938\u8000n.\u68c0\u9605,\u9605\u5175\u5f0fv.\u4f7f\u5217\u961f\u884c\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x25f

    .line 784
    const-string v3, "608. grade n.\u7b49\u7ea7,\u7ea7\u522b;\u5e74\u7ea7;\u5206\u6570 v.\u5206\u7b49,\u5206\u7ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x260

    .line 785
    const-string v3, "609. centigrade n./a.\u6444\u6c0f\u6e29\u5ea6\u8ba1(\u7684);\u767e\u5206\u5ea6(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x261

    .line 786
    const-string v3, "610. upgrade v.\u63d0\u5347,\u4f7f\u5347\u7ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x262

    .line 787
    const-string v3, "611. comrade n.\u540c\u5fd7,\u540c\u4e8b,\u540c\u4f34,\u670b\u53cb"

    aput-object v3, v0, v2

    const/16 v2, 0x263

    .line 788
    const-string v3, "612. trade n.\u8d38\u6613,\u5546\u4e1a;\u804c\u4e1a,\u884c\u4e1a v.\u7ecf\u5546,\u4ea4\u6613"

    aput-object v3, v0, v2

    const/16 v2, 0x264

    .line 789
    const-string v3, "613. persuade v.\u8bf4\u670d,\u529d\u8bf4;(of)\u4f7f\u76f8\u4fe1"

    aput-object v3, v0, v2

    const/16 v2, 0x265

    .line 790
    const-string v3, "614. evade vt.\u9003\u907f\uff0c\u56de\u907f\uff1b\u907f\u5f00\uff0c\u8eb2\u907f"

    aput-object v3, v0, v2

    const/16 v2, 0x266

    .line 791
    const-string v3, "615. invade vt.\u5165\u4fb5,\u4fb5\u7565,\u4fb5\u88ad,\u4fb5\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x267

    .line 792
    const-string v3, "616. recede v.\u9000\u56de,\u540e\u9000;\u6536\u56de,\u64a4\u56de;\u8dcc\u843d,\u7f29\u51cf,\u8d2c\u503c"

    aput-object v3, v0, v2

    const/16 v2, 0x268

    .line 793
    const-string v3, "617. precede v.\u9886\u5148(\u4e8e),\u5728(\u2026\u4e4b\u524d);\u4f18\u5148,\u5148\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x269

    .line 794
    const-string v3, "618. concede vt.\u627f\u8ba4\uff1b\u5bb9\u8bb8\uff1b(\u6bd4\u8d5b\u7ed3\u675f\u524d)\u8ba4\u8f93\uff1b\u9000\u8ba9"

    aput-object v3, v0, v2

    const/16 v2, 0x26a

    .line 795
    const-string v3, "619. abide vi.(abode\uff0cabided)(by)\u9075\u5b88\uff1b\u575a\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x26b

    .line 796
    const-string v3, "620. decide v.\u51b3\u5b9a,\u4e0b\u51b3\u5fc3;\u89e3\u51b3,\u88c1\u51b3"

    aput-object v3, v0, v2

    const/16 v2, 0x26c

    .line 797
    const-string v3, "621. suicide n.\u81ea\u6740\uff1b\u7ed9\u81ea\u5df1\u5e26\u6765\u6076\u52a3\u540e\u679c\u7684\u884c\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x26d

    .line 798
    const-string v3, "622. coincide vi.\u540c\u65f6\u53d1\u751f\uff1b\u5de7\u5408\uff1b\u4e00\u81f4\uff1b\u76f8\u7b26\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x26e

    .line 799
    const-string v3, "623. hide v.\u9690\u85cf,\u8eb2\u85cf;\u9690\u7792 n.\u76ae\u9769,\u517d\u76ae"

    aput-object v3, v0, v2

    const/16 v2, 0x26f

    .line 800
    const-string v3, "624. glide n./v.\u6e9c,\u6ed1\u884c;(\u65f6\u95f4)\u6d88\u901d"

    aput-object v3, v0, v2

    const/16 v2, 0x270

    .line 801
    const-string v3, "625. collide vi.[with]\u4e92\u649e\uff0c\u78b0\u649e\uff1b\u51b2\u7a81\uff0c\u62b5\u89e6"

    aput-object v3, v0, v2

    const/16 v2, 0x271

    .line 802
    const-string v3, "626. slide v.(\u4f7f)\u6ed1\u52a8 n.\u6ed1\u5761,\u6ed1\u9053;\u6ed1,\u6ed1\u52a8;\u5e7b\u706f\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x272

    .line 803
    const-string v3, "627. ride v./n.\u9a91,\u4e58"

    aput-object v3, v0, v2

    const/16 v2, 0x273

    .line 804
    const-string v3, "628. bride n.\u65b0\u5a18"

    aput-object v3, v0, v2

    const/16 v2, 0x274

    .line 805
    const-string v3, "629. pride n.\u81ea\u8c6a;\u81ea\u6ee1\uff1b\u5f15\u4ee5\u81ea\u8c6a\u7684\u4e1c\u897f v.\u4f7f\u81ea\u8c6a"

    aput-object v3, v0, v2

    const/16 v2, 0x275

    .line 806
    const-string v3, "630. stride vi.\u5927\u8e0f\u6b65\u8d70\uff1b\u8de8\u8d8a n.\u4e00\u5927\u6b65(pl.)\u957f\u8db3\u8fdb\u6b65"

    aput-object v3, v0, v2

    const/16 v2, 0x276

    .line 807
    const-string v3, "631. side n.\u65c1\u8fb9\uff0c\u4fa7\u9762\uff1b\u5761\uff0c\u5cb8\uff1b\u4e00\u8fb9/\u4fa7/\u65b9 vi.\u652f\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x277

    .line 808
    const-string v3, "632. aside ad.\u5728\u65c1\u8fb9\uff0c\u5230\u4e00\u8fb9 n.\u65c1\u767d\uff1b\u79bb\u9898\u7684\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x278

    .line 809
    const-string v3, "633. seaside n.\u6d77\u6ee8,\u6d77\u8fb9"

    aput-object v3, v0, v2

    const/16 v2, 0x279

    .line 810
    const-string v3, "634. beside prep.\u5728...\u65c1\u8fb9\uff0c\u5728...\u9644\u8fd1\uff1b\u548c...\u76f8\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0x27a

    .line 811
    const-string v3, "635. preside v.(at,over)\u4e3b\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x27b

    .line 812
    const-string v3, "636. alongside ad.\u5728\u65c1\u8fb9 prep.\u548c...\u5728\u4e00\u8d77\uff1b\u5728...\u65c1\u8fb9"

    aput-object v3, v0, v2

    const/16 v2, 0x27c

    .line 813
    const-string v3, "637. inside a.\u91cc\u9762\u7684 ad.\u5728\u91cc\u9762 n.\u5185\u90e8 prep.\u5728\u2026\u91cc"

    aput-object v3, v0, v2

    const/16 v2, 0x27d

    .line 814
    const-string v3, "638. outside ad.\u5411\u5916\u9762 n.\u5916\u90e8 a.\u5916\u90e8\u7684 prep.\u5728\u2026\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0x27e

    .line 815
    const-string v3, "639. countryside n.\u4e61\u4e0b,\u519c\u6751"

    aput-object v3, v0, v2

    const/16 v2, 0x27f

    .line 816
    const-string v3, "640. tide n.\u6f6e,\u6f6e\u6c50;\u6f6e\u6d41,\u8d8b\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0x280

    .line 817
    const-string v3, "641. guide n.\u9886\u8def\u4eba;\u6307\u5357,\u5bfc\u6e38 v.\u9886\u8def;\u6307\u5bfc;\u652f\u914d;\u7ba1\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x281

    .line 818
    const-string v3, "642. divide v.\u5206,\u5212\u5206,\u5206\u5f00;\u5206\u914d;(by)\u9664"

    aput-object v3, v0, v2

    const/16 v2, 0x282

    .line 819
    const-string v3, "643. provide v.\u4f9b\u5e94,\u4f9b\u7ed9,\u51c6\u5907,\u9884\u9632,\u89c4\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x283

    .line 820
    const-string v3, "644. wide a.\u5bbd\u9614\u7684;\u7741\u5927\u7684;\u8fdc\u79bb\u7684 ad.\u5e7f\u9614\u5730;\u504f\u5dee\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x284

    .line 821
    const-string v3, "645. worldwide a.\u5168\u4e16\u754c\u7684,\u4e16\u754c\u8303\u56f4\u7684 ad.\u904d\u53ca\u5168\u4e16\u754c"

    aput-object v3, v0, v2

    const/16 v2, 0x285

    .line 822
    const-string v3, "646. oxide n.[\u5316]\u6c27\u5316\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x286

    .line 823
    const-string v3, "647. code n.\u4ee3\u7801,\u4ee3\u53f7,\u5bc6\u7801;\u6cd5\u5178,\u6cd5\u89c4,\u89c4\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0x287

    .line 824
    const-string v3, "648. explode v.(\u4f7f)\u7206\u70b8,(\u4f7f)\u7206\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0x288

    .line 825
    const-string v3, "649. mode n.\u65b9\u5f0f,\u5f0f\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x289

    .line 826
    const-string v3, "650. corrode v.(\u53d7)\u8150\u8680,\u4fb5\u8680"

    aput-object v3, v0, v2

    const/16 v2, 0x28a

    .line 827
    const-string v3, "651. episode n.\u4e00\u6bb5\u60c5\u8282;\u7247\u65ad;(\u8fde\u7eed\u5267\u7684)\u4e00\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x28b

    .line 828
    const-string v3, "652. preclude v.\u6392\u9664,\u963b\u6b62,\u59a8\u788d"

    aput-object v3, v0, v2

    const/16 v2, 0x28c

    .line 829
    const-string v3, "653. include v.\u5305\u62ec,\u5305\u542b,\u8ba1\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x28d

    .line 830
    const-string v3, "654. conclude v.\u7ed3\u675f,\u7ec8\u6b62;\u65ad\u5b9a,\u4e0b\u7ed3\u8bba;\u7f14\u7ed3,\u8bae\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x28e

    .line 831
    const-string v3, "655. exclude v.\u62d2\u7edd,\u628a\u2026\u6392\u9664\u5728\u5916,\u6392\u65a5"

    aput-object v3, v0, v2

    const/16 v2, 0x28f

    .line 832
    const-string v3, "656. rude a.\u7c97\u9c81\u7684;\u731b\u70c8\u7684,\u6b8b\u66b4\u7684;\u7c97\u7cd9\u7684,\u7c97\u964b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x290

    .line 833
    const-string v3, "657. crude a.\u5929\u7136\u7684,\u672a\u52a0\u5de5\u7684;\u672a\u719f\u7684;\u7c97\u9c81\u7684,\u7c97\u91ce\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x291

    .line 834
    const-string v3, "658. intrude vi.\u95ef\u5165,\u4fb5\u5165vt.\u628a(\u601d\u60f3\u7b49)\u5f3a\u52a0\u4e8e\u4eba;\u5f3a\u6324\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x292

    .line 835
    const-string v3, "659. longitude n.\u7ecf\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x293

    .line 836
    const-string v3, "660. magnitude n.\u5927\u5c0f,\u6570\u91cf;\u5de8\u5927,\u5e7f\u5927"

    aput-object v3, v0, v2

    const/16 v2, 0x294

    .line 837
    const-string v3, "661. latitude n.\u7eac\u5ea6,\u884c\u52a8\u6216\u8a00\u8bba\u7684\u81ea\u7531(\u8303\u56f4),(pl.)\u5730\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x295

    .line 838
    const-string v3, "662. gratitude n.\u611f\u6fc0,\u611f\u8c22"

    aput-object v3, v0, v2

    const/16 v2, 0x296

    .line 839
    const-string v3, "663. altitude n.\u9ad8\u5ea6\uff0c\u6d77\u62d4\uff1b[pl.]\u9ad8\u5904\uff0c\u9ad8\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x297

    .line 840
    const-string v3, "664. multitude n.\u4f17\u591a,\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x298

    .line 841
    const-string v3, "665. attitude n.\u6001\u5ea6\uff0c\u770b\u6cd5(to, toward, about)\uff1b\u59ff\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0x299

    .line 842
    const-string v3, "666. bee n.\u8702\uff0c\u871c\u8702\uff1b\u5fd9\u788c\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x29a

    .line 843
    const-string v3, "667. fee n.\u8d39(\u4f1a\u8d39,\u5b66\u8d39\u7b49);\u916c\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x29b

    .line 844
    const-string v3, "668. coffee n.\u5496\u5561(\u8272)"

    aput-object v3, v0, v2

    const/16 v2, 0x29c

    .line 845
    const-string v3, "669. refugee n.(\u653f\u6cbb\u4e0a\u7684)\u907f\u96be\u8005\uff0c\u96be\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0x29d

    .line 846
    const-string v3, "670. flee v.\u9003\u8d70;\u9003\u907f"

    aput-object v3, v0, v2

    const/16 v2, 0x29e

    .line 847
    const-string v3, "671. knee n.\u819d,\u819d\u76d6"

    aput-object v3, v0, v2

    const/16 v2, 0x29f

    .line 848
    const-string v3, "672. free a.\u81ea\u7531\u7684;\u514d\u8d39\u7684;\u514d\u7a0e\u7684;\u7a7a\u95f2\u7684 vt.\u91ca\u653e"

    aput-object v3, v0, v2

    const/16 v2, 0x2a0

    .line 849
    const-string v3, "673. agree vi.\u7b54\u5e94\uff0c\u8d5e\u540c\uff1b\u9002\u5408\uff0c\u4e00\u81f4\uff1b\u5546\u5b9a\uff0c\u7ea6\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x2a1

    .line 850
    const-string v3, "674. degree n.\u7a0b\u5ea6;\u5ea6\u6570;\u5b66\u4f4d;\u7b49\u7ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x2a2

    .line 851
    const-string v3, "675. three num.\u4e09 pron./a.\u4e09(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x2a3

    .line 852
    const-string v3, "676. tree n.\u6811,\u6811\u72b6\u7269  vi.\u722c\u4e0a\u6811"

    aput-object v3, v0, v2

    const/16 v2, 0x2a4

    .line 853
    const-string v3, "677. see vt.\u770b\u89c1\uff1b\u4f1a\u9762\uff1b\u63a2\u671b\uff1b\u77e5\u9053\uff0c\u83b7\u6089\uff1b\u9001\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x2a5

    .line 854
    const-string v3, "678. foresee v.\u9884\u89c1,\u9884\u77e5"

    aput-object v3, v0, v2

    const/16 v2, 0x2a6

    .line 855
    const-string v3, "679. guarantee n.\u4fdd\u8bc1,\u4fdd\u8bc1\u4e66 v.\u4fdd\u8bc1,\u62c5\u4fdd"

    aput-object v3, v0, v2

    const/16 v2, 0x2a7

    .line 856
    const-string v3, "680. committee n.\u59d4\u5458\u4f1a,\u5168\u4f53\u59d4\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x2a8

    .line 857
    const-string v3, "681. employee n.\u96c7\u5de5,\u96c7\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x2a9

    .line 858
    const-string v3, "682. cafe n.\u5496\u5561\u9986,(\u5c0f)\u9910\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0x2aa

    .line 859
    const-string v3, "683. safe a.\u5b89\u5168\u7684,\u7262\u9760\u7684;\u8c28\u614e\u7684,\u53ef\u9760\u7684 n.\u4fdd\u9669\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0x2ab

    .line 860
    const-string v3, "684. life n.\u751f\u547d\uff0c\u751f\u5b58\uff1b\u4e00\u751f\uff0c\u5bff\u547d\uff1b\u751f\u6d3b\uff1b\u751f\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x2ac

    .line 861
    const-string v3, "685. knife n.\u5200,\u9910\u5200 v.\u7528\u5200\u5207,\u7528\u5315\u9996\u523a"

    aput-object v3, v0, v2

    const/16 v2, 0x2ad

    .line 862
    const-string v3, "686. strife n.\u4e89\u5435\uff1b\u51b2\u7a81\uff0c\u6597\u4e89\uff1b\u7ade\u4e89"

    aput-object v3, v0, v2

    const/16 v2, 0x2ae

    .line 863
    const-string v3, "687. wife n.\u59bb\u5b50\uff0c\u592b\u4eba\uff0c\u592a\u592a"

    aput-object v3, v0, v2

    const/16 v2, 0x2af

    .line 864
    const-string v3, "688. housewife n.\u5bb6\u5ead\u4e3b\u5987"

    aput-object v3, v0, v2

    const/16 v2, 0x2b0

    .line 865
    const-string v3, "689. age n.\u5e74\u9f84\uff1b\u65f6\u4ee3\uff1b\u8001\u5e74\uff1b\u957f\u65f6\u95f4 v.(\u4f7f)\u53d8\u8001"

    aput-object v3, v0, v2

    const/16 v2, 0x2b1

    .line 866
    const-string v3, "690. cabbage n.\u6d0b\u767d\u83dc,\u5377\u5fc3\u83dc"

    aput-object v3, v0, v2

    const/16 v2, 0x2b2

    .line 867
    const-string v3, "691. garbage n.\u5783\u573e"

    aput-object v3, v0, v2

    const/16 v2, 0x2b3

    .line 868
    const-string v3, "692. cage n.\u9e1f\u7b3c"

    aput-object v3, v0, v2

    const/16 v2, 0x2b4

    .line 869
    const-string v3, "693. bandage n.\u7ef7\u5e26 v.\u7528\u7ef7\u5e26\u624e\u7f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x2b5

    .line 870
    const-string v3, "694. baggage n.\u884c\u674e"

    aput-object v3, v0, v2

    const/16 v2, 0x2b6

    .line 871
    const-string v3, "695. luggage n.\u884c\u674e,\u76ae\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0x2b7

    .line 872
    const-string v3, "696. engage v.(in)\u4ece\u4e8b,\u7740\u624b;\u7ea6\u5b9a;\u4f7f\u8ba2\u5a5a;\u4fdd\u8bc1;\u96c7\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x2b8

    .line 873
    const-string v3, "697. mortgage n./v.\u62b5\u62bc(\u501f\u6b3e)"

    aput-object v3, v0, v2

    const/16 v2, 0x2b9

    .line 874
    const-string v3, "698. carriage n.(\u56db\u8f6e)\u9a6c\u8f66;(\u706b\u8f66)\u5ba2\u8f66\u53a2"

    aput-object v3, v0, v2

    const/16 v2, 0x2ba

    .line 875
    const-string v3, "699. marriage n.\u7ed3\u5a5a,\u5a5a\u59fb;\u7ed3\u5a5a\u4eea\u5f0f"

    aput-object v3, v0, v2

    const/16 v2, 0x2bb

    .line 876
    const-string v3, "700. package n.\u5305\u88c5,\u5305\u88f9,\u7bb1,\u5305\u88c5\u8d39,\u6807\u51c6\u90e8\u4ef6,\u6210\u5957\u8bbe\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x2bc

    .line 877
    const-string v3, "701. village n.\u6751,\u6751\u5e84"

    aput-object v3, v0, v2

    const/16 v2, 0x2bd

    .line 878
    const-string v3, "702. damage v./n.\u635f\u5bb3,\u6bc1\u574f n.(pl.)\u635f\u5bb3\u8d54\u507f\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0x2be

    .line 879
    const-string v3, "703. image n.\u5f62\u8c61\uff0c\u58f0\u8a89\uff1b\u5370\u8c61\uff1b\u50cf\uff1b\u5f62\u8c61\u7684\u63cf\u8ff0\uff0c\u6bd4\u55bb"

    aput-object v3, v0, v2

    const/16 v2, 0x2bf

    .line 880
    const-string v3, "704. manage v.\u7ecf\u8425,\u7ba1\u7406,\u5904\u7406;\u8bbe\u6cd5,\u5bf9\u4ed8;\u64cd\u7eb5,\u8fd0\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x2c0

    .line 881
    const-string v3, "705. page n.\u9875,\u8bb0\u5f55,\u4e8b\u4ef6,\u4e13\u680f vt.\u7ed9...\u6807\u9875\u7801"

    aput-object v3, v0, v2

    const/16 v2, 0x2c1

    .line 882
    const-string v3, "706. rage n.\u6124\u6012"

    aput-object v3, v0, v2

    const/16 v2, 0x2c2

    .line 883
    const-string v3, "707. garage n.\u8f66\u5e93,\u98de\u673a\u5e93;\u4fee\u8f66\u5382"

    aput-object v3, v0, v2

    const/16 v2, 0x2c3

    .line 884
    const-string v3, "708. average n.\u5e73\u5747,\u5e73\u5747\u6570 a.\u5e73\u5747\u7684\uff1b\u666e\u901a\u7684 v.\u5e73\u5747"

    aput-object v3, v0, v2

    const/16 v2, 0x2c4

    .line 885
    const-string v3, "709. beverage n.(\u6c34\uff0c\u9152\u7b49\u4e4b\u5916\u7684)\u996e\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x2c5

    .line 886
    const-string v3, "710. storage n.\u8d2e\u85cf(\u91cf),\u4fdd\u7ba1;\u5e93\u623f"

    aput-object v3, v0, v2

    const/16 v2, 0x2c6

    .line 887
    const-string v3, "711. outrage n.\u66b4\u884c,\u4fae\u8fb1,\u6124\u6012 v.\u51cc\u8fb1,\u5f15\u8d77\u2026\u4e49\u6124,\u5f3a\u5978"

    aput-object v3, v0, v2

    const/16 v2, 0x2c7

    .line 888
    const-string v3, "712. courage n.\u52c7\u6c14,\u80c6\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x2c8

    .line 889
    const-string v3, "713. encourage v.\u9f13\u52b1,\u6002\u607f"

    aput-object v3, v0, v2

    const/16 v2, 0x2c9

    .line 890
    const-string v3, "714. discourage v.\u4f7f\u6cc4\u6c14,\u4f7f\u5931\u53bb\u4fe1\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x2ca

    .line 891
    const-string v3, "715. envisage v.\u60f3\u8c61\uff0c\u8bbe\u60f3\uff0c\u5c55\u671b\uff0c\u6b63\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x2cb

    .line 892
    const-string v3, "716. passage n.\u901a\u8fc7,\u7ecf\u8fc7;\u901a\u8def,\u8d70\u5eca;(\u4e00)\u6bb5\u843d,(\u4e00)\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x2cc

    .line 893
    const-string v3, "717. message n.\u6d88\u606f,\u4fe1\u606f,\u901a\u8baf,\u542f\u793a,\u6559\u8bad,\u5e7f\u544a\u8bcd,\u9884\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x2cd

    .line 894
    const-string v3, "718. usage n.\u4f7f\u7528\uff0c\u7528\u6cd5\uff1b\u4e60\u60ef\uff0c\u4e60\u4fd7\uff1b\u60ef\u7528\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x2ce

    .line 895
    const-string v3, "719. sausage n.\u9999\u80a0,\u814a\u80a0"

    aput-object v3, v0, v2

    const/16 v2, 0x2cf

    .line 896
    const-string v3, "720. heritage n.\u9057\u4ea7,\u7ee7\u627f\u7269;\u4f20\u7edf"

    aput-object v3, v0, v2

    const/16 v2, 0x2d0

    .line 897
    const-string v3, "721. voltage n.\u7535\u538b"

    aput-object v3, v0, v2

    const/16 v2, 0x2d1

    .line 898
    const-string v3, "722. advantage n.\u4f18\u70b9\uff0c\u957f\u5904\uff0c\u6709\u5229\u6761\u4ef6\uff1b\u5229\u76ca\uff0c\u597d\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x2d2

    .line 899
    const-string v3, "723. percentage n.\u767e\u5206\u6570,\u767e\u5206\u7387,\u767e\u5206\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0x2d3

    .line 900
    const-string v3, "724. shortage n.\u4e0d\u8db3,\u7f3a\u5c11"

    aput-object v3, v0, v2

    const/16 v2, 0x2d4

    .line 901
    const-string v3, "725. stage n.\u821e\u53f0,\u620f\u5267;\u9636\u6bb5,\u65f6\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x2d5

    .line 902
    const-string v3, "726. hostage n.\u4eba\u8d28"

    aput-object v3, v0, v2

    const/16 v2, 0x2d6

    .line 903
    const-string v3, "727. postage n.\u90ae\u8d39,\u90ae\u8d44"

    aput-object v3, v0, v2

    const/16 v2, 0x2d7

    .line 904
    const-string v3, "728. cottage n.\u6751\u820d,\u5c0f\u5c4b,\u522b\u5885"

    aput-object v3, v0, v2

    const/16 v2, 0x2d8

    .line 905
    const-string v3, "729. language n.\u8bed\u8a00,\u672f\u8bed,(\u8fd0\u7528\u8bed\u8a00\u7684)\u65b9\u5f0f\u3001\u98ce\u683c"

    aput-object v3, v0, v2

    const/16 v2, 0x2d9

    .line 906
    const-string v3, "730. savage a.\u91ce\u86ee\u7684;\u51f6\u6076\u7684,\u6b8b\u66b4\u7684 n.\u91ce\u4eba,\u672a\u5f00\u5316\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x2da

    .line 907
    const-string v3, "731. wage n.(\u5e38pl.)\u5de5\u8d44,\u62a5\u916c vt.\u8fdb\u884c,\u5f00\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0x2db

    .line 908
    const-string v3, "732. voyage n.\u822a\u6d77;\u822a\u884c;\u65c5\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x2dc

    .line 909
    const-string v3, "733. badge n.\u5fbd\u7ae0,\u50cf\u7ae0\uff1b\u6807\u8bb0\uff1b\u8c61\u5f81\uff1b\u8bb0\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x2dd

    .line 910
    const-string v3, "734. edge n.\u8fb9,\u68f1;\u5200\u53e3,\u5203 v.\u4fa7\u8eab\u79fb\u52a8,\u6324\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x2de

    .line 911
    const-string v3, "735. hedge n.\u7bf1\u7b06,\u6811\u7bf1,\u969c\u788d\u7269 v.\u7528\u6811\u7bf1\u56f4\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x2df

    .line 912
    const-string v3, "736. pledge n.\u8a93\u7ea6;\u4fdd\u8bc1 v.\u53d1\u8a93;\u4fdd\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x2e0

    .line 913
    const-string v3, "737. knowledge n.\u77e5\u8bc6,\u5b66\u8bc6;\u77e5\u9053,\u4e86\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0x2e1

    .line 914
    const-string v3, "738. acknowledge vt.\u627f\u8ba4\uff1b\u63a5\u53d7\uff1b\u544a\u77e5(\u4fe1\u4ef6\u7b49\u7684)\u6536\u5230\uff1b\u7b54\u8c22"

    aput-object v3, v0, v2

    const/16 v2, 0x2e2

    .line 915
    const-string v3, "739. wedge n.\u6954,\u6954\u5f62 vt.\u6954\u7262,\u6954\u5165,\u6324\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x2e3

    .line 916
    const-string v3, "740. ridge n.\u5cad,\u5c71\u8109;\u5c4b\u810a;\u9f3b\u6881"

    aput-object v3, v0, v2

    const/16 v2, 0x2e4

    .line 917
    const-string v3, "741. bridge n.\u6865\uff1b\u6865\u724c\uff1b\u9f3b\u6881 vt.\u67b6\u6865\uff1b\u6e21\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x2e5

    .line 918
    const-string v3, "742. fridge n.(refrigerator\u7684\u7565\u8bed)\u51b0\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0x2e6

    .line 919
    const-string v3, "743. lodge v.\u4e34\u65f6\u4f4f\u5bbf,\u5bc4\u5bbf,\u5bc4\u5b58,\u5bb9\u7eb3n.\u4f20\u8fbe\u5ba4,\u5c0f\u65c5\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0x2e7

    .line 920
    const-string v3, "744. judge n.\u6cd5\u5b98;\u88c1\u5224\u5458;\u9274\u5b9a\u4eba vt.\u5ba1\u5224;\u8bc4\u8bba,\u88c1\u5224"

    aput-object v3, v0, v2

    const/16 v2, 0x2e8

    .line 921
    const-string v3, "745. siege n.\u5305\u56f4\uff0c\u56f4\u653b\uff0c\u56f4\u56f0"

    aput-object v3, v0, v2

    const/16 v2, 0x2e9

    .line 922
    const-string v3, "746. privilege n.\u7279\u6743,\u4f18\u60e0,\u7279\u8bb8 v.\u7ed9\u4e88\u4f18\u60e0,\u7ed9\u4e88\u7279\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x2ea

    .line 923
    const-string v3, "747. allege v.\u65ad\u8a00\uff0c\u5ba3\u79f0\uff1b\u6307\u63a7"

    aput-object v3, v0, v2

    const/16 v2, 0x2eb

    .line 924
    const-string v3, "748. college n.\u5b66\u9662,\u9ad8\u7b49\u4e13\u79d1\u5b66\u6821,\u5927\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x2ec

    .line 925
    const-string v3, "749. oblige v.\u5f3a\u8feb,\u8feb\u4f7f;\u8d23\u6210;(\u4f7f)\u611f\u6fc0,\u65bd\u6069\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x2ed

    .line 926
    const-string v3, "750. prestige n.\u58f0\u671b,\u5a01\u671b,\u5a01\u4fe1"

    aput-object v3, v0, v2

    const/16 v2, 0x2ee

    .line 927
    const-string v3, "751. indulge v.\u653e\u4efb\uff0c\u7eb5\u5bb9\uff0c\u6c89\u6eba\uff1b\u4f7f(\u81ea\u5df1)\u7eb5\u60c5\u4eab\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0x2ef

    .line 928
    const-string v3, "752. change n.\u6539\u53d8,\u53d8\u5316;\u96f6\u94b1 v.\u66f4\u6362,\u8c03\u6362,\u4ea4\u6362;\u6539\u53d8"

    aput-object v3, v0, v2

    const/16 v2, 0x2f0

    .line 929
    const-string v3, "753. exchange v./n.(for)\u4ea4\u6362,\u5151\u6362;\u4ea4\u6d41,\u4ea4\u6613;\u4ea4\u6362\u53f0"

    aput-object v3, v0, v2

    const/16 v2, 0x2f1

    .line 930
    const-string v3, "754. range n.\u8303\u56f4,\u9886\u57df;\u6392\u5217,\u8fde\u7eed;(\u5c71)\u8109v.\u6392\u5217\u6210\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x2f2

    .line 931
    const-string v3, "755. "

    aput-object v3, v0, v2

    const/16 v2, 0x2f3

    .line 932
    const-string v3, "756. "

    aput-object v3, v0, v2

    const/16 v2, 0x2f4

    .line 933
    const-string v3, "757. orange n.\u67d1,\u6854,\u6a59"

    aput-object v3, v0, v2

    const/16 v2, 0x2f5

    .line 934
    const-string v3, "758. arrange v.\u5b89\u6392\uff0c\u7b79\u5212\uff1b\u6574\u7406\uff0c\u4f7f\u6709\u6761\u7406\uff0c\u6392\u5217\uff0c\u5e03\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x2f6

    .line 935
    const-string v3, "759. strange a.\u5947\u602a\u7684,\u5947\u5f02\u7684;\u964c\u751f\u7684,\u751f\u758f\u7684;\u5916\u5730\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x2f7

    .line 936
    const-string v3, "760. challenge n.\u6311\u6218(\u4e66);\u8270\u5de8\u4efb\u52a1,\u96be\u9898 v.\u5411\u2026\u6311\u6218"

    aput-object v3, v0, v2

    const/16 v2, 0x2f8

    .line 937
    const-string v3, "761. revenge n.\u62a5\u590d,\u590d\u4ec7 v.\u66ff\u2026\u62a5\u4ec7"

    aput-object v3, v0, v2

    const/16 v2, 0x2f9

    .line 938
    const-string v3, "762. hinge n.\u5408\u9875,\u94f0\u94fe vi.\u4f9d\u2026\u800c\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x2fa

    .line 939
    const-string v3, "763. fringe n.\u8fb9\u7f18\uff1b(\u7a97\u5e18)\u7f18\u9970\uff1b\u989d\u524d\u5782\u53d1 vt.\u9970\u2026\u7684\u8fb9"

    aput-object v3, v0, v2

    const/16 v2, 0x2fb

    .line 940
    const-string v3, "764. sponge n.\u6d77\u7ef5"

    aput-object v3, v0, v2

    const/16 v2, 0x2fc

    .line 941
    const-string v3, "765. plunge v.(into)(\u4f7f)\u6295\u5165,(\u4f7f)\u63d2\u8fdb,\u9677\u5165;\u731b\u51b2"

    aput-object v3, v0, v2

    const/16 v2, 0x2fd

    .line 942
    const-string v3, "766. lounge n.\u4f11\u606f\u5ba4,\u8d77\u5c45\u5ba4,\u5ba2\u5385"

    aput-object v3, v0, v2

    const/16 v2, 0x2fe

    .line 943
    const-string v3, "767. charge v.\u7d22(\u4ef7);\u63a7\u544a;\u5145\u7535 n.(pl.)\u8d39\u7528,\u4ee3\u4ef7;\u7535\u8377"

    aput-object v3, v0, v2

    const/16 v2, 0x2ff

    .line 944
    const-string v3, "768. discharge v./n.\u5378\u8d27,\u6392\u51fa;\u53d1\u5c04,\u653e(\u7535);\u9063\u6563,\u89e3\u96c7"

    aput-object v3, v0, v2

    const/16 v2, 0x300

    .line 945
    const-string v3, "769. large a.\u5927\u7684,\u5e7f\u5927\u7684,\u5927\u89c4\u6a21\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x301

    .line 946
    const-string v3, "770. enlarge vt.\u6269\u5927,\u653e\u5927,\u589e\u5927"

    aput-object v3, v0, v2

    const/16 v2, 0x302

    .line 947
    const-string v3, "771. merge v.(\u4f7f)\u7ed3\u5408\uff0c(\u4f7f)\u5408\u5e76\uff0c(\u4f7f)\u5408\u4e3a\u4e00\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x303

    .line 948
    const-string v3, "772. submerge v.\u6c89\u6ca1,\u6df9\u6ca1;\u6f5c\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x304

    .line 949
    const-string v3, "773. emerge vt.\u663e\u73b0,\u6d6e\u73b0;\u66b4\u9732;\u5f62\u6210;"

    aput-object v3, v0, v2

    const/16 v2, 0x305

    .line 950
    const-string v3, "774. verge n.\u8fb9,\u8fb9\u7f18 v.\u6fd2\u4e34"

    aput-object v3, v0, v2

    const/16 v2, 0x306

    .line 951
    const-string v3, "775. forge v.\u953b\u9020,\u4f2a\u9020 n.\u953b\u5de5\u8f66\u95f4;\u953b\u7089"

    aput-object v3, v0, v2

    const/16 v2, 0x307

    .line 952
    const-string v3, "776. urge vt.\u50ac\u4fc3;\u6002\u607f;\u5f3a\u8c03 n.\u5f3a\u70c8\u6b32\u671b,\u8feb\u5207\u8981\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x308

    .line 953
    const-string v3, "777. surge vi.\u6c79\u6d8c\uff1b\u5f6d\u6e43\uff1b\u8702\u62e5\u800c\u81f3 n.\u5de8\u6d6a;\u6c79\u6d8c;\u5f6d\u6e43"

    aput-object v3, v0, v2

    const/16 v2, 0x309

    .line 954
    const-string v3, "778. gauge n.\u6807\u51c6\u5c3a\u5bf8;\u89c4\u683c;\u91cf\u89c4,\u91cf\u8868 v.\u6d4b\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x30a

    .line 955
    const-string v3, "779. refuge n.\u907f\u96be\u5904,\u85cf\u8eab\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x30b

    .line 956
    const-string v3, "780. huge a.\u5de8\u5927\u7684,\u5e9e\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x30c

    .line 957
    const-string v3, "781. he pron.\u4ed6\uff1b(\u4e0d\u8bba\u6027\u522b\u7684)\u4e00\u4e2a\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x30d

    .line 958
    const-string v3, "782. ache vi.\u75db\uff1b\u54c0\u601c n.(\u6307\u8fde\u7eed)\u75bc\u75db\u3001\u9178\u75db"

    aput-object v3, v0, v2

    const/16 v2, 0x30e

    .line 959
    const-string v3, "783. headache n.\u5934\u75db"

    aput-object v3, v0, v2

    const/16 v2, 0x30f

    .line 960
    const-string v3, "784. catastrophe n.\u5927\u707e\u96be\uff1b(\u60b2\u5267)\u7ed3\u5c40"

    aput-object v3, v0, v2

    const/16 v2, 0x310

    .line 961
    const-string v3, "785. she pron.(\u4e3b\u683c)\u5979"

    aput-object v3, v0, v2

    const/16 v2, 0x311

    .line 962
    const-string v3, "786. the art.\u8fd9(\u90a3)\u4e2a;\u8fd9(\u90a3)\u4e9b(\u6307\u7279\u5b9a\u7684\u4eba\u6216\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x312

    .line 963
    const-string v3, "787. bathe v.\u6e38\u6cf3,\u6d17\u6fa1,\u6d78,\u5f04\u6e7f"

    aput-object v3, v0, v2

    const/16 v2, 0x313

    .line 964
    const-string v3, "788. breathe v.\u547c\u5438,\u5438\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x314

    .line 965
    const-string v3, "789. clothe v.(\u7ed9\u2026)\u7a7f\u8863,\u4f9b\u7ed9\u2026\u8863\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0x315

    .line 966
    const-string v3, "790. die vi.\u6b7b\uff0c\u6b7b\u4ea1\uff1b(\u8349\u6728)\u67af\u840e\uff0c\u51cb\u8c22\uff1b\u6e34\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x316

    .line 967
    const-string v3, "791. lie vi.\u8eba\uff0c\u5e73\u653e\uff1b\u5904\u4e8e\uff1b\u4f4d\u4e8e v.\u8bf4\u8c0e n.\u8c0e\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x317

    .line 968
    const-string v3, "792. underlie vt.\u4f4d\u4e8e...\u4e4b\u4e0b, \u6210\u4e3a...\u7684\u57fa\u7840"

    aput-object v3, v0, v2

    const/16 v2, 0x318

    .line 969
    const-string v3, "793. pie n.\u9985\u997c"

    aput-object v3, v0, v2

    const/16 v2, 0x319

    .line 970
    const-string v3, "794. calorie n.\u5361\u8def\u91cc(\u98df\u7269\u6240\u4ea7\u751f\u7684\u70ed\u91cf\u6216\u80fd\u91cf\u5355\u4f4d)"

    aput-object v3, v0, v2

    const/16 v2, 0x31a

    .line 971
    const-string v3, "795. tie n.\u9886\u5e26;\u8054\u7cfb,\u5173\u7cfb,\u7ebd\u5e26;\u675f\u7f1a v.\u624e,\u7cfb,\u6346"

    aput-object v3, v0, v2

    const/16 v2, 0x31b

    .line 972
    const-string v3, "796. movie n.\u7535\u5f71,\u7535\u5f71\u9662"

    aput-object v3, v0, v2

    const/16 v2, 0x31c

    .line 973
    const-string v3, "797. bake v.\u70e4,\u70d8,\u7119;\u70e7\u786c,\u7119\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0x31d

    .line 974
    const-string v3, "798. cake n.\u997c\uff0c\u7cd5\uff0c\u86cb\u7cd5\uff1b\u6241\u5e73\u7684\u5757\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x31e

    .line 975
    const-string v3, "799. fake n.\u5047\u8d27\uff0c\u8d5d\u54c1 a.\u5047\u7684\uff0c\u5192\u5145\u7684 v.\u4f2a\u9020\uff1b\u4f2a\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x31f

    .line 976
    const-string v3, "800. shake n./v.\u6447\u52a8,\u6447;\u98a4\u6296,\u9707\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x320

    .line 977
    const-string v3, "801. lake n.\u6e56\u6cca\uff0c\u6e56\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x321

    .line 978
    const-string v3, "802. make n.(\u4ea7\u54c1)\u6765\u6e90\uff0c\u5236\u6cd5 vt.\u5236\u9020\uff0c\u505a\u6210\uff0c\u51c6\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x322

    .line 979
    const-string v3, "803. snake n.\u86c7"

    aput-object v3, v0, v2

    const/16 v2, 0x323

    .line 980
    const-string v3, "804. rake n.\u8019\u5b50,\u8019\u673a v.\u8019;\u641c\u7d22,\u63a2\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x324

    .line 981
    const-string v3, "805. brake v./n.\u5236\u52a8(\u5668),\u95f8,\u5239\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x325

    .line 982
    const-string v3, "806. sake n.\u7f18\u6545,\u7406\u7531"

    aput-object v3, v0, v2

    const/16 v2, 0x326

    .line 983
    const-string v3, "807. take v.\u62ff\u53d6\uff1b\u5403\uff1b\u8bb0\u5f55\uff1b\u53d6\u5f97\uff1b\u82b1\u8d39\uff1b\u6355\u83b7\uff1b\u8ba4\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x327

    .line 984
    const-string v3, "808. undertake v.\u627f\u62c5,\u62c5\u4efb;\u8bb8\u8bfa,\u4fdd\u8bc1;\u7740\u624b,\u4ece\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x328

    .line 985
    const-string v3, "809. overtake v.\u8ffd\u4e0a,\u8d85\u8fc7,\u7a81\u7136\u964d\u4e34,\u538b\u5012"

    aput-object v3, v0, v2

    const/16 v2, 0x329

    .line 986
    const-string v3, "810. stake n.\u6869,\u6807\u6869;\u8d4c\u6ce8,\u5229\u5bb3\u5173\u7cfb"

    aput-object v3, v0, v2

    const/16 v2, 0x32a

    .line 987
    const-string v3, "811. mistake n.\u9519\u8bef,\u8fc7\u5931,\u8bef\u89e3 v.\u5f04\u9519;(for)\u628a\u2026\u8bef\u8ba4\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x32b

    .line 988
    const-string v3, "812. earthquake n.\u5730\u9707"

    aput-object v3, v0, v2

    const/16 v2, 0x32c

    .line 989
    const-string v3, "813. wake v.\u9192\u6765,\u5524\u9192;\u4f7f\u89c9\u9192,\u6fc0\u53d1,\u5f15\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x32d

    .line 990
    const-string v3, "814. awake a.\u9192\u7740\u7684 vt.\u5524\u9192\uff0c\u4f7f\u89c9\u9192 vi.\u9192\u6765\uff0c\u9192\u609f\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x32e

    .line 991
    const-string v3, "815. hike n.\u5f92\u6b65\u65c5\u884c\uff1b\u589e\u52a0vi.\u5f92\u6b65\u65c5\u884cvt.\u63d0\u9ad8"

    aput-object v3, v0, v2

    const/16 v2, 0x32f

    .line 992
    const-string v3, "816. like v.\u559c\u6b22 prep.\u8c61\uff1b\u6bd4\u5982 a.\u76f8\u8c61\u7684 n.\u8c61\u2026\u4e00\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x330

    .line 993
    const-string v3, "817. alike a.\u540c\u6837\u7684\uff0c\u76f8\u50cf\u7684ad.\u4e00\u6837\u5730\uff1b\u540c\u7a0b\u5ea6\u5730\u3000"

    aput-object v3, v0, v2

    const/16 v2, 0x331

    .line 994
    const-string v3, "818. unlike a.\u4e0d\u540c\u7684,\u4e0d\u76f8\u4f3c\u7684 prep.\u4e0d\u8c61,\u548c\u2026\u4e0d\u540c"

    aput-object v3, v0, v2

    const/16 v2, 0x332

    .line 995
    const-string v3, "819. dislike n./v.\u4e0d\u559c\u6b22,\u538c\u6076"

    aput-object v3, v0, v2

    const/16 v2, 0x333

    .line 996
    const-string v3, "820. strike n./vi.\u7f62\u5de5 vt.\u6253\uff0c\u51fb\uff1b\u653b\u51fb\uff1b\u7ed9\u2026\u6df1\u523b\u5370\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x334

    .line 997
    const-string v3, "821. coke n.\u7126\u70ad\uff1b\u53ef\u53e3\u53ef\u4e50\uff08COCA-COLA\uff09\u7684\u7f29\u5199"

    aput-object v3, v0, v2

    const/16 v2, 0x335

    .line 998
    const-string v3, "822. choke v.\u7a92\u606f,\u564e\u4f4f;\u95f7\u585e,\u5835\u585e,\u963b\u585e"

    aput-object v3, v0, v2

    const/16 v2, 0x336

    .line 999
    const-string v3, "823. joke n.\u7b11\u8bdd,\u73a9\u7b11 v.\u8bf4\u7b11\u8bdd,\u5f00\u73a9\u7b11"

    aput-object v3, v0, v2

    const/16 v2, 0x337

    .line 1000
    const-string v3, "824. smoke n.\u70df,\u70df\u5c18;\u5438\u70df,\u62bd\u70df v.\u62bd(\u70df);\u5192\u70df,\u5192\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x338

    .line 1001
    const-string v3, "825. poke n.\u523a,\u6233,\u61d2\u6c49,\u888b\u5b50 v.\u6233,\u523a,\u4f38\u51fa,\u523a\u63a2,\u95f2\u8361"

    aput-object v3, v0, v2

    const/16 v2, 0x339

    .line 1002
    const-string v3, "826. stroke n.\u51fb;\u62a5\u65f6\u7684\u949f\u58f0;\u4e00\u51fb/\u5212/\u7b14;\u4e2d\u98ce v.\u629a\u6478"

    aput-object v3, v0, v2

    const/16 v2, 0x33a

    .line 1003
    const-string v3, "827. evoke vt.\u5524\u8d77(\u56de\u5fc6\u3001\u611f\u60c5\u7b49)\uff1b\u5f15\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x33b

    .line 1004
    const-string v3, "828. provoke v.\u6311\u52a8;\u6fc0\u53d1;\u62db\u60f9"

    aput-object v3, v0, v2

    const/16 v2, 0x33c

    .line 1005
    const-string v3, "829. scale n.\u523b\u5ea6;\u5929\u5e73,\u78c5\u79e4;\u6bd4\u4f8b\u5c3a;\u89c4\u6a21;\u97f3\u9636;\u9c7c\u9cde"

    aput-object v3, v0, v2

    const/16 v2, 0x33d

    .line 1006
    const-string v3, "830. inhale v.\u5438\u5165(\u6c14\u4f53\u7b49)\uff0c\u5438(\u70df)"

    aput-object v3, v0, v2

    const/16 v2, 0x33e

    .line 1007
    const-string v3, "831. whale n.\u9cb8\uff1b\u5e9e\u7136\u5927\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x33f

    .line 1008
    const-string v3, "832. male n./a.\u7537\u6027(\u7684),\u96c4\u6027(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x340

    .line 1009
    const-string v3, "833. female n.\u5973\u6027;\u5973\u4eba;\u96cc\u517d a.\u5973\u6027\u7684;\u96cc\u7684;\u67d4\u5f31\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x341

    .line 1010
    const-string v3, "834. pale a.\u82cd\u767d\u7684,\u7070\u767d\u7684;\u6d45\u7684,\u6697\u6de1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x342

    .line 1011
    const-string v3, "835. sale n.\u51fa\u552e,\u4e0a\u5e02;\u8d31\u5356,\u5ec9\u4ef7\u51fa\u552e;\u9500\u552e\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x343

    .line 1012
    const-string v3, "836. tale n.\u6545\u4e8b,\u4f20\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x344

    .line 1013
    const-string v3, "837. stale n.\u53d8\u8d28\u7684,\u4e0d\u65b0\u9c9c\u7684;\u9648\u65e7\u7684,\u9648\u8150\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x345

    .line 1014
    const-string v3, "838. able a.\u6709(\u80fd\u529b\u3001\u65f6\u95f4\u3001\u77e5\u8bc6\u7b49)\u505a\u67d0\u4e8b\uff0c\u6709\u672c\u4e8b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x346

    .line 1015
    const-string v3, "839. probable a.\u5f88\u53ef\u80fd\u7684,\u5927\u6982\u7684;\u6709\u5e0c\u671b\u7684,\u53ef\u80fd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x347

    .line 1016
    const-string v3, "840. cable n.\u7535\u62a5;\u7535\u7f06;\u7f06,\u7d22,\u94a2\u4e1d\u7ef3 v.\u62cd\u7535\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x348

    .line 1017
    const-string v3, "841. applicable a.\u53ef\u5e94\u7528(\u5b9e\u65bd)\u7684\uff1b\u9002\u5f53\u7684,\u5408\u9002\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x349

    .line 1018
    const-string v3, "842. formidable a.\u5f3a\u5927\u7684;\u4ee4\u4eba\u656c\u754f\u7684;\u53ef\u6015\u7684;\u8270\u96be\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x34a

    .line 1019
    const-string v3, "843. noticeable a.\u663e\u800c\u6613\u89c1\u7684,\u503c\u5f97\u6ce8\u610f\u7684,\u91cd\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x34b

    .line 1020
    const-string v3, "844. agreeable a.\u7b26\u5408\u7684\uff1b\u4e00\u81f4\u7684\uff1b\u6b23\u7136\u540c\u610f\u7684\uff1b\u4ee4\u4eba\u6109\u5feb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x34c

    .line 1021
    const-string v3, "845. fable n.\u5bd3\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x34d

    .line 1022
    const-string v3, "846. sociable a.\u597d\u4ea4\u9645\u7684\uff0c\u53cb\u597d\u7684\uff0c\u5408\u7fa4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x34e

    .line 1023
    const-string v3, "847. liable a.\u6709...\u503e\u5411\u7684\uff1b\u53ef\u80fd\u906d\u53d7...\u7684\uff1b\u6709\u8d23\u4efb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x34f

    .line 1024
    const-string v3, "848. reliable a.\u53ef\u9760\u7684,\u53ef\u4fe1\u8d56\u7684,\u786e\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x350

    .line 1025
    const-string v3, "849. amiable a.\u548c\u853c\u53ef\u4eb2\u7684\uff0c\u53cb\u5584\u7684\uff0c\u4eb2\u5207\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x351

    .line 1026
    const-string v3, "850. variable a.\u6613\u53d8\u7684;\u53ef\u53d8\u7684;\u53d8\u91cf\u7684 n.\u53d8\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x352

    .line 1027
    const-string v3, "851. remarkable a.\u503c\u5f97\u6ce8\u610f\u7684;\u663e\u8457\u7684,\u5f02\u5e38\u7684,\u975e\u51e1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x353

    .line 1028
    const-string v3, "852. available a.(\u7528\u4e8e\u7269)\u53ef\u5229\u7528\u7684\uff1b\u53ef\u89c1\u5230\u7684\uff0c\u63a5\u53d7\u91c7\u8bbf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x354

    .line 1029
    const-string v3, "853. enable v.\u4f7f\u80fd\u591f,\u4f7f\u6210\u4e3a\u53ef\u80fd;\u6388\u4e88\u6743\u5229\u6216\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x355

    .line 1030
    const-string v3, "854. fashionable a.\u6d41\u884c\u7684,\u65f6\u9ae6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x356

    .line 1031
    const-string v3, "855. reasonable a.\u5408\u7406\u7684,\u6709\u9053\u7406\u7684;\u901a\u60c5\u8fbe\u7406\u7684;\u9002\u5ea6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x357

    .line 1032
    const-string v3, "856. capable a.\u6709\u672c\u9886\u7684,\u6709\u80fd\u529b\u7684;(of)\u53ef\u4ee5\u2026\u7684,\u80fd\u2026\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x358

    .line 1033
    const-string v3, "857. comparable a.(with,to)\u53ef\u6bd4\u8f83\u7684,\u6bd4\u5f97\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x359

    .line 1034
    const-string v3, "858. considerable a.\u76f8\u5f53\u5927(\u6216\u591a)\u7684,\u53ef\u89c2\u7684;\u503c\u5f97\u8003\u8651\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35a

    .line 1035
    const-string v3, "859. preferable a.(to)\u66f4\u53ef\u53d6\u7684,\u66f4\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35b

    .line 1036
    const-string v3, "860. innumerable a.\u65e0\u6570\u7684,\u6570\u4e0d\u6e05\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35c

    .line 1037
    const-string v3, "861. vulnerable a.\u6613\u53d7\u653b\u51fb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35d

    .line 1038
    const-string v3, "862. miserable a.\u75db\u82e6\u7684,\u60b2\u60e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35e

    .line 1039
    const-string v3, "863. desirable a.\u503c\u5f97\u505a\u7684;\u5408\u610f\u7684,\u79f0\u5fc3\u7684;\u671f\u671b\u5f97\u5230\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x35f

    .line 1040
    const-string v3, "864. honorable a.(honourable)\u53ef\u656c\u7684;\u8363\u8a89\u7684,\u5149\u8363\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x360

    .line 1041
    const-string v3, "865. favorable a.(favourable)\u8d5e\u8bb8\u7684,\u6709\u5229\u7684,\u8ba8\u4eba\u559c\u6b22\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x361

    .line 1042
    const-string v3, "866. durable a.\u6301\u4e45\u7684,\u8010\u4e45\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x362

    .line 1043
    const-string v3, "867. disable vt.\u4f7f\u6b8b\u5e9f;\u4f7f\u5931\u53bb\u80fd\u529b;\u4e27\u5931\u80fd\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x363

    .line 1044
    const-string v3, "868. advisable a.\u53ef\u53d6\u7684\uff0c\u9002\u5f53\u7684\uff0c\u660e\u667a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x364

    .line 1045
    const-string v3, "869. indispensable a.(to,for)\u5fc5\u4e0d\u53ef\u5c11\u7684,\u5fc5\u9700\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x365

    .line 1046
    const-string v3, "870. table n.\u684c\u5b50;\u9910\u684c;\u5de5\u4f5c\u53f0;\u8868\u683c vt.\u6401\u7f6e;\u63d0\u4ea4\u8ba8\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x366

    .line 1047
    const-string v3, "871. vegetable n.\u852c\u83dc,\u690d\u7269 a.\u690d\u7269\u7684,\u852c\u83dc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x367

    .line 1048
    const-string v3, "872. profitable a.\u6709\u5229\u53ef\u56fe\u7684,\u6709\u76ca\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x368

    .line 1049
    const-string v3, "873. suitable a.(for)\u5408\u9002\u7684,\u9002\u5b9c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x369

    .line 1050
    const-string v3, "874. inevitable a.\u4e0d\u53ef\u907f\u514d\u7684,\u5fc5\u7136\u53d1\u751f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x36a

    .line 1051
    const-string v3, "875. notable n.\u503c\u5f97\u6ce8\u610f\u7684,\u663e\u8457\u7684,\u8457\u540d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x36b

    .line 1052
    const-string v3, "876. comfortable a.\u8212\u9002\u7684\uff0c\u8212\u670d\u7684\uff1b\u611f\u5230\u8212\u9002\u7684\uff0c\u5b89\u9038\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x36c

    .line 1053
    const-string v3, "877. portable a.\u8f7b\u4fbf\u7684,\u624b\u63d0(\u5f0f)\u7684,\u53ef\u79fb\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x36d

    .line 1054
    const-string v3, "878. stable a.\u7a33\u5b9a\u7684,\u5b89\u5b9a\u7684 n.\u9a6c\u53a9,\u9a6c\u68da"

    aput-object v3, v0, v2

    const/16 v2, 0x36e

    .line 1055
    const-string v3, "879. valuable a.\u8d35\u91cd\u7684,\u6709\u4ef7\u503c\u7684 n.(pl.)\u8d35\u91cd\u7269\u54c1,\u8d22\u5b9d"

    aput-object v3, v0, v2

    const/16 v2, 0x36f

    .line 1056
    const-string v3, "880. invaluable a.\u975e\u5e38\u5b9d\u8d35\u7684,\u65e0\u4ef7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x370

    .line 1057
    const-string v3, "881. pebble n.\u5375\u77f3"

    aput-object v3, v0, v2

    const/16 v2, 0x371

    .line 1058
    const-string v3, "882. bubble n.\u6ce1,\u6c34\u6ce1,\u6c14\u6ce1 v.\u5192\u6ce1,\u8d77\u6ce1,\u6cb8\u817e"

    aput-object v3, v0, v2

    const/16 v2, 0x372

    .line 1059
    const-string v3, "883. feeble a.\u865a\u5f31\u7684,\u65e0\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x373

    .line 1060
    const-string v3, "884. Bible n.\u5723\u7ecf"

    aput-object v3, v0, v2

    const/16 v2, 0x374

    .line 1061
    const-string v3, "885. edible a.\u53ef\u98df\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x375

    .line 1062
    const-string v3, "886. incredible a.\u4e0d\u53ef\u76f8\u4fe1\u7684,\u60ca\u4eba\u7684,\u4e0d\u53ef\u601d\u8bae\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x376

    .line 1063
    const-string v3, "887. eligible a.\u7b26\u5408\u6761\u4ef6\u7684;(\u5c24\u6307\u5a5a\u59fb\u7b49)\u5408\u9002(\u610f)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x377

    .line 1064
    const-string v3, "888. negligible a.\u53ef\u5ffd\u7565\u4e0d\u8ba1\u7684\uff0c\u5fae\u4e0d\u8db3\u9053\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x378

    .line 1065
    const-string v3, "889. intelligible a.\u53ef\u7406\u89e3\u7684\uff0c\u660e\u767d\u6613\u61c2\u7684\uff0c\u6e05\u695a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x379

    .line 1066
    const-string v3, "890. terrible a.\u5f88\u7cdf\u7684;\u53ef\u6015\u7684,\u9a87\u4eba\u7684;\u6781\u5ea6\u7684,\u5389\u5bb3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37a

    .line 1067
    const-string v3, "891. horrible a.\u4ee4\u4eba\u6050\u60e7\u7684\uff0c\u53ef\u6015\u7684\uff1b\u6781\u8ba8\u538c\u7684\uff0c\u7cdf\u900f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37b

    .line 1068
    const-string v3, "892. feasible a.\u53ef\u884c\u7684;\u5207\u5b9e\u53ef\u884c\u7684;\u884c\u5f97\u901a\u7684;\u53ef\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37c

    .line 1069
    const-string v3, "893. visible a.\u770b\u5f97\u89c1\u7684, \u660e\u663e\u7684, \u663e\u8457\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37d

    .line 1070
    const-string v3, "894. invisible a.\u770b\u4e0d\u89c1\u7684,\u65e0\u5f62\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37e

    .line 1071
    const-string v3, "895. sensible a.\u660e\u667a\u7684,\u8fbe\u7406\u7684;\u53ef\u89c9\u5bdf\u7684,\u660e\u663e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x37f

    .line 1072
    const-string v3, "896. responsible a.(for,to)\u5e94\u8d1f\u8d23\u7684;\u53ef\u9760\u7684;\u8d23\u4efb\u91cd\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x380

    .line 1073
    const-string v3, "897. possible a.\u53ef\u80fd\u7684,\u505a\u5f97\u5230\u7684;\u5408\u7406\u7684;\u53ef\u5141\u8bb8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x381

    .line 1074
    const-string v3, "898. impossible a.\u4e0d\u53ef\u80fd\u7684\uff1b\u96be\u4ee5\u5fcd\u53d7\u7684\uff0c\u5f88\u96be\u5bf9\u4ed8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x382

    .line 1075
    const-string v3, "899. plausible a.\u4f3c\u662f\u800c\u975e\u7684,\u4f3c\u4e4e\u5408\u7406\u7684,\u4f3c\u4e4e\u53ef\u4fe1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x383

    .line 1076
    const-string v3, "900. compatible a.\u80fd\u548c\u7766\u76f8\u5904\u7684,\u5408\u5f97\u6765\u7684;\u517c\u5bb9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x384

    .line 1077
    const-string v3, "901. susceptible a.\u6613\u53d7\u5f71\u54cd\u7684;\u6613\u53d7\u611f\u52a8\u7684;\u6613\u53d7\u611f\u67d3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x385

    .line 1078
    const-string v3, "902. flexible a.\u67d4\u97e7\u7684,\u6613\u5f2f\u66f2\u7684,\u7075\u6d3b\u7684,\u80fd\u53d8\u5f62\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x386

    .line 1079
    const-string v3, "903. gamble n./v.\u6295\u673a,\u5192\u9669;\u8d4c\u535a"

    aput-object v3, v0, v2

    const/16 v2, 0x387

    .line 1080
    const-string v3, "904. scramble vi.(\u5feb\u901f\u5730)\u722c\uff0c\u6500\u767b\uff1b\u4e92\u76f8\u4e89\u593a\uff0c\u4e89\u5148"

    aput-object v3, v0, v2

    const/16 v2, 0x388

    .line 1081
    const-string v3, "905. tremble n.\u6218\u6817,\u98a4\u6296 v.\u53d1\u6296,\u98a4\u6296\uff1b\u6447\u52a8\uff1b\u7126\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0x389

    .line 1082
    const-string v3, "906. resemble v.\u50cf,\u7c7b\u4f3c"

    aput-object v3, v0, v2

    const/16 v2, 0x38a

    .line 1083
    const-string v3, "907. assemble vt.\u96c6\u5408\uff0c\u53ec\u96c6\uff1b\u88c5\u914d\uff1b\u6536\u96c6 vi.\u96c6\u5408\uff0c\u805a\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x38b

    .line 1084
    const-string v3, "908. humble a.\u8c26\u5351\u7684,\u606d\u987a\u7684;\u5730\u4f4d\u4f4e\u4e0b\u7684 v.\u964d\u4f4e,\u8d2c\u4f4e"

    aput-object v3, v0, v2

    const/16 v2, 0x38c

    .line 1085
    const-string v3, "909. tumble v.(\u4f7f)\u6454\u5012;\u6253\u6eda,\u7ffb\u817e n.\u6454\u8de4,\u8dcc\u5012"

    aput-object v3, v0, v2

    const/16 v2, 0x38d

    .line 1086
    const-string v3, "910. stumble n.\u8dcc\u5012\uff0c\u7eca\u5012 vi.\u7eca(\u6454)\u5012\uff1b\u7ed3\u7ed3\u5df4\u5df4\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x38e

    .line 1087
    const-string v3, "911. noble a.\u9ad8\u5c1a\u7684;\u8d35\u65cf\u7684,\u9ad8\u8d35\u7684 n.\u8d35\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x38f

    .line 1088
    const-string v3, "912. marble n.\u5927\u7406\u77f3,\u4e91\u77f3"

    aput-object v3, v0, v2

    const/16 v2, 0x390

    .line 1089
    const-string v3, "913. soluble a.\u53ef\u6eb6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x391

    .line 1090
    const-string v3, "914. trouble n.\u70e6\u607c;\u52a8\u4e71;\u75be\u75c5;\u6545\u969c;\u8f9b\u82e6v.(\u4f7f)\u70e6\u607c"

    aput-object v3, v0, v2

    const/16 v2, 0x392

    .line 1091
    const-string v3, "915. miracle n.\u5947\u8ff9,\u4ee4\u4eba\u60ca\u5947\u7684\u4eba(\u6216\u4e8b)"

    aput-object v3, v0, v2

    const/16 v2, 0x393

    .line 1092
    const-string v3, "916. spectacle n.(pl.)\u773c\u955c;\u573a\u9762,\u666f\u8c61;\u5947\u89c2,\u58ee\u89c2"

    aput-object v3, v0, v2

    const/16 v2, 0x394

    .line 1093
    const-string v3, "917. obstacle n.\u969c\u788d(\u7269),\u59a8\u788d,\u963b\u788d,\u5e72\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x395

    .line 1094
    const-string v3, "918. vehicle n.\u8f66\u8f86,\u4ea4\u901a\u5de5\u5177;\u5a92\u4ecb,\u8f7d\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x396

    .line 1095
    const-string v3, "919. article n.\u6587\u7ae0\uff0c\u8bba\u6587\uff1b\u6761\u6b3e\uff0c\u6761\u6587\uff1b\u7269\u4ef6\uff1b\u51a0\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x397

    .line 1096
    const-string v3, "920. particle n.\u7c92\u5b50,\u5fae\u7c92;\u6781\u5c0f\u91cf;\u5c0f\u54c1\u8bcd,\u865a\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x398

    .line 1097
    const-string v3, "921. uncle n.\u4f2f\u7236\uff0c\u53d4\u7236\uff0c\u8205\u7236\uff0c\u59d1\u7236\uff0c\u59e8\u7236"

    aput-object v3, v0, v2

    const/16 v2, 0x399

    .line 1098
    const-string v3, "922. circle n.\u5706,\u5706\u5468;\u96c6\u56e2;\u5468\u671f,\u5faa\u73af v.\u73af\u7ed5,\u65cb\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0x39a

    .line 1099
    const-string v3, "923. muscle n.\u808c\u8089,\u4f53\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x39b

    .line 1100
    const-string v3, "924. cycle n.\u81ea\u884c\u8f66;\u5468\u671f,\u5faa\u73af v.\u9a91\u81ea\u884c\u8f66;\u5faa\u73af"

    aput-object v3, v0, v2

    const/16 v2, 0x39c

    .line 1101
    const-string v3, "925. recycle v./n.\u518d\u5faa\u73af,\u91cd\u590d\u5229\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x39d

    .line 1102
    const-string v3, "926. bicycle n.(bike)\u81ea\u884c\u8f66 vi.\u9a91\u81ea\u884c\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x39e

    .line 1103
    const-string v3, "927. cradle n.\u6447\u7bee;\u53d1\u6e90\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x39f

    .line 1104
    const-string v3, "928. paddle n.\u6868 v.\u7528\u6868\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0x3a0

    .line 1105
    const-string v3, "929. saddle n.\u978d,\u9a6c\u978d,\u978d\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x3a1

    .line 1106
    const-string v3, "930. middle n./a.\u4e2d\u95f4(\u7684),\u5f53\u4e2d(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x3a2

    .line 1107
    const-string v3, "931. riddle n.\u8c1c,\u8c1c\u8bed"

    aput-object v3, v0, v2

    const/16 v2, 0x3a3

    .line 1108
    const-string v3, "932. huddle n./v.\u62e5\u6324;\u805a\u96c6v.(\u56e0\u5bd2\u51b7\u3001\u5bb3\u6015\u800c)\u7f29\u6210\u4e00\u56e2"

    aput-object v3, v0, v2

    const/16 v2, 0x3a4

    .line 1109
    const-string v3, "933. needle n.\u9488,\u6307\u9488,\u9488\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x3a5

    .line 1110
    const-string v3, "934. idle a.\u7a7a\u95f2\u7684,\u95f2\u7f6e\u7684;\u61d2\u6563\u7684 v.\u7a7a\u8d39,\u865a\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x3a6

    .line 1111
    const-string v3, "935. candle n.\u8721\u70db"

    aput-object v3, v0, v2

    const/16 v2, 0x3a7

    .line 1112
    const-string v3, "936. handle n.\u67c4,\u628a\u624b,\u62c9\u624b v.\u5904\u7406,\u5bf9\u5f85,\u64cd\u7eb5;\u89e6,\u629a\u517b"

    aput-object v3, v0, v2

    const/16 v2, 0x3a8

    .line 1113
    const-string v3, "937. bundle n.\u6346,\u5305,\u675f"

    aput-object v3, v0, v2

    const/16 v2, 0x3a9

    .line 1114
    const-string v3, "938. noodle n.(\u5e38\u7528\u590d\u6570)\u9762\u6761"

    aput-object v3, v0, v2

    const/16 v2, 0x3aa

    .line 1115
    const-string v3, "939. rifle n.\u6b65\u67aa"

    aput-object v3, v0, v2

    const/16 v2, 0x3ab

    .line 1116
    const-string v3, "940. trifle n.\u5c11\u91cf\uff1b\u5c0f\u4e8b,\u7410\u4e8b v.\u73a9\u5f04\uff1b\u5b09\u800d\uff1b\u5ffd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x3ac

    .line 1117
    const-string v3, "941. eagle n.\u9e70"

    aput-object v3, v0, v2

    const/16 v2, 0x3ad

    .line 1118
    const-string v3, "942. giggle vi.\uff0fn.\u75f4\u7b11\uff1b\u54af\u54af\u5730\u7b11 vt.\u54af\u54af\u5730\u7b11\u7740\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x3ae

    .line 1119
    const-string v3, "943. smuggle v.\u8d70\u79c1;\u5077\u8fd0"

    aput-object v3, v0, v2

    const/16 v2, 0x3af

    .line 1120
    const-string v3, "944. struggle n./v.\u6597\u4e89,\u594b\u6597,\u52aa\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x3b0

    .line 1121
    const-string v3, "945. angle n.\u89d2\uff0c\u89d2\u5ea6 v.\u9493\u9c7c\uff1b(\u91c7\u7528\u5404\u79cd\u65b9\u6cd5\uff09\u53d6\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x3b1

    .line 1122
    const-string v3, "946. triangle n.\u4e09\u89d2(\u5f62)"

    aput-object v3, v0, v2

    const/16 v2, 0x3b2

    .line 1123
    const-string v3, "947. tangle n.\u7ea0\u7f20\uff1b\u7f20\u7ed3\uff1b\u6df7\u4e71 v.(\u4f7f)\u7f20\u7ed5\uff1b\u53d8\u4e71"

    aput-object v3, v0, v2

    const/16 v2, 0x3b3

    .line 1124
    const-string v3, "948. rectangle n.[\u6570]\u77e9\u5f62, \u957f\u65b9\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x3b4

    .line 1125
    const-string v3, "949. mingle v.(\u4f7f)\u6df7\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x3b5

    .line 1126
    const-string v3, "950. single a.\u5355\u4eba\u7684;\u5355\u4e00\u7684,\u5355\u4e2a\u7684;\u672a\u5a5a\u7684,\u72ec\u8eab\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3b6

    .line 1127
    const-string v3, "951. jungle n.\u4e1b\u6797,\u751f\u6b7b\u5730\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x3b7

    .line 1128
    const-string v3, "952. mobile a.\u53ef\u52a8\u7684,\u6d3b\u52a8\u7684,\u8fd0\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3b8

    .line 1129
    const-string v3, "953. reconcile v.\u4f7f\u548c\u597d,\u8c03\u89e3,\u4f7f\u8c03\u548c;(to,with)\u4f7f\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x3b9

    .line 1130
    const-string v3, "954. file n.\u9509\u5200;\u6587\u4ef6,\u6863\u6848 v.\u9509"

    aput-object v3, v0, v2

    const/16 v2, 0x3ba

    .line 1131
    const-string v3, "955. profile n.\u4fa7\u9762(\u50cf);\u8f6e\u5ed3,\u5916\u5f62;\u4eba\u7269\u7b80\u4ecb"

    aput-object v3, v0, v2

    const/16 v2, 0x3bb

    .line 1132
    const-string v3, "956. fragile a.\u6613\u788e\u7684\uff0c\u8106\u7684\uff0c\u6613\u635f\u574f\u7684\uff1b\u865a\u5f31\u7684\uff0c\u8106\u5f31\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3bc

    .line 1133
    const-string v3, "957. while conj.\u5f53\u2026\u7684\u65f6\u5019\uff1b\u800c\uff1b\u867d\u7136\uff1b\u5c3d\u7ba1 n.\u4e00\u4f1a\u513f"

    aput-object v3, v0, v2

    const/16 v2, 0x3bd

    .line 1134
    const-string v3, "958. worthwhile a.\u503c\u5f97(\u505a)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3be

    .line 1135
    const-string v3, "959. meanwhile n.\u5176\u65f6\uff0c\u5176\u95f4 ad.\u5f53\u65f6\uff0c\u4e0e\u6b64\u540c\u65f6"

    aput-object v3, v0, v2

    const/16 v2, 0x3bf

    .line 1136
    const-string v3, "960. mile n.\u82f1\u91cc\uff0c\u54e9\uff0c\u6d77\u91cc"

    aput-object v3, v0, v2

    const/16 v2, 0x3c0

    .line 1137
    const-string v3, "961. smile n.\u5fae\u7b11\uff0c\u7b11\u5bb9 vi.\u5fae\u7b11\uff0c\u9732\u51fa\u7b11\u5bb9"

    aput-object v3, v0, v2

    const/16 v2, 0x3c1

    .line 1138
    const-string v3, "962. juvenile n.\u9752\u5c11\u5e74,\u5c11\u5e74\u8bfb\u7269 a.\u9752\u5c11\u5e74\u7684, \u5e7c\u7a1a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3c2

    .line 1139
    const-string v3, "963. pile n.\u5806,\u5927\u91cf,\u5927\u6570\u76ee v.(up)\u5806,\u53e0,\u5806\u79ef"

    aput-object v3, v0, v2

    const/16 v2, 0x3c3

    .line 1140
    const-string v3, "964. compile vt.\u7f16\u8f91\uff0c\u7f16\u5236\uff0c\u641c\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x3c4

    .line 1141
    const-string v3, "965. missile n.\u5bfc\u5f39,\u53d1\u5c04\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x3c5

    .line 1142
    const-string v3, "966. tile n.\u74e6\u7247,\u74f7\u7816 vt.\u94fa\u74e6\u4e8e\uff0c\u8d34\u7816\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x3c6

    .line 1143
    const-string v3, "967. versatile a.\u901a\u7528\u7684;\u591a\u624d\u591a\u827a\u7684,\u591a\u65b9\u9762\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3c7

    .line 1144
    const-string v3, "968. reptile n.\u722c\u884c\u52a8\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x3c8

    .line 1145
    const-string v3, "969. fertile a.\u80a5\u6c83\u7684,\u5bcc\u9976\u7684;\u80fd\u7e41\u6b96\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3c9

    .line 1146
    const-string v3, "970. hostile a.\u654c\u5bf9\u7684,\u654c\u65b9\u7684,\u654c\u610f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3ca

    .line 1147
    const-string v3, "971. futile a.\u65e0\u6548\u7684\uff0c\u65e0\u7528\u7684\uff0c\u65e0\u5e0c\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3cb

    .line 1148
    const-string v3, "972. textile n.\u7eba\u7ec7\u54c1 a.\u7eba\u7ec7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3cc

    .line 1149
    const-string v3, "973. exile n.\u6d41\u653e\uff1b\u88ab\u6d41\u653e\u8005 vt.\u6d41\u653e\uff0c\u653e\u9010\uff0c\u628a\u2026\u5145\u519b"

    aput-object v3, v0, v2

    const/16 v2, 0x3cd

    .line 1150
    const-string v3, "974. tackle n.\u6ed1\u8f66;\u7528\u5177,\u5668\u68b0 v.\u5904\u7406,\u89e3\u51b3;\u62b1\u4f4f,\u6293\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x3ce

    .line 1151
    const-string v3, "975. ankle n.\u8db3\u8e1d\uff0c\u8e1d\u5173\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x3cf

    .line 1152
    const-string v3, "976. sprinkle n.\u6d12,\u55b7,\u6dcb"

    aput-object v3, v0, v2

    const/16 v2, 0x3d0

    .line 1153
    const-string v3, "977. wrinkle n.\u76b1\u7eb9 v.\u8d77\u76b1,\u76b1\u7709"

    aput-object v3, v0, v2

    const/16 v2, 0x3d1

    .line 1154
    const-string v3, "978. twinkle vi.(\u661f\u7b49)\u95ea\u70c1\uff0c(\u773c\u60c5)\u53d1\u4eae n.\u95ea\u70c1\uff0c\u95ea\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x3d2

    .line 1155
    const-string v3, "979. sparkle v.\u53d1\u706b\u82b1,\u95ea\u8000"

    aput-object v3, v0, v2

    const/16 v2, 0x3d3

    .line 1156
    const-string v3, "980. hole n.\u6d1e,\u5b54"

    aput-object v3, v0, v2

    const/16 v2, 0x3d4

    .line 1157
    const-string v3, "981. whole n.\u5168\u90e8 a.\u5168\u4f53\u7684\uff1b\u5168\u90e8\u7684\uff1b\u5b8c\u6574\u7684\uff1b\u65e0\u7f3a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3d5

    .line 1158
    const-string v3, "982. pole n.\u67f1,\u6746;\u5730\u6781,\u78c1\u6781,\u7535\u6781"

    aput-object v3, v0, v2

    const/16 v2, 0x3d6

    .line 1159
    const-string v3, "983. role n.\u89d2\u8272,\u4f5c\u7528,\u4efb\u52a1,\u804c\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0x3d7

    .line 1160
    const-string v3, "984. sole a.\u5355\u72ec\u7684,\u552f\u4e00\u7684 n.\u811a\u57ab,\u978b\u5e95"

    aput-object v3, v0, v2

    const/16 v2, 0x3d8

    .line 1161
    const-string v3, "985. console n.\u63a7\u5236\u53f0\uff0c\u4eea\u8868\u677f\uff1b\u843d\u5730\u67dc vt.\u5b89\u6170\uff0c\u6170\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0x3d9

    .line 1162
    const-string v3, "986. staple n.\u4e3b\u8981\u4ea7\u54c1\uff1b\u540d\u4ea7\uff1b\u7ea4\u7ef4\uff1b\u4e3b\u8981\u6210\u5206\uff0c\u4e3b\u98df"

    aput-object v3, v0, v2

    const/16 v2, 0x3da

    .line 1163
    const-string v3, "987. principle n.\u539f\u7406,\u539f\u5219;\u4e3b\u4e49,\u4fe1\u5ff5"

    aput-object v3, v0, v2

    const/16 v2, 0x3db

    .line 1164
    const-string v3, "988. triple n.\u4e09\u500d\u6570 a.\u4e09\u500d\u7684;\u4e09\u90e8\u5206\u6784\u6210\u7684v.\u4f7f\u6210\u4e09\u500d"

    aput-object v3, v0, v2

    const/16 v2, 0x3dc

    .line 1165
    const-string v3, "989. multiple a.\u591a\u6837\u7684,\u591a\u91cd\u7684 n.\u500d\u6570 v.\u6210\u500d\u589e\u52a0"

    aput-object v3, v0, v2

    const/16 v2, 0x3dd

    .line 1166
    const-string v3, "990. ample a.\u5145\u5206\u7684\uff0c\u5bcc\u88d5\u7684\uff1b\u5bbd\u655e\u7684\uff0c\u5bbd\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3de

    .line 1167
    const-string v3, "991. sample n.\u6837\u54c1,\u5b9e\u4f8b,\u6807\u672c,\u62bd\u6837\u68c0\u67e5 v.\u53d6\u6837,\u91c7\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x3df

    .line 1168
    const-string v3, "992. example n.\u4f8b\u5b50,\u5b9e\u4f8b;\u6a21\u8303,\u699c\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x3e0

    .line 1169
    const-string v3, "993. temple n.\u5e99\u5b87,\u795e\u6bbf,\u5bfa;\u592a\u9633\u7a74"

    aput-object v3, v0, v2

    const/16 v2, 0x3e1

    .line 1170
    const-string v3, "994. simple a.\u7b80\u5355\u7684;\u5355\u7eaf\u7684,\u76f4\u7387\u7684;\u8fdf\u949d\u7684,\u5934\u8111\u7b80\u5355\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3e2

    .line 1171
    const-string v3, "995. people n.\u4eba\u4eec\uff0c\u4eba\uff1b[the-]\u4eba\u6c11\uff1b\u4e00\u56fd\u4eba\u6c11\uff0c\u6c11\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x3e3

    .line 1172
    const-string v3, "996. apple n.\u82f9\u679c\uff0c\u82f9\u679c\u6811"

    aput-object v3, v0, v2

    const/16 v2, 0x3e4

    .line 1173
    const-string v3, "997. cripple n.\u8ddb\u5b50,\u6b8b\u75be\u4eba v.\u4f7f\u8ddb,\u4f7f\u6b8b\u75be"

    aput-object v3, v0, v2

    const/16 v2, 0x3e5

    .line 1174
    const-string v3, "998. purple a.\u7d2b\u7684 n.\u7d2b\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x3e6

    .line 1175
    const-string v3, "999. couple n.(\u4e00)\u5bf9,\u53cc;\u592b\u5987; v.\u8fde\u63a5,\u7ed3\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x3e7

    .line 1176
    const-string v3, "1000. isle n.\u5c0f\u5c9b(\u7528\u4e8e\u8bd7\u6b4c\u4e2d)"

    aput-object v3, v0, v2

    const/16 v2, 0x3e8

    .line 1177
    const-string v3, "1001. aisle n.(\u6559\u5802\u3001\u6559\u5ba4\u3001\u620f\u9662\u7b49\u91cc\u7684)\u8fc7\u9053\uff0c\u901a\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x3e9

    .line 1178
    const-string v3, "1002. subtle a.\u7cbe\u5de7\u7684,\u5de7\u5999\u7684;\u7ec6\u5fae\u7684,\u5fae\u5999\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3ea

    .line 1179
    const-string v3, "1003. title n.\u4e66\u540d,\u6807\u9898;\u5934\u8854,\u79f0\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x3eb

    .line 1180
    const-string v3, "1004. entitle v.\u7ed9\u4ee5\u6743\u5229(\u6216\u8d44\u683c);\u7ed9\u2026\u79f0\u53f7(\u9898\u540d);\u6388\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x3ec

    .line 1181
    const-string v3, "1005. gentle a.\u548c\u853c\u7684,\u6587\u96c5\u7684,\u6709\u793c\u8c8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3ed

    .line 1182
    const-string v3, "1006. startle v.\u60ca\u5413,\u4f7f\u5403\u60ca"

    aput-object v3, v0, v2

    const/16 v2, 0x3ee

    .line 1183
    const-string v3, "1007. "

    aput-object v3, v0, v2

    const/16 v2, 0x3ef

    .line 1184
    const-string v3, "1008. "

    aput-object v3, v0, v2

    const/16 v2, 0x3f0

    .line 1185
    const-string v3, "1009. castle n.\u57ce\u5821\uff1b(\u56fd\u9645\u8c61\u68cb\u4e2d\u7684)\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x3f1

    .line 1186
    const-string v3, "1010. whistle n.\u53e3\u54e8,\u6c7d\u7b1b;\u53e3\u54e8\u58f0,\u6c7d\u7b1b\u58f0 v.\u5439\u53e3\u54e8;\u9e23\u7b1b"

    aput-object v3, v0, v2

    const/16 v2, 0x3f2

    .line 1187
    const-string v3, "1011. battle n.\u6218\u5f79,\u6218\u6597;\u6597\u4e89 v.\u6218\u6597,\u6597\u4e89,\u640f\u6597"

    aput-object v3, v0, v2

    const/16 v2, 0x3f3

    .line 1188
    const-string v3, "1012. cattle n.\u725b;\u7272\u53e3,\u5bb6\u755c"

    aput-object v3, v0, v2

    const/16 v2, 0x3f4

    .line 1189
    const-string v3, "1013. kettle n.\u6c34\u58f6"

    aput-object v3, v0, v2

    const/16 v2, 0x3f5

    .line 1190
    const-string v3, "1014. settle v.\u5b89\u5b9a,\u5b89\u987f;\u505c\u606f;\u5b9a\u5c45;\u89e3\u51b3,\u8c03\u505c"

    aput-object v3, v0, v2

    const/16 v2, 0x3f6

    .line 1191
    const-string v3, "1015. little a.\u5c0f\uff0c\u5e7c\u5c0f\uff1b\u4e0d\u591a\u7684 ad./n.\u4e0d\u591a\uff0c\u51e0\u4e4e\u6ca1\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x3f7

    .line 1192
    const-string v3, "1016. brittle a.\u6613\u788e\u7684\uff1b\u8106\u5f31\u7684\uff1b\u51b7\u6de1\u7684\uff1b(\u58f0\u97f3)\u5c16\u5229\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x3f8

    .line 1193
    const-string v3, "1017. bottle n.\u74f6(\u5b50) v.\u88c5\u74f6"

    aput-object v3, v0, v2

    const/16 v2, 0x3f9

    .line 1194
    const-string v3, "1018. shuttle n.\u5f80\u8fd4\u6c7d\u8f66/\u5217\u8f66/\u98de\u673a\uff1b\u7a7f\u68ad v.\u5f80\u8fd4\u7a7f\u68ad"

    aput-object v3, v0, v2

    const/16 v2, 0x3fa

    .line 1195
    const-string v3, "1019. molecule n.\u5206\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x3fb

    .line 1196
    const-string v3, "1020. schedule n.\u65f6\u95f4\u8868,\u8fdb\u5ea6\u8868 v.\u5b89\u6392,\u9884\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x3fc

    .line 1197
    const-string v3, "1021. module n.\u7ec4\u4ef6\uff0c\u6a21\u5757\uff0c\u6a21\u4ef6\uff1b(\u822a\u5929\u5668\u7684)\u8231"

    aput-object v3, v0, v2

    const/16 v2, 0x3fd

    .line 1198
    const-string v3, "1022. rule v.\u7edf\u6cbb;\u652f\u914d;\u88c1\u5b9an.\u89c4\u7ae0,\u6761\u4f8b;\u4e60\u60ef;\u7edf\u6cbb"

    aput-object v3, v0, v2

    const/16 v2, 0x3fe

    .line 1199
    const-string v3, "1023. capsule n.\u80f6\u56ca;\u592a\u7a7a\u8231"

    aput-object v3, v0, v2

    const/16 v2, 0x3ff

    .line 1200
    const-string v3, "1024. style n.\u98ce\u683c,\u6587\u4f53;\u5f0f\u6837,\u65f6\u5f0f,\u7c7b\u578b"

    aput-object v3, v0, v2

    const/16 v2, 0x400

    .line 1201
    const-string v3, "1025. dazzle v.\u4f7f\u60ca\u5947,\u4f7f\u503e\u659c;\u8000(\u773c) n.\u8000\u773c\u7684\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x401

    .line 1202
    const-string v3, "1026. puzzle n.\u96be\u9898,\u8c1c,\u8ff7\u60d1 v.(\u4f7f)\u8ff7\u60d1,(\u4f7f)\u4e3a\u96be"

    aput-object v3, v0, v2

    const/16 v2, 0x402

    .line 1203
    const-string v3, "1027. me pron.[I \u7684\u5bbe\u683c]\u6211"

    aput-object v3, v0, v2

    const/16 v2, 0x403

    .line 1204
    const-string v3, "1028. madame n.(madam)\u592b\u4eba\uff0c\u592a\u592a\uff0c\u5973\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0x404

    .line 1205
    const-string v3, "1029. fame n.\u540d\u58f0;\u540d\u671b;\u4f20\u8bf4 vt\u4f7f\u51fa\u540d;\u4f20\u626c\u2026\u7684\u540d"

    aput-object v3, v0, v2

    const/16 v2, 0x405

    .line 1206
    const-string v3, "1030. game n.\u6e38\u620f\uff0c\u5a31\u4e50\uff1b\u6bd4\u8d5b\uff1b(pl.)\u8fd0\u52a8\u4f1a vi.\u8d4c\u535a"

    aput-object v3, v0, v2

    const/16 v2, 0x406

    .line 1207
    const-string v3, "1031. shame n.\u7f9e\u803b,\u803b\u8fb1;\u53ef\u803b\u7684\u4eba(\u6216\u4e8b\u7269) v.\u4f7f\u7f9e\u6127"

    aput-object v3, v0, v2

    const/16 v2, 0x407

    .line 1208
    const-string v3, "1032. lame a.\u8ddb\u7684,(\u8fa9\u89e3\u3001\u8bba\u636e\u7b49)\u65e0\u8bf4\u670d\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x408

    .line 1209
    const-string v3, "1033. blame v.\u8d23\u5907;\u602a,\u628a\u2026\u5f52\u548e\u4e8e n.\u8d23\u4efb,\u8fc7\u9519;\u8d23\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x409

    .line 1210
    const-string v3, "1034. flame n.\u706b\u7130,\u706b\u82d7;\u70ed\u60c5;\u5149\u8f89 v.\u53d1\u706b\u7130,\u71c3\u70e7"

    aput-object v3, v0, v2

    const/16 v2, 0x40a

    .line 1211
    const-string v3, "1035. name n.\u540d\u5b57(\u79f0/\u58f0/\u4e49) vt.\u7ed9\u2026\u53d6\u540d\uff1b\u5217\u4e3e\uff1b\u63d0\u540d"

    aput-object v3, v0, v2

    const/16 v2, 0x40b

    .line 1212
    const-string v3, "1036. nickname n.\u7ef0\u53f7\uff0c\u6d51\u540dvt.\u7ed9\u2026\u8d77\u7ef0\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x40c

    .line 1213
    const-string v3, "1037. surname n.\u59d3"

    aput-object v3, v0, v2

    const/16 v2, 0x40d

    .line 1214
    const-string v3, "1038. frame n.\u6846\u67b6;\u4f53\u683c;\u9aa8\u67b6;\u7ec4\u7ec7;\u673a\u6784 v.\u8bbe\u8ba1;\u5236\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x40e

    .line 1215
    const-string v3, "1039. same a.\u76f8\u540c\u7684 pron.\u76f8\u540c\u7684\u4eba(\u6216\u7269) ad.\u540c\u6837\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x40f

    .line 1216
    const-string v3, "1040. tame a.\u9a6f\u670d\u7684,\u6e29\u987a\u7684;\u6c89\u95f7\u7684,\u4e4f\u5473\u7684 vt.\u9a6f\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0x410

    .line 1217
    const-string v3, "1041. scheme n.\u8ba1\u5212,\u65b9\u6848;\u9634\u8c0b;\u914d\u7f6e v.\u8ba1\u5212,\u7b56\u5212;\u9634\u8c0b"

    aput-object v3, v0, v2

    const/16 v2, 0x411

    .line 1218
    const-string v3, "1042. theme n.\u9898\u76ee\uff0c\u4e3b\u9898\uff1b\u4e3b\u65cb\u5f8b\uff0c\u57fa\u8c03"

    aput-object v3, v0, v2

    const/16 v2, 0x412

    .line 1219
    const-string v3, "1043. supreme a.\u6781\u5ea6\u7684,\u6700\u91cd\u8981\u7684;\u81f3\u9ad8\u7684,\u6700\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x413

    .line 1220
    const-string v3, "1044. extreme a.\u672b\u7aef\u7684,\u5c3d\u5934\u7684;\u6781\u5ea6\u7684 n.\u6781\u7aef;\u6700\u5927\u7a0b\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x414

    .line 1221
    const-string v3, "1045. regime n.\u653f\u4f53,\u5236\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x415

    .line 1222
    const-string v3, "1046. crime n.\u7f6a\u884c,\u72af\u7f6a"

    aput-object v3, v0, v2

    const/16 v2, 0x416

    .line 1223
    const-string v3, "1047. prime a.\u9996\u8981\u7684;\u6700\u597d\u7684,\u7b2c\u4e00\u6d41\u7684 n.\u9752\u6625,\u5168\u76db\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x417

    .line 1224
    const-string v3, "1048. time n.\u65f6\u95f4\uff0c\u65f6\u523b\uff1b\u6b21\uff0c\u56de\uff1b\u65f6\u4ee3\uff0c\u65f6\u671f\uff1b\u500d\uff0c\u4e58"

    aput-object v3, v0, v2

    const/16 v2, 0x418

    .line 1225
    const-string v3, "1049. lifetime n.\u4e00\u751f,\u7ec8\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x419

    .line 1226
    const-string v3, "1050. sometime ad.\u5c06\u6765(\u6216\u8fc7\u53bb)\u67d0\u4e2a\u65f6\u5019a.\u4ee5\u524d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x41a

    .line 1227
    const-string v3, "1051. meantime n.(meanwhile)\u5176\u95f4,\u5176\u65f6 ad.\u540c\u65f6,\u5f53\u65f6"

    aput-object v3, v0, v2

    const/16 v2, 0x41b

    .line 1228
    const-string v3, "1052. overtime a.\u8d85\u65f6\u7684,\u52a0\u73ed\u7684 ad.\u52a0\u73ed"

    aput-object v3, v0, v2

    const/16 v2, 0x41c

    .line 1229
    const-string v3, "1053. pastime n.\u6d88\u9063,\u5a31\u4e50"

    aput-object v3, v0, v2

    const/16 v2, 0x41d

    .line 1230
    const-string v3, "1054. daytime n.\u767d\u5929,\u65e5\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x41e

    .line 1231
    const-string v3, "1055. gramme n.(gram)\u514b"

    aput-object v3, v0, v2

    const/16 v2, 0x41f

    .line 1232
    const-string v3, "1056. programme n.(program)\u8282\u76ee,\u8ba1\u5212,\u89c4\u5212,\u7a0b\u5e8f v.\u7f16\u7a0b\u5e8f"

    aput-object v3, v0, v2

    const/16 v2, 0x420

    .line 1233
    const-string v3, "1057. come v.\u6765\uff1b\u51fa\u73b0\u4e8e\uff0c\u4ea7\u751f\uff1b\u662f\uff0c\u6210\u4e3a\uff1b\u5f00\u59cb\uff0c\u7ec8\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x421

    .line 1234
    const-string v3, "1058. become vi.\u53d8\u6210\uff0c\u5f00\u59cb\u53d8\u5f97vt.\u9002\u5408\uff0c\u540c\u2026\u76f8\u79f0"

    aput-object v3, v0, v2

    const/16 v2, 0x422

    .line 1235
    const-string v3, "1059. welcome int.\u6b22\u8fce a.\u53d7\u6b22\u8fce\u7684 vt./n.\u6b22\u8fce\uff1b\u8fce\u63a5"

    aput-object v3, v0, v2

    const/16 v2, 0x423

    .line 1236
    const-string v3, "1060. income n.\u6536\u5165,\u6536\u76ca,\u6240\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x424

    .line 1237
    const-string v3, "1061. overcome v.\u6218\u80dc,\u514b\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0x425

    .line 1238
    const-string v3, "1062. outcome n.\u7ed3\u679c,\u6210\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0x426

    .line 1239
    const-string v3, "1063. dome n.\u5706\u5c4b\u9876"

    aput-object v3, v0, v2

    const/16 v2, 0x427

    .line 1240
    const-string v3, "1064. home ad.\u56de\u5bb6,\u5728\u5bb6 n.\u5bb6\uff1b\u5bb6\u4e61a.\u5bb6\u5ead\u7684\uff1b\u5bb6\u4e61\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x428

    .line 1241
    const-string v3, "1065. syndrome n.\u7efc\u5408\u75c5\u5f81\uff1b\u5e76\u5b58\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x429

    .line 1242
    const-string v3, "1066. some a.\u51e0\u4e2a\uff1b\u4e00\u4e9b\uff1b\u6709\u4e9b\uff1b\u67d0(\u4eba\u6216\u7269) pron.\u4e00\u4e9b"

    aput-object v3, v0, v2

    const/16 v2, 0x42a

    .line 1243
    const-string v3, "1067. handsome a.\u6f02\u4eae\u7684,\u82f1\u4fca\u7684;\u6177\u6168\u7684,\u6570\u91cf\u53ef\u89c2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x42b

    .line 1244
    const-string v3, "1068. troublesome a.\u4ee4\u4eba\u70e6\u607c\u7684,\u8ba8\u538c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x42c

    .line 1245
    const-string v3, "1069. wholesome a.\u536b\u751f\u7684;\u6709\u76ca\u7684;\u5065\u5eb7\u7684,\u6709\u76ca\u5065\u5eb7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x42d

    .line 1246
    const-string v3, "1070. tiresome a.\u4f7f\u4eba\u538c\u5026\u7684,\u8ba8\u538c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x42e

    .line 1247
    const-string v3, "1071. fume n.(\u6d53\u70c8\u6216\u96be\u95fb\u7684\uff09\u70df\uff0c\u6c14\uff0c\u6c7d"

    aput-object v3, v0, v2

    const/16 v2, 0x42f

    .line 1248
    const-string v3, "1072. perfume n.\u9999\u5473,\u82b3\u9999;\u9999\u6599 v.\u4f7f\u53d1\u9999,\u6d12\u9999\u6c34\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x430

    .line 1249
    const-string v3, "1073. volume n.\u5bb9\u79ef,\u4f53\u79ef;\u5377,\u518c;\u97f3\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x431

    .line 1250
    const-string v3, "1074. resume n.\u4e2a\u4eba\u7b80\u5386 v.\u518d\u7ee7\u7eed,\u91cd\u65b0\u5f00\u59cb;\u518d\u7528;\u6062\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0x432

    .line 1251
    const-string v3, "1075. presume v.\u5047\u5b9a,\u5047\u8bbe,\u8ba4\u4e3a,\u63e3\u6d4b,\u6ee5\u7528,\u64c5\u81ea\u884c\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x433

    .line 1252
    const-string v3, "1076. consume vt.\u6d88\u8017\uff1b\u5403\u5b8c\uff0c\u559d\u5149\uff1b(with)\u4f7f\u7740\u8ff7\uff1b\u70e7\u6bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x434

    .line 1253
    const-string v3, "1077. assume vt.\u5047\u88c5\uff1b\u5047\u5b9a\uff0c\u8bbe\u60f3\uff1b\u627f\u62c5\uff1b\u5448\u73b0\uff0c\u91c7\u53d6"

    aput-object v3, v0, v2

    const/16 v2, 0x435

    .line 1254
    const-string v3, "1078. costume n.(\u6d41\u884c\u7684)\u670d\u9970\uff1b\u620f\u88c5\uff0c(\u7279\u5b9a\u573a\u5408\u7684)\u5957\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x436

    .line 1255
    const-string v3, "1079. hurricane n.\u98d3\u98ce"

    aput-object v3, v0, v2

    const/16 v2, 0x437

    .line 1256
    const-string v3, "1080. lane n.\u5c0f\u8def,\u5c0f\u5df7,\u884c\u8f66\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x438

    .line 1257
    const-string v3, "1081. plane n.\u98de\u673a;\u5e73\u9762,\u6c34\u5e73\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x439

    .line 1258
    const-string v3, "1082. aeroplane n.(airplane)(\u82f1)\u98de\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x43a

    .line 1259
    const-string v3, "1083. crane n.\u8d77\u91cd\u673a,\u9e64"

    aput-object v3, v0, v2

    const/16 v2, 0x43b

    .line 1260
    const-string v3, "1084. sane a.\u5fc3\u667a\u5065\u5168\u7684,\u795e\u5fd7\u6e05\u9192\u7684,\u660e\u667a\u7684,\u7a33\u5065\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x43c

    .line 1261
    const-string v3, "1085. scene n.\u666f\u8272,\u666f\u8c61,\u821e\u53f0;(\u620f)\u4e00\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x43d

    .line 1262
    const-string v3, "1086. gene n.\u57fa\u56e0"

    aput-object v3, v0, v2

    const/16 v2, 0x43e

    .line 1263
    const-string v3, "1087. intervene v.(in)\u5e72\u6d89,\u5e72\u9884;\u63d2\u5165,\u4ecb\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x43f

    .line 1264
    const-string v3, "1088. champagne n.\u9999\u69df\u9152\uff1b\u5fae\u9ec4\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x440

    .line 1265
    const-string v3, "1089. cocaine n.\u53ef\u5361\u56e0\uff0c\u53e4\u67ef\u78b1\uff08\u7528\u4f5c\u5c40\u90e8\u9ebb\u9189\u5242\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x441

    .line 1266
    const-string v3, "1090. combine v.\u8054\u5408\uff1b\u7ed3\u5408\uff1b\u5316\u5408 n.\u96c6\u56e2\uff1b\u8054\u5408\u4f01\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0x442

    .line 1267
    const-string v3, "1091. turbine n.\u6c7d\u8f6e\u673a,\u6da1\u8f6e\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x443

    .line 1268
    const-string v3, "1092. medicine n.\u5185\u670d\u836f,\u533b\u836f;\u533b\u672f;\u533b\u5b66,\u5185\u79d1\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x444

    .line 1269
    const-string v3, "1093. dine v.\u5403\u996d,\u8fdb\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x445

    .line 1270
    const-string v3, "1094. fine a.\u6674\u6717\u7684,\u7f8e\u597d\u7684,\u7ec6\u81f4\u7684 v./n.\u7f5a\u91d1,\u7f5a\u6b3e"

    aput-object v3, v0, v2

    const/16 v2, 0x446

    .line 1271
    const-string v3, "1095. define v.\u7ed9\u2026\u4e0b\u5b9a\u4e49;\u9610\u8ff0;\u9610\u91ca;\u9650\u5b9a,\u89c4\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x447

    .line 1272
    const-string v3, "1096. refine v.\u7cbe\u70bc,\u7cbe\u5236,\u63d0\u7eaf;\u4f7f\u6587\u96c5,\u4f7f\u9ad8\u5c1a"

    aput-object v3, v0, v2

    const/16 v2, 0x448

    .line 1273
    const-string v3, "1097. confine vt.\u9650\u5236\uff1b\u4f7f\u4e0d\u5916\u51fa\uff0c\u7981\u95edn.[pl.]\u754c\u9650\uff0c\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x449

    .line 1274
    const-string v3, "1098. imagine v.\u60f3\u8c61,\u8bbe\u60f3,\u6599\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0x44a

    .line 1275
    const-string v3, "1099. engine n.\u53d1\u52a8\u673a,\u5f15\u64ce;\u706b\u8f66\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0x44b

    .line 1276
    const-string v3, "1100. machine n.\u673a\u5668,\u673a\u68b0 v.\u7528\u673a\u5668\u52a0\u5de5"

    aput-object v3, v0, v2

    const/16 v2, 0x44c

    .line 1277
    const-string v3, "1101. shine v.\u7167\u8000,\u53d1\u5149;\u64e6\u4eae n.\u5149\u6cfd,\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x44d

    .line 1278
    const-string v3, "1102. sunshine n.\u65e5\u5149,\u65e5\u7167\uff1b\u6674\u5929\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x44e

    .line 1279
    const-string v3, "1103. line n.\u7ebf;\u8def\u7ebf,\u822a\u7ebf;\u6392;\u7ebf\u8def;\u754c\u7ebf v.\u6392\u961f;\u52a0\u886c"

    aput-object v3, v0, v2

    const/16 v2, 0x44f

    .line 1280
    const-string v3, "1104. decline v.\u4e0b\u964d,\u8870\u843d;\u62d2\u7edd n.\u4e0b\u964d;\u659c\u9762,\u503e\u659c,\u8870\u843d"

    aput-object v3, v0, v2

    const/16 v2, 0x450

    .line 1281
    const-string v3, "1105. incline v.(\u4f7f)\u503e\u659c;(\u4f7f)\u503e\u5411\u4e8e n.\u659c\u5761,\u659c\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x451

    .line 1282
    const-string v3, "1106. deadline n.\u6700\u540e\u671f\u9650"

    aput-object v3, v0, v2

    const/16 v2, 0x452

    .line 1283
    const-string v3, "1107. headline n.\u5927\u5b57\u6807\u9898,\u65b0\u95fb\u6807\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0x453

    .line 1284
    const-string v3, "1108. guideline n.\u6307\u5bfc\u65b9\u9488\uff0c\u6307\u5bfc\u539f\u5219\uff0c\u51c6\u5219\uff0c\u6807\u51c6"

    aput-object v3, v0, v2

    const/16 v2, 0x454

    .line 1285
    const-string v3, "1109. streamline a.\u6d41\u7ebf\u578b\u7684 vt.\u4f7f\u6210\u6d41\u7ebf\u578b\uff1b\u4f7f\u5408\u7406\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x455

    .line 1286
    const-string v3, "1110. gasoline n.(gasolene)\u6c7d\u6cb9"

    aput-object v3, v0, v2

    const/16 v2, 0x456

    .line 1287
    const-string v3, "1111. discipline n.\u7eaa\u5f8b,\u5b66\u79d1"

    aput-object v3, v0, v2

    const/16 v2, 0x457

    .line 1288
    const-string v3, "1112. underline vt.\u5728\u2026\u4e0b\u5212\u7ebf;\u5f3a\u8c03"

    aput-object v3, v0, v2

    const/16 v2, 0x458

    .line 1289
    const-string v3, "1113. airline n.(\u98de\u673a)\u822a\u7ebf  a.(\u98de\u673a)\u822a\u7ebf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x459

    .line 1290
    const-string v3, "1114. outline n.\u8f6e\u5ed3,\u7565\u56fe;\u5927\u7eb2,\u6897\u6982 v.\u6982\u8ff0,\u7565\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x45a

    .line 1291
    const-string v3, "1115. masculine a.\u7537\u6027\u7684\uff0c\u4f3c\u7537\u6027\u7684\uff1b\uff3b\u8bed\u6cd5\uff3d\u9633\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x45b

    .line 1292
    const-string v3, "1116. mine pron.(I\u7684\u7269\u4e3b\u4ee3\u8bcd)\u6211\u7684(\u4e1c\u897f)n.\u77ff v.\u91c7\u77ff"

    aput-object v3, v0, v2

    const/16 v2, 0x45c

    .line 1293
    const-string v3, "1117. famine n.\u9965\u8352,\u9965\u9991"

    aput-object v3, v0, v2

    const/16 v2, 0x45d

    .line 1294
    const-string v3, "1118. examine v.\u68c0\u67e5,\u8c03\u67e5;\u5bf9\u2026\u8fdb\u884c\u8003\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x45e

    .line 1295
    const-string v3, "1119. undermine v.\u6697\u4e2d\u7834\u574f,\u9010\u6e10\u524a\u5f31;\u4fb5\u8680\u2026\u7684\u57fa\u7840"

    aput-object v3, v0, v2

    const/16 v2, 0x45f

    .line 1296
    const-string v3, "1120. determine v.\u51b3\u5fc3,\u51b3\u5b9a;\u786e\u5b9a,\u9650\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x460

    .line 1297
    const-string v3, "1121. nine num.\u4e5d pron./ad.\u4e5d(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x461

    .line 1298
    const-string v3, "1122. feminine a.\u5973\u6027\u7684;\u5a07\u67d4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x462

    .line 1299
    const-string v3, "1123. heroine n.\u5973\u82f1\u96c4;\u5973\u4e3b\u89d2"

    aput-object v3, v0, v2

    const/16 v2, 0x463

    .line 1300
    const-string v3, "1124. pine n.\u677e\u6811"

    aput-object v3, v0, v2

    const/16 v2, 0x464

    .line 1301
    const-string v3, "1125. spine n.\u810a\u67f1\uff0c\u810a\u690e\uff1b(\u52a8\u690d\u7269\u7684)\u523a\uff1b\u4e66\u810a"

    aput-object v3, v0, v2

    const/16 v2, 0x465

    .line 1302
    const-string v3, "1126. marine a.\u6d77\u7684,\u6d77\u751f\u7684;\u8239\u8236\u7684,\u822a\u6d77\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x466

    .line 1303
    const-string v3, "1127. submarine n.\u6f5c\u6c34\u8247 a.\u6c34\u5e95\u7684,\u6d77\u5e95\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x467

    .line 1304
    const-string v3, "1128. routine n.\u4f8b\u884c\u516c\u4e8b,\u5e38\u89c4 a.\u5e38\u89c4\u7684,\u4f8b\u884c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x468

    .line 1305
    const-string v3, "1129. genuine a.\u771f\u6b63\u7684,\u540d\u526f\u5176\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x469

    .line 1306
    const-string v3, "1130. divine a.\u795e\u7684\uff0c\u795e\u6388\u7684\uff0c\u5929\u8d50\u7684\uff1b\u6781\u597d\u7684\uff0c\u6781\u7f8e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x46a

    .line 1307
    const-string v3, "1131. wine n.\u8461\u8404\u9152,\u679c\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0x46b

    .line 1308
    const-string v3, "1132. magazine n.\u6742\u5fd7,\u671f\u520a"

    aput-object v3, v0, v2

    const/16 v2, 0x46c

    .line 1309
    const-string v3, "1133. one num.\u4e00 pron.\u4e00\u4e2a(\u53ea)(\u8868\u793a\u4ee3\u66ff\u53ef\u6570\u7684\u4e1c\u897f)"

    aput-object v3, v0, v2

    const/16 v2, 0x46d

    .line 1310
    const-string v3, "1134. bone n.\u9aa8(\u9abc)"

    aput-object v3, v0, v2

    const/16 v2, 0x46e

    .line 1311
    const-string v3, "1135. someone pron.\u67d0\u4eba(=somebody)"

    aput-object v3, v0, v2

    const/16 v2, 0x46f

    .line 1312
    const-string v3, "1136. phone n.(telephone)\u7535\u8bdd,\u7535\u8bdd\u673a,\u8033\u673a v.\u6253\u7535\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x470

    .line 1313
    const-string v3, "1137. telephone n.\u7535\u8bdd,\u7535\u8bdd\u673a v.\u6253\u7535\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x471

    .line 1314
    const-string v3, "1138. microphone n.\u8bdd\u7b52,\u6269\u97f3\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x472

    .line 1315
    const-string v3, "1139. alone a.\u5355\u72ec\u7684\uff0c\u5b64\u72ec\u7684 ad.\u5355\u72ec\u5730\uff0c\u72ec\u81ea\u5730\uff1b\u4ec5\u4ec5"

    aput-object v3, v0, v2

    const/16 v2, 0x473

    .line 1316
    const-string v3, "1140. clone n.\u65e0\u6027\u7e41\u6b96\uff0c\u514b\u9686\uff1b\u590d\u5236\u54c1v.\u514b\u9686"

    aput-object v3, v0, v2

    const/16 v2, 0x474

    .line 1317
    const-string v3, "1141. none pron.\u6ca1\u6709\u4efb\u4f55\u4eba(\u4e1c\u897f)\uff1b\u90fd\u4e0d ad.\u4e00\u70b9\u4e5f\u4e0d"

    aput-object v3, v0, v2

    const/16 v2, 0x475

    .line 1318
    const-string v3, "1142. postpone v.\u63a8\u8fdf,\u5ef6\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x476

    .line 1319
    const-string v3, "1143. throne n.\u5fa1\u5ea7\uff0c\u5b9d\u5ea7\uff1b\u738b\u4f4d\uff0c\u738b\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x477

    .line 1320
    const-string v3, "1144. prone a.\u503e\u5411\u4e8e,\u4fef\u4f0f\u7684,\u503e\u659c\u7684,\u9661\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x478

    .line 1321
    const-string v3, "1145. tone n.\u97f3\u8c03,\u97f3\u8272;\u98ce\u6c14,\u6c14\u6c1b;\u8154\u8c03,\u8bed\u6c14;\u8272\u8c03"

    aput-object v3, v0, v2

    const/16 v2, 0x479

    .line 1322
    const-string v3, "1146. stone n.\u77f3\uff0c\u77f3\u5934\uff1b\u5ca9\u77f3\uff0c\u77ff\u77f3\uff1b(\u6c34\u679c\u7684)\u6838\u3001\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x47a

    .line 1323
    const-string v3, "1147. anyone pron.(\u7528\u4e8e\u7591\u95ee\u53e5\uff0c\u5426\u5b9a\u5f0f)\u4efb\u4f55\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x47b

    .line 1324
    const-string v3, "1148. everyone pron.(everybody)\u6bcf\u4eba\uff0c\u4eba\u4eba\uff0c\u5404\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x47c

    .line 1325
    const-string v3, "1149. zone n.\u5730\u533a,\u533a\u57df v.\u5206\u533a,\u5212\u5206\u5730\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x47d

    .line 1326
    const-string v3, "1150. ozone n.\u81ed\u6c27\uff1b(\u6d77\u5cb8\u7b49\u7684)\u65b0\u9c9c\u7a7a\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x47e

    .line 1327
    const-string v3, "1151. June n.\u516d\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x47f

    .line 1328
    const-string v3, "1152. immune a.\u514d\u75ab\u7684,\u6709\u514d\u75ab\u529b\u7684;\u6709\u53d7\u5f71\u54cd\u7684;\u8c41\u514d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x480

    .line 1329
    const-string v3, "1153. tune n.\u8c03\u5b50,\u66f2\u8c03;\u548c\u8c10,\u534f\u8c03 vt.\u8c03\u97f3,\u8c03\u8282,\u8c03\u6574"

    aput-object v3, v0, v2

    const/16 v2, 0x481

    .line 1330
    const-string v3, "1154. fortune n.\u8fd0\u6c14;\u547d\u8fd0;\u8d22\u4ea7;\u8d22\u5bcc"

    aput-object v3, v0, v2

    const/16 v2, 0x482

    .line 1331
    const-string v3, "1155. misfortune n.\u4e0d\u5e78,\u707e\u7978,\u707e\u96be"

    aput-object v3, v0, v2

    const/16 v2, 0x483

    .line 1332
    const-string v3, "1156. shoe n.\u978b"

    aput-object v3, v0, v2

    const/16 v2, 0x484

    .line 1333
    const-string v3, "1157. canoe n.\u72ec\u6728\u821f,\u5c0f\u6e38\u8247"

    aput-object v3, v0, v2

    const/16 v2, 0x485

    .line 1334
    const-string v3, "1158. toe n.\u811a\u8dbe,\u8db3\u5c16"

    aput-object v3, v0, v2

    const/16 v2, 0x486

    .line 1335
    const-string v3, "1159. cape n.\u6d77\u89d2\uff0c\u5cac\uff1b\u62ab\u80a9\uff0c\u77ed\u62ab\u98ce"

    aput-object v3, v0, v2

    const/16 v2, 0x487

    .line 1336
    const-string v3, "1160. escape n.\u9003\u8dd1,\u9003\u8131 v.\u9003\u8dd1;\u907f\u5f00,\u907f\u514d"

    aput-object v3, v0, v2

    const/16 v2, 0x488

    .line 1337
    const-string v3, "1161. shape n.\u5f62\u72b6,\u5916\u5f62;\u60c5\u51b5,\u72b6\u6001;\u79cd\u7c7bv.\u6210\u578b,\u5851\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x489

    .line 1338
    const-string v3, "1162. rape n./vt.\u63a0\u593a,\u8e42\u8e8f,\u5f3a\u5978"

    aput-object v3, v0, v2

    const/16 v2, 0x48a

    .line 1339
    const-string v3, "1163. scrape v.\u522e(\u6389),\u64e6\u8fc7,\u52c9\u5f3a\u901a\u8fc7 n.\u522e,\u64e6\u75d5,\u522e\u64e6\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x48b

    .line 1340
    const-string v3, "1164. grape n.\u8461\u8404"

    aput-object v3, v0, v2

    const/16 v2, 0x48c

    .line 1341
    const-string v3, "1165. tape n.\u5e26(\u5b50);\u5f55\u97f3\u5e26,\u78c1\u5e26 v.\u5f55\u97f3;\u7cfb,\u6346"

    aput-object v3, v0, v2

    const/16 v2, 0x48d

    .line 1342
    const-string v3, "1166. recipe n.\u70f9\u996a\u6cd5,\u98df\u8c31;\u8bc0\u7a8d,\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x48e

    .line 1343
    const-string v3, "1167. pipe n.\u7ba1\u5b50,\u5bfc\u7ba1;\u70df\u6597;\u7b1b"

    aput-object v3, v0, v2

    const/16 v2, 0x48f

    .line 1344
    const-string v3, "1168. ripe a.\u719f\u7684,\u6210\u719f\u7684;(for)\u65f6\u673a\u6210\u719f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x490

    .line 1345
    const-string v3, "1169. stripe n.\u957f\u6761\uff0c\u6761\u7eb9\uff1b\u519b\u670d\u4e0a\u8868\u793a\u519b\u9636\u7684\u81c2\u7ae0\u6761\u7eb9"

    aput-object v3, v0, v2

    const/16 v2, 0x491

    .line 1346
    const-string v3, "1170. wipe v./n.\u64e6,\u63e9,\u62b9"

    aput-object v3, v0, v2

    const/16 v2, 0x492

    .line 1347
    const-string v3, "1171. cope v.(with)\u7ade\u4e89,\u5bf9\u6297;(with)\u5bf9\u4ed8,\u59a5\u5584\u5904\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x493

    .line 1348
    const-string v3, "1172. scope n.(\u6d3b\u52a8)\u8303\u56f4;\u673a\u4f1a,\u4f59\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x494

    .line 1349
    const-string v3, "1173. telescope n.\u671b\u8fdc\u955c v.\u7f29\u77ed\uff0c\u538b\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x495

    .line 1350
    const-string v3, "1174. microscope n.\u663e\u5fae\u955c"

    aput-object v3, v0, v2

    const/16 v2, 0x496

    .line 1351
    const-string v3, "1175. hope n.\u5e0c\u671b\uff0c\u671f\u671b\uff1b\u5e0c\u671b\u7684\u4eba\u6216\u4e8b v.\u5e0c\u671b\uff0c\u671f\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x497

    .line 1352
    const-string v3, "1176. envelope n.\u4fe1\u5c01,\u4fe1\u76ae;\u5c01\u5957"

    aput-object v3, v0, v2

    const/16 v2, 0x498

    .line 1353
    const-string v3, "1177. slope n.\u659c\u5761,\u659c\u9762;\u503e\u659c,\u659c\u5ea6 v.(\u4f7f)\u503e\u659c"

    aput-object v3, v0, v2

    const/16 v2, 0x499

    .line 1354
    const-string v3, "1178. pope n.\u7f57\u9a6c\u6559\u7687,\u4e3b\u6559,\u5927\u817f\u4e0a\u8981\u5bb3\u90e8\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x49a

    .line 1355
    const-string v3, "1179. rope n.\u7ef3,\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x49b

    .line 1356
    const-string v3, "1180. grope n./v.\u6478\u7d22,\u63a2\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x49c

    .line 1357
    const-string v3, "1181. type n.\u578b\u5f0f\uff0c\u7c7b\u578b\uff1b\u5370\u5237\u5b57\u4f53\uff1b\u6d3b/\u94c5\u5b57 v.\u6253\u5b57"

    aput-object v3, v0, v2

    const/16 v2, 0x49d

    .line 1358
    const-string v3, "1182. stereotype n.\u9648\u89c4\uff0c\u8001\u5957\uff0c\u6a21\u5f0f\u5316 vt.\u4f7f\u5b9a\u578b\uff0c\u4f7f\u6a21\u5f0f\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x49e

    .line 1359
    const-string v3, "1183. prototype n.\u539f\u578b\uff1b\u5178\u578b\uff0c\u8303\u4f8b"

    aput-object v3, v0, v2

    const/16 v2, 0x49f

    .line 1360
    const-string v3, "1184. bare a.\u8d64\u88f8\u7684,\u7a7a\u7684;\u7a00\u5c11\u7684,\u4ec5\u6709\u7684 v.\u9732\u51fa,\u66b4\u9732"

    aput-object v3, v0, v2

    const/16 v2, 0x4a0

    .line 1361
    const-string v3, "1185. care n.\u5c0f\u5fc3;\u5173\u6000,\u7167\u6599 v.(about)\u5173\u5fc3,\u4ecb\u610f,\u8ba1\u8f83"

    aput-object v3, v0, v2

    const/16 v2, 0x4a1

    .line 1362
    const-string v3, "1186. scare n.\u60ca\u6050,\u6050\u614cv.\u60ca\u5413,\u53d7\u60ca"

    aput-object v3, v0, v2

    const/16 v2, 0x4a2

    .line 1363
    const-string v3, "1187. dare v.\u6562,\u80c6\u6562"

    aput-object v3, v0, v2

    const/16 v2, 0x4a3

    .line 1364
    const-string v3, "1188. fare n.\u8f66\u8d39,\u8239\u8d39;\u4f19\u98df;\u4e58\u5ba2 v.\u8fc7\u6d3b;\u8fdb\u5c55;\u7ecf\u8425"

    aput-object v3, v0, v2

    const/16 v2, 0x4a4

    .line 1365
    const-string v3, "1189. welfare n.\u798f\u5229\uff1b\u5e78\u798f\uff1b\u798f\u5229\u4e8b\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0x4a5

    .line 1366
    const-string v3, "1190. warfare n.\u6218\u4e89(\u72b6\u6001);\u6597\u4e89;\u51b2\u7a81"

    aput-object v3, v0, v2

    const/16 v2, 0x4a6

    .line 1367
    const-string v3, "1191. share v.(with)\u5206\u914d,\u5171\u7528;\u5206\u62c5n.\u4e00\u4efd,\u4efd\u989d;\u80a1\u4efd"

    aput-object v3, v0, v2

    const/16 v2, 0x4a7

    .line 1368
    const-string v3, "1192. declare v.\u5ba3\u5e03,\u5ba3\u544a,\u58f0\u660e;\u65ad\u8a00,\u5ba3\u79f0"

    aput-object v3, v0, v2

    const/16 v2, 0x4a8

    .line 1369
    const-string v3, "1193. flare v./n.\u95ea\u8000,\u95ea\u70c1"

    aput-object v3, v0, v2

    const/16 v2, 0x4a9

    .line 1370
    const-string v3, "1194. glare vi.\u6012\u76ee\u800c\u89c6;\u53d1\u5c04\u5f3a\u5149 n.\u5f3a\u5149;\u6012\u89c6;\u70ab\u8000"

    aput-object v3, v0, v2

    const/16 v2, 0x4aa

    .line 1371
    const-string v3, "1195. nightmare n.\u6076\u68a6\uff1b\u53ef\u6015\u7684\u4e8b\u7269\uff0c\u65e0\u6cd5\u6446\u8131\u7684\u6050\u60e7"

    aput-object v3, v0, v2

    const/16 v2, 0x4ab

    .line 1372
    const-string v3, "1196. prepare v.\u51c6\u5907,\u9884\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x4ac

    .line 1373
    const-string v3, "1197. compare vt.(to\uff0cwith)\u6bd4\u8f83\uff1b(to)\u628a\u2026\u6bd4\u4f5cvi.\u76f8\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0x4ad

    .line 1374
    const-string v3, "1198. spare a.\u591a\u4f59\u7684,\u5907\u7528\u7684 v.\u8282\u7ea6,\u8282\u7701;\u62bd\u51fa(\u65f6\u95f4)"

    aput-object v3, v0, v2

    const/16 v2, 0x4ae

    .line 1375
    const-string v3, "1199. rare a.\u7a00\u6709\u7684,\u96be\u5f97\u7684,\u73cd\u5947\u7684;\u7a00\u8584\u7684,\u7a00\u758f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4af

    .line 1376
    const-string v3, "1200. stare v.(at)\u76ef,\u51dd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x4b0

    .line 1377
    const-string v3, "1201. square n.\u6b63\u65b9\u5f62;\u5e7f\u573aa.\u6b63\u65b9\u5f62\u7684v.\u4f7f\u6210\u65b9\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x4b1

    .line 1378
    const-string v3, "1202. aware a.\u77e5\u9053\u7684\uff0c\u610f\u8bc6\u5230\u7684\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x4b2

    .line 1379
    const-string v3, "1203. hardware n.\u4e94\u91d1,\u91d1\u5c5e\u5236\u54c1;\u786c\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x4b3

    .line 1380
    const-string v3, "1204. beware v.\u5f53\u5fc3,\u8c28\u9632"

    aput-object v3, v0, v2

    const/16 v2, 0x4b4

    .line 1381
    const-string v3, "1205. software n.\u8f6f\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x4b5

    .line 1382
    const-string v3, "1206. acre n.\u82f1\u4ea9\uff1b\u7530\u5730\uff1b\u5730\u4ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x4b6

    .line 1383
    const-string v3, "1207. massacre vt.\u6b8b\u6740,\u96c6\u4f53\u5c60\u6740 n.\u6b8b\u6740,\u5927\u5c60\u6740"

    aput-object v3, v0, v2

    const/16 v2, 0x4b7

    .line 1384
    const-string v3, "1208. sincere a.\u8bda\u631a\u7684,\u771f\u5b9e\u7684,\u8bda\u6073\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4b8

    .line 1385
    const-string v3, "1209. interfere v.(in)\u5e72\u6d89,\u5e72\u9884;(with)\u59a8\u788d,\u6253\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x4b9

    .line 1386
    const-string v3, "1210. here ad.\u5728(\u5230\uff0c\u5411)\u8fd9\u91cc\uff1b\u8fd9\u65f6\uff1b\u5728\u8fd9\u4e00\u70b9\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x4ba

    .line 1387
    const-string v3, "1211. adhere vi.(to)\u7c98\u7740\uff1b\u575a\u6301\uff0c\u9075\u5b88\uff1b\u4f9d\u9644\uff0c\u8ffd\u968f"

    aput-object v3, v0, v2

    const/16 v2, 0x4bb

    .line 1388
    const-string v3, "1212. sphere n.\u7403,\u7403\u4f53;\u8303\u56f4,\u9886\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0x4bc

    .line 1389
    const-string v3, "1213. hemisphere n.\u534a\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0x4bd

    .line 1390
    const-string v3, "1214. atmosphere n.\u5927\u6c14(\u5c42)\uff1b\u7a7a\u6c14\uff1b\u6c14\u6c1b\uff0c\u73af\u5883\uff1b\u5927\u6c14\u538b"

    aput-object v3, v0, v2

    const/16 v2, 0x4be

    .line 1391
    const-string v3, "1215. there ad.\u5728\u90a3\u513f\uff1b\u5f80\u90a3\u513f\uff1b[\u4f5c\u5f15\u5bfc\u8bcd\u8868\u793a\u5b58\u5728]"

    aput-object v3, v0, v2

    const/16 v2, 0x4bf

    .line 1392
    const-string v3, "1216. where ad.\u5728\u54ea/\u90a3\u91cc conj./pron.\u54ea\u91cc conj.\u7136\u800c"

    aput-object v3, v0, v2

    const/16 v2, 0x4c0

    .line 1393
    const-string v3, "1217. somewhere ad.\u67d0\u5730\uff0c\u5728\u67d0\u5904\uff1b\u5728\u9644\u8fd1\uff0c\u524d\u540e\uff0c\u5927\u7ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x4c1

    .line 1394
    const-string v3, "1218. elsewhere ad.\u5728\u522b\u5904,\u5411\u522b\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x4c2

    .line 1395
    const-string v3, "1219. nowhere ad.\u4efb\u4f55\u5730\u65b9\u90fd\u4e0d,\u6ca1\u6709\u5730\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0x4c3

    .line 1396
    const-string v3, "1220. anywhere ad.\u65e0\u8bba\u54ea\u91cc\uff1b(\u7528\u4e8e\u5426\u5b9a\u3001\u7591\u95ee\u7b49)\u4efb\u4f55\u5730\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0x4c4

    .line 1397
    const-string v3, "1221. everywhere ad.\u5230\u5904\uff0c\u5404\u5904\uff0c\u65e0\u8bba\u4f55\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x4c5

    .line 1398
    const-string v3, "1222. mere a.\u7eaf\u7cb9\u7684;\u4ec5\u4ec5,\u53ea\u4e0d\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x4c6

    .line 1399
    const-string v3, "1223. severe a.\u4e25\u5389\u7684;\u5267\u70c8\u7684,\u4e25\u91cd\u7684,\u4e25\u5cfb\u7684,\u8270\u96be\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4c7

    .line 1400
    const-string v3, "1224. persevere v.\u575a\u6301,\u575a\u5fcd,\u4e0d\u5c48\u4e0d\u6320"

    aput-object v3, v0, v2

    const/16 v2, 0x4c8

    .line 1401
    const-string v3, "1225. questionnaire n.\u8c03\u67e5\u8868,\u95ee\u5377"

    aput-object v3, v0, v2

    const/16 v2, 0x4c9

    .line 1402
    const-string v3, "1226. millionaire n.\u767e\u4e07\u5bcc\u7fc1"

    aput-object v3, v0, v2

    const/16 v2, 0x4ca

    .line 1403
    const-string v3, "1227. fire n.\u706b\uff1b\u706b\u707e\uff0c\u5931\u706b\uff1b\u7089\u706b vi.\u5f00\u706b vt.\u653e(\u67aa)"

    aput-object v3, v0, v2

    const/16 v2, 0x4cb

    .line 1404
    const-string v3, "1228. hire n./v.\u96c7\u7528,\u79df\u501f"

    aput-object v3, v0, v2

    const/16 v2, 0x4cc

    .line 1405
    const-string v3, "1229. admire vt.\u94a6\u4f69,\u8d5e\u8d4f,\u7fa1\u6155\uff1b\u79f0\u8d5e,\u5938\u5956"

    aput-object v3, v0, v2

    const/16 v2, 0x4cd

    .line 1406
    const-string v3, "1230. repertoire n.\u8282\u76ee,\u5168\u90e8\u5267\u76ee,\u4fdd\u7559\u5267\u76ee,\u5168\u90e8\u6280\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0x4ce

    .line 1407
    const-string v3, "1231. empire n.\u5e1d\u56fd"

    aput-object v3, v0, v2

    const/16 v2, 0x4cf

    .line 1408
    const-string v3, "1232. aspire vi.(to\uff0cafter)\u6e34\u671b\uff0c\u8ffd\u6c42\uff0c\u6709\u5fd7\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x4d0

    .line 1409
    const-string v3, "1233. inspire vt.\u9f13\u821e,\u6fc0\u8d77;\u4f7f\u4ea7\u751f\u7075\u611f"

    aput-object v3, v0, v2

    const/16 v2, 0x4d1

    .line 1410
    const-string v3, "1234. expire v.\u671f\u6ee1,(\u671f\u9650)\u7ec8\u6b62;\u547c\u6c14;\u65ad\u6c14,\u6b7b\u4ea1"

    aput-object v3, v0, v2

    const/16 v2, 0x4d2

    .line 1411
    const-string v3, "1235. desire v./n.\u613f\u671b,\u6b32\u671b,\u8981\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x4d3

    .line 1412
    const-string v3, "1236. tire v.(\u4f7f)\u75b2\u5026,(\u4f7f)\u538c\u5026 n.(=tyre)\u8f6e\u80ce,\u8f66\u80ce"

    aput-object v3, v0, v2

    const/16 v2, 0x4d4

    .line 1413
    const-string v3, "1237. satire n.\u8bbd\u523a,\u8bbd\u523a\u6587\u5b66,\u8bbd\u523a\u4f5c\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x4d5

    .line 1414
    const-string v3, "1238. retire v.\u9000\u4f11,\u5f15\u9000;\u9000\u5374,\u64a4\u9000;\u5c31\u5bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x4d6

    .line 1415
    const-string v3, "1239. entire a.\u5b8c\u5168\u7684,\u5168\u90e8\u7684,\u5b8c\u6574\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4d7

    .line 1416
    const-string v3, "1240. acquire v.\u83b7\u5f97\uff1b\u5b66\u5230(\u77e5\u8bc6\u7b49)\uff1b\u517b\u6210(\u4e60\u60ef)"

    aput-object v3, v0, v2

    const/16 v2, 0x4d8

    .line 1417
    const-string v3, "1241. require v.\u9700\u8981;(of)\u8981\u6c42,\u547d\u4ee4"

    aput-object v3, v0, v2

    const/16 v2, 0x4d9

    .line 1418
    const-string v3, "1242. enquire v.(inquire)\u8be2\u95ee,\u6253\u542c;\u8c03\u67e5;\u67e5\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0x4da

    .line 1419
    const-string v3, "1243. wire n.\u91d1\u5c5e\u7ebf,\u7535\u7ebf;\u7535\u62a5,\u7535\u4fe1 v.\u53d1\u7535\u62a5(\u7ed9)"

    aput-object v3, v0, v2

    const/16 v2, 0x4db

    .line 1420
    const-string v3, "1244. ore n.\u77ff\u77f3,\u77ff\u7802"

    aput-object v3, v0, v2

    const/16 v2, 0x4dc

    .line 1421
    const-string v3, "1245. bore v.\u94bb(\u5b54),\u6316(\u6d1e);\u70e6\u6270 n.\u8ba8\u538c\u7684\u4eba,\u9ebb\u70e6\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x4dd

    .line 1422
    const-string v3, "1246. core n.\u679c\u6838;\u4e2d\u5fc3,\u6838\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x4de

    .line 1423
    const-string v3, "1247. score n.\u5f97\u5206,\u5206\u6570;\u4e8c\u5341 v.\u5f97(\u5206),\u8bb0(\u2026\u7684)\u5206\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x4df

    .line 1424
    const-string v3, "1248. adore vt.\u5d07\u62dc,\u656c\u6155,\u7231\u6155\uff1b\u975e\u5e38\u559c\u6b22"

    aput-object v3, v0, v2

    const/16 v2, 0x4e0

    .line 1425
    const-string v3, "1249. fore ad.\u5728\u524d\u9762 a.\u5148\u524d\u7684\uff1b\u5728\u524d\u90e8\u7684 n.\u524d\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x4e1

    .line 1426
    const-string v3, "1250. before prep.(\u6307\u65f6\u95f4)\u5728\u2026\u4ee5\u524d,\u5728..\u524d\u9762\uff0c\u5728..\u4e4b\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0x4e2

    .line 1427
    const-string v3, "1251. therefore ad.\u56e0\u6b64\uff0c\u6240\u4ee5 conj.\u56e0\u6b64"

    aput-object v3, v0, v2

    const/16 v2, 0x4e3

    .line 1428
    const-string v3, "1252. shore n.\u6d77\u6ee8,\u6e56\u6ee8"

    aput-object v3, v0, v2

    const/16 v2, 0x4e4

    .line 1429
    const-string v3, "1253. ashore ad.\u4e0a\u5cb8\uff1b\u5728\u5cb8\u4e0a\uff0c\u5411\u5cb8\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x4e5

    .line 1430
    const-string v3, "1254. explore v.\u52d8\u63a2,\u63a2\u6d4b;\u63a2\u7a76,\u63a2\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x4e6

    .line 1431
    const-string v3, "1255. more a.\u66f4\u591a\u7684 n.\u66f4\u591a\u7684\u4eba(\u6216\u4e1c\u897f) ad.\u66f4\uff0c\u66f4\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0x4e7

    .line 1432
    const-string v3, "1256. sophomore (\u4e2d\u5b66\u3001\u5927\u5b66)\u4e8c\u5e74\u7ea7\u5b66\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x4e8

    .line 1433
    const-string v3, "1257. furthermore ad.\u800c\u4e14,\u6b64\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0x4e9

    .line 1434
    const-string v3, "1258. ignore v.\u4e0d\u7406,\u4e0d\u987e,\u5ffd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x4ea

    .line 1435
    const-string v3, "1259. "

    aput-object v3, v0, v2

    const/16 v2, 0x4eb

    .line 1436
    const-string v3, "1260. "

    aput-object v3, v0, v2

    const/16 v2, 0x4ec

    .line 1437
    const-string v3, "1261. sore a.\u75bc\u75db\u7684;\u75db\u5fc3\u7684 n.\u75db\u5904,\u75ae\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x4ed

    .line 1438
    const-string v3, "1262. store n.\u5546\u5e97,\u5e97\u94fa;\u8d2e\u85cf,\u8d2e\u5907\u54c1 v.\u8d2e\u85cf,\u8d2e\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x4ee

    .line 1439
    const-string v3, "1263. restore v.\u6062\u590d,\u4f7f\u56de\u590d;\u5f52\u8fd8,\u4ea4\u8fd8;\u4fee\u590d,\u91cd\u5efa"

    aput-object v3, v0, v2

    const/16 v2, 0x4ef

    .line 1440
    const-string v3, "1264. bizarre adj.\u5f02\u4e4e\u5bfb\u5e38\u7684\uff0c\u7a00\u5947\u53e4\u602a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4f0

    .line 1441
    const-string v3, "1265. metre n.(meter)\u7c73\uff0c\u516c\u5c3a\uff1b\u4eea\u8868\uff0c\u8ba1\u91cf\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x4f1

    .line 1442
    const-string v3, "1266. centimetre n.(centimeter)\u5398\u7c73"

    aput-object v3, v0, v2

    const/16 v2, 0x4f2

    .line 1443
    const-string v3, "1267. kilometre n.(kilometer) \u516c\u91cc\uff0c\u5343\u7c73(\u7565\u4f5ckm)"

    aput-object v3, v0, v2

    const/16 v2, 0x4f3

    .line 1444
    const-string v3, "1268. litre n.(liter)\u5347\uff1b\u516c\u5347(\u5bb9\u91cf\u5355\u4f4d)"

    aput-object v3, v0, v2

    const/16 v2, 0x4f4

    .line 1445
    const-string v3, "1269. centre n.\u4e2d\u5fc3\uff0c\u4e2d\u592e\uff0c\u4e2d\u95f4 vt.\u96c6\u4e2d vi.\u4ee5..\u4e3a\u4e2d\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x4f5

    .line 1446
    const-string v3, "1270. cure v.(of)\u6cbb\u6108,\u533b\u6cbb;\u77eb\u6b63 n.\u6cbb\u6108,\u75ca\u6108;\u826f\u836f"

    aput-object v3, v0, v2

    const/16 v2, 0x4f6

    .line 1447
    const-string v3, "1271. secure a.(from,against)\u5b89\u5168\u7684,\u653e\u5fc3\u7684v.\u5f97\u5230;\u9632\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x4f7

    .line 1448
    const-string v3, "1272. obscure a.\u6697\u7684,\u6726\u80e7\u7684;\u6a21\u7cca\u7684,\u6666\u6da9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x4f8

    .line 1449
    const-string v3, "1273. procedure n.\u7a0b\u5e8f,\u624b\u7eed,\u6b65\u9aa4"

    aput-object v3, v0, v2

    const/16 v2, 0x4f9

    .line 1450
    const-string v3, "1274. endure v.\u5fcd\u53d7,\u6301\u4e45,\u6301\u7eed"

    aput-object v3, v0, v2

    const/16 v2, 0x4fa

    .line 1451
    const-string v3, "1275. figure n.\u4f53\u5f62;\u8f6e\u5ed3;\u6570\u5b57;\u56fe\u5f62v.\u63cf\u7ed8;\u8ba1\u7b97;\u63a8\u6d4b"

    aput-object v3, v0, v2

    const/16 v2, 0x4fb

    .line 1452
    const-string v3, "1276. brochure n.\u5c0f\u518c\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x4fc

    .line 1453
    const-string v3, "1277. injure v.\u635f\u5bb3,\u635f\u4f24,\u4f24\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0x4fd

    .line 1454
    const-string v3, "1278. lure n.\u5438\u5f15\u529b,\u9b45\u529b,\u8bf1\u60d1\u7269 vt.\u5f15\u8bf1\uff0c\u5438\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x4fe

    .line 1455
    const-string v3, "1279. failure n.\u5931\u8d25,\u4e0d\u53ca\u683c;\u5931\u8d25\u8005;\u6545\u969c,\u5931\u7075;\u672a\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0x4ff

    .line 1456
    const-string v3, "1280. pure a.\u7eaf\u7684,\u7eaf\u6d01\u7684;\u7eaf\u7406\u8bba\u7684,\u62bd\u8c61\u7684;\u5b8c\u5168\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x500

    .line 1457
    const-string v3, "1281. sure a.\u80af\u5b9a\u7684\uff1b\u4e00\u5b9a\u4f1a\u2026\u7684\uff1b\u6709\u4fe1\u5fc3\u7684\uff0c\u6709\u628a\u63e1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x501

    .line 1458
    const-string v3, "1282. pleasure n.\u6109\u5feb,\u5feb\u4e50;\u4e50\u4e8b,\u4e50\u8da3"

    aput-object v3, v0, v2

    const/16 v2, 0x502

    .line 1459
    const-string v3, "1283. measure v.\u6d4b\u91cf,\u5206\u6d3e,\u6743\u8861 n.\u5c3a\u5bf8,\u91cf\u5ea6\u5668,\u63aa\u65bd,\u529e\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x503

    .line 1460
    const-string v3, "1284. treasure n.\u8d22\u5b9d,\u8d22\u5bcc;\u73cd\u54c1 v.\u73cd\u7231,\u73cd\u60dc"

    aput-object v3, v0, v2

    const/16 v2, 0x504

    .line 1461
    const-string v3, "1285. leisure n.\u7a7a\u95f2,\u95f2\u6687;\u60a0\u95f2,\u5b89\u9038"

    aput-object v3, v0, v2

    const/16 v2, 0x505

    .line 1462
    const-string v3, "1286. ensure v.\u786e\u4fdd,\u4fdd\u8bc1;\u4f7f\u5b89\u5168"

    aput-object v3, v0, v2

    const/16 v2, 0x506

    .line 1463
    const-string v3, "1287. insure vt.\u4fdd\u9669,\u7ed9\u2026\u4fdd\u9669;\u4fdd\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x507

    .line 1464
    const-string v3, "1288. enclosure n.\u56f4\u4f4f,\u5708\u8d77,\u5c01\u5165,\u9644\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x508

    .line 1465
    const-string v3, "1289. exposure n.\u66b4\u9732,\u63ed\u9732;\u65b9\u5411;\u9648\u5217;\u9057\u5f03;\u7167\u5c04\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x509

    .line 1466
    const-string v3, "1290. assure vt.\u4f7f\u786e\u4fe1\uff0c\u4f7f\u653e\u5fc3(of)\uff1b\u5411\u2026\u4fdd\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x50a

    .line 1467
    const-string v3, "1291. reassure v.\u4f7f\u5b89\u5fc3\uff0c\u4f7f\u653e\u5fc3\uff1b\u4f7f\u6d88\u9664\u7591\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0x50b

    .line 1468
    const-string v3, "1292. pressure n.\u538b,\u538b\u529b,\u538b\u8feb,\u5f3a\u5236,\u7d27\u8feb,\u56f0\u82e6,\u56f0\u96be"

    aput-object v3, v0, v2

    const/16 v2, 0x50c

    .line 1469
    const-string v3, "1293. feature n.\u7279\u5f81;\u5bb9\u8c8c;\u7279\u8272;\u7279\u5199 v.\u4ee5...\u4e3a\u7279\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x50d

    .line 1470
    const-string v3, "1294. creature n.\u4eba,\u52a8\u7269;\u751f\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x50e

    .line 1471
    const-string v3, "1295. miniature n.\u7f29\u5c0f\u7684\u6a21\u578b,\u7f29\u56fe a.\u5fae\u578b\u7684,\u7f29\u5c0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x50f

    .line 1472
    const-string v3, "1296. mature a.\u6210\u719f\u7684,\u719f\u7684;\u6210\u5e74\u4eba\u7684 v.(\u4f7f)\u6210\u719f"

    aput-object v3, v0, v2

    const/16 v2, 0x510

    .line 1473
    const-string v3, "1297. nature n.\u81ea\u7136\u754c,\u5927\u81ea\u7136;\u6027\u8d28,\u672c\u6027,\u5929\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x511

    .line 1474
    const-string v3, "1298. signature n.\u7b7e\u540d,\u7f72\u540d,\u7b7e\u5b57"

    aput-object v3, v0, v2

    const/16 v2, 0x512

    .line 1475
    const-string v3, "1299. temperature n.\u6e29\u5ea6\uff0c\u4f53\u6e29\uff1b\u70ed\u5ea6\uff0c\u53d1\u70e7"

    aput-object v3, v0, v2

    const/16 v2, 0x513

    .line 1476
    const-string v3, "1300. literature n.\u6587\u5b66,\u6587\u5b66\u4f5c\u54c1,\u6587\u732e,\u56fe\u4e66\u8d44\u6599,\u5370\u5237\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x514

    .line 1477
    const-string v3, "1301. manufacture v.\u5236\u9020,\u52a0\u5de5 n.\u5236\u9020,\u5236\u9020\u4e1a;\u4ea7\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x515

    .line 1478
    const-string v3, "1302. fracture n.\u88c2\u7f1d(\u75d5);\u9aa8\u6298 v.(\u4f7f)\u65ad\u88c2,(\u4f7f)\u6298\u65ad"

    aput-object v3, v0, v2

    const/16 v2, 0x516

    .line 1479
    const-string v3, "1303. lecture n./v.\u6f14\u8bb2,\u8bb2\u8bfe"

    aput-object v3, v0, v2

    const/16 v2, 0x517

    .line 1480
    const-string v3, "1304. architecture n.\u5efa\u7b51\uff0c\u5efa\u7b51\u5b66\uff1b\u5efa\u7b51\u5f0f\u6837\u6216\u98ce\u683c\uff0c\u5efa\u7b51\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x518

    .line 1481
    const-string v3, "1305. picture n.\u753b,\u56fe\u7247;\u5f71\u7247;\u7f8e\u666f v.\u753b,\u63cf\u8ff0,\u60f3\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x519

    .line 1482
    const-string v3, "1306. structure n.\u7ed3\u6784,\u6784\u9020;\u5efa\u7b51\u7269 v.\u6784\u9020,\u5efa\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x51a

    .line 1483
    const-string v3, "1307. infrastructure n.\u57fa\u7840\u7ed3\u6784\uff0c\u57fa\u7840\u8bbe\u65bd"

    aput-object v3, v0, v2

    const/16 v2, 0x51b

    .line 1484
    const-string v3, "1308. expenditure n.\u82b1\u8d39;(\u65f6\u95f4,\u91d1\u94b1\u7b49\u7684)\u652f\u51fa,\u6d88\u8017"

    aput-object v3, v0, v2

    const/16 v2, 0x51c

    .line 1485
    const-string v3, "1309. furniture n.\u5bb6\u5177"

    aput-object v3, v0, v2

    const/16 v2, 0x51d

    .line 1486
    const-string v3, "1310. culture n.\u6587\u5316,\u6587\u660e;\u4fee\u517b;\u8015\u79cd\uff1b\u683d\u57f9,\u57f9\u80b2;"

    aput-object v3, v0, v2

    const/16 v2, 0x51e

    .line 1487
    const-string v3, "1311. agriculture n.\u519c\u4e1a\uff0c\u519c\u827a\uff0c\u519c\u8015"

    aput-object v3, v0, v2

    const/16 v2, 0x51f

    .line 1488
    const-string v3, "1312. venture v.\u5192\u9669,\u62fc;\u5927\u80c6\u8868\u793a n.\u5192\u9669\u4e8b\u4e1a,\u62fc,\u95ef"

    aput-object v3, v0, v2

    const/16 v2, 0x520

    .line 1489
    const-string v3, "1313. adventure n.\u5192\u9669\uff0c\u5192\u9669\u6d3b\u52a8\uff0c\u5947\u9047 vt.\u5927\u80c6\u8fdb\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x521

    .line 1490
    const-string v3, "1314. capture v./n.\u6355\u83b7,\u4fd8\u864f;\u593a\u5f97,\u653b\u5360"

    aput-object v3, v0, v2

    const/16 v2, 0x522

    .line 1491
    const-string v3, "1315. sculpture n.\u96d5\u523b(\u672f)\uff0c\u96d5\u5851(\u672f)\uff1b\u96d5\u523b\u4f5c\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x523

    .line 1492
    const-string v3, "1316. departure n.\u79bb\u5f00,\u8d77\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0x524

    .line 1493
    const-string v3, "1317. torture v.\u62f7\u95ee,\u62f7\u6253;\u6298\u78e8,\u78e8\u96be n.\u62f7\u95ee;\u6298\u78e8,\u75db\u82e6"

    aput-object v3, v0, v2

    const/16 v2, 0x525

    .line 1494
    const-string v3, "1318. nurture n./v.\u517b\u80b2,\u6559\u80b2,\u6559\u517b n.\u8425\u517b\u54c1v.\u7ed9\u4e0e\u8425\u517b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x526

    .line 1495
    const-string v3, "1319. pasture n.\u7267\u8349\u5730,\u7267\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x527

    .line 1496
    const-string v3, "1320. gesture n.\u59ff\u52bf,\u59ff\u6001,\u624b\u52bf v.\u505a\u624b\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0x528

    .line 1497
    const-string v3, "1321. moisture n.\u6f6e\u6e7f,\u6e7f\u6c14,\u6e7f\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x529

    .line 1498
    const-string v3, "1322. posture n.\u59ff\u52bf,\u59ff\u6001,\u5fc3\u6001,\u6001\u5ea6 v.\u4f5c\u51fa\u67d0\u79cd\u59ff\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0x52a

    .line 1499
    const-string v3, "1323. future n.\u5c06\u6765,\u672a\u6765;\u524d\u9014,\u524d\u666f a.\u5c06\u6765\u7684,\u672a\u6765\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x52b

    .line 1500
    const-string v3, "1324. texture n.(\u7ec7\u7269)\u8d28\u5730\uff1b(\u6750\u6599)\u6784\u9020\uff1b\u7ed3\u6784\uff1b\u808c\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x52c

    .line 1501
    const-string v3, "1325. fixture n.\u56fa\u5b9a\u8bbe\u5907;\u9884\u5b9a\u65e5\u671f;\u6bd4\u8d5b\u65f6\u95f4;\u5b9a\u671f\u5b58\u6b3e"

    aput-object v3, v0, v2

    const/16 v2, 0x52d

    .line 1502
    const-string v3, "1326. mixture n.\u6df7\u5408;\u6df7\u5408\u7269,\u6df7\u5408\u5242"

    aput-object v3, v0, v2

    const/16 v2, 0x52e

    .line 1503
    const-string v3, "1327. base n.\u57fa\u7840,\u5e95\u90e8;\u6839\u636e\u5730 v.(on)\u628a\u2026\u57fa\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x52f

    .line 1504
    const-string v3, "1328. database n.(databank)\u6570\u636e\u5e93"

    aput-object v3, v0, v2

    const/16 v2, 0x530

    .line 1505
    const-string v3, "1329. case n.\u7bb1,\u76d2,\u5bb9\u5668;\u60c5\u51b5,\u4e8b\u5b9e;\u75c5\u4f8b;\u6848\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x531

    .line 1506
    const-string v3, "1330. briefcase n.\u624b\u63d0\u7bb1\uff0c\u516c\u4e8b\u76ae\u5305"

    aput-object v3, v0, v2

    const/16 v2, 0x532

    .line 1507
    const-string v3, "1331. staircase n.(stairway)\u697c\u68af"

    aput-object v3, v0, v2

    const/16 v2, 0x533

    .line 1508
    const-string v3, "1332. ease v.\u51cf\u8f7b;\u4f7f\u8212\u9002,\u4f7f\u5b89\u5fc3 n.\u5bb9\u6613;\u8212\u9002,\u60a0\u95f2"

    aput-object v3, v0, v2

    const/16 v2, 0x534

    .line 1509
    const-string v3, "1333. cease v./n.\u505c\u6b62,\u4e2d\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x535

    .line 1510
    const-string v3, "1334. lease vt.\u51fa\u79df,\u79df\u7528 n.\u79df\u501f,\u79df\u671f,\u79df\u8d41\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x536

    .line 1511
    const-string v3, "1335. release v.\u91ca\u653e,\u89e3\u653e;\u53d1\u8868,\u53d1\u884c n.\u91ca\u653e,\u8c41\u514d,\u653e\u677e"

    aput-object v3, v0, v2

    const/16 v2, 0x537

    .line 1512
    const-string v3, "1336. please v.\u8bf7;\u4f7f\u6109\u5feb,\u4f7f\u6ee1\u610f;\u559c\u6b22,\u613f\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x538

    .line 1513
    const-string v3, "1337. decrease n.\u51cf\u5c11,\u51cf\u5c0f;\u51cf\u5c11\u91cf v.\u51cf\u5c11,\u53d8\u5c11,\u964d\u4f4e"

    aput-object v3, v0, v2

    const/16 v2, 0x539

    .line 1514
    const-string v3, "1338. increase v./n.\u589e\u52a0,\u589e\u957f,\u589e\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x53a

    .line 1515
    const-string v3, "1339. grease n.\u52a8\u7269\u8102,\u6cb9\u8102,\u6da6\u6ed1\u8102 v.\u62b9\u6cb9,\u6da6\u6ed1"

    aput-object v3, v0, v2

    const/16 v2, 0x53b

    .line 1516
    const-string v3, "1340. disease n.\u75be\u75c5"

    aput-object v3, v0, v2

    const/16 v2, 0x53c

    .line 1517
    const-string v3, "1341. tease v.\u620f\u5f04,\u53d6\u7b11;\u6311\u9017 n.(\u7231)\u620f\u5f04\u4ed6\u4eba\u8005;\u620f\u5f04"

    aput-object v3, v0, v2

    const/16 v2, 0x53d

    .line 1518
    const-string v3, "1342. chase v./n.\u8ffd\u9010,\u8ffd\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x53e

    .line 1519
    const-string v3, "1343. purchase v.\u4e70,\u8d2d\u4e70 n.\u8d2d\u4e70\u7684\u7269\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x53f

    .line 1520
    const-string v3, "1344. phase n.\u9636\u6bb5,\u72b6\u6001,\u65f6\u671f;\u76f8,\u76f8\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x540

    .line 1521
    const-string v3, "1345. erase v.\u64e6\u6389;\u5220\u53bb;\u6d88\u78c1"

    aput-object v3, v0, v2

    const/16 v2, 0x541

    .line 1522
    const-string v3, "1346. phrase n.\u77ed\u8bed,\u8bcd\u8bed,\u4e60\u8bed"

    aput-object v3, v0, v2

    const/16 v2, 0x542

    .line 1523
    const-string v3, "1347. vase n.\u82b1\u74f6,\u74f6"

    aput-object v3, v0, v2

    const/16 v2, 0x543

    .line 1524
    const-string v3, "1348. cheese n.\u5e72\u916a,\u4e73\u916a"

    aput-object v3, v0, v2

    const/16 v2, 0x544

    .line 1525
    const-string v3, "1349. these pron.&a.[this\u7684\u590d\u6570]\u8fd9\u4e9b\uff1b\u8fd9\u4e9b\u4eba(\u4e1c\u897f)"

    aput-object v3, v0, v2

    const/16 v2, 0x545

    .line 1526
    const-string v3, "1350. raise v.\u4e3e\u8d77,\u63d0\u5347;\u589e\u52a0;\u9972\u517b;\u5f15\u8d77;\u7ad6\u8d77;\u63d0\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x546

    .line 1527
    const-string v3, "1351. praise v.\u8d5e\u626c,\u6b4c\u9882;\u8868\u626c n.\u79f0\u8d5e,\u8d5e\u7f8e;\u8d5e\u7f8e\u7684\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x547

    .line 1528
    const-string v3, "1352. precise a.\u7cbe\u786e\u7684,\u51c6\u786e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x548

    .line 1529
    const-string v3, "1353. concise a.\u7b80\u660e\u7684,\u7b80\u6d01\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x549

    .line 1530
    const-string v3, "1354. exercise n.\u7ec3\u4e60,\u4e60\u9898;\u8bad\u7ec3,\u953b\u7ec3 v.\u8bad\u7ec3,\u953b\u7ec3;\u884c\u4f7f"

    aput-object v3, v0, v2

    const/16 v2, 0x54a

    .line 1531
    const-string v3, "1355. merchandise n.\u5546\u54c1,\u8d27\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x54b

    .line 1532
    const-string v3, "1356. apologise v.(to,for)\u9053\u6b49\uff0c\u8ba4\u9519"

    aput-object v3, v0, v2

    const/16 v2, 0x54c

    .line 1533
    const-string v3, "1357. realise v.(realize)\u8ba4\u8bc6\u5230,\u4f53\u4f1a\u5230;\u5b9e\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0x54d

    .line 1534
    const-string v3, "1358. premise n.\u524d\u63d0,\u623f\u5c4b\u8fde\u5730\u57fav.\u63d0\u8bba,\u9884\u8ff0,\u5047\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x54e

    .line 1535
    const-string v3, "1359. promise v.\u5141\u8bb8,\u7b54\u5e94;\u6709\u2026\u53ef\u80fdn.\u627f\u8bfa;\u5e0c\u671b,\u51fa\u606f"

    aput-object v3, v0, v2

    const/16 v2, 0x54f

    .line 1536
    const-string v3, "1360. compromise n.\u59a5\u534f\uff0c\u6298\u8877vi.\u59a5\u534fvt.\u5371\u53ca\uff0c\u653e\u5f03(\u539f\u5219\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x550

    .line 1537
    const-string v3, "1361. noise n.\u55a7\u95f9\u58f0,\u566a\u58f0,\u5435\u56b7\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x551

    .line 1538
    const-string v3, "1362. despise v.\u8f7b\u89c6,\u8511\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x552

    .line 1539
    const-string v3, "1363. rise v.\u5347\u8d77;\u8d77\u7acb;\u4e0a\u6da8;\u8d77\u4e49 n.\u4e0a\u6da8,\u589e\u9ad8;\u8d77\u6e90"

    aput-object v3, v0, v2

    const/16 v2, 0x553

    .line 1540
    const-string v3, "1364. arise v.\u51fa\u73b0\uff0c\u53d1\u751f\uff1b(from)\u7531\u2026\u5f15\u8d77\uff0c\u7531\u2026\u4ea7\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x554

    .line 1541
    const-string v3, "1365. sunrise n.\u65e5\u51fa\uff0c\u62c2\u6653\uff1b\u671d\u971e"

    aput-object v3, v0, v2

    const/16 v2, 0x555

    .line 1542
    const-string v3, "1366. comprise vt.\u5305\u542b\uff0c\u5305\u62ec\uff0c\u7531...\u7ec4\u6210\uff1b\u6784\u6210\uff0c\u7ec4\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0x556

    .line 1543
    const-string v3, "1367. enterprise n.\u4e8b\u4e1a,\u4f01(\u4e8b)\u4e1a\u5355\u4f4d;\u4e8b\u4e1a\u5fc3,\u8fdb\u53d6\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x557

    .line 1544
    const-string v3, "1368. surprise v.\u4f7f\u8be7\u5f02,\u4f7f\u60ca\u5f02;\u5947\u88ad n.\u8be7\u5f02,\u60ca\u5f02;\u5947\u88ad"

    aput-object v3, v0, v2

    const/16 v2, 0x558

    .line 1545
    const-string v3, "1369. practise v.\u7ec3\u4e60,\u5b9e\u4e60,\u5b9e\u8df5,\u5b9e\u884c,\u4f7f...\u7ec3\u4e60,\u8bad\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0x559

    .line 1546
    const-string v3, "1370. expertise n.\u4e13\u95e8\u77e5\u8bc6(\u6216\u6280\u80fd\u7b49),\u4e13\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0x55a

    .line 1547
    const-string v3, "1371. advertise vt.\u516c\u544a\uff0c\u516c\u5e03\uff1b\u4e3a...\u505a\u5e7f\u544a vi.\u767b\u5e7f\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0x55b

    .line 1548
    const-string v3, "1372. disguise n./v.\u5047\u88c5,\u4f2a\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x55c

    .line 1549
    const-string v3, "1373. bruise n.\u9752\u80bf\uff0c\u632b\u4f24\uff1b\u4f24\u75d5vt.\u6253\u9752\uff1b\u632b\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0x55d

    .line 1550
    const-string v3, "1374. cruise v.\u5de1\u822a\uff1b\u4ee5\u8282\u7701\u71c3\u6599\u7684\u901f\u5ea6\u524d\u8fdb n.\u4e58\u8239\u5de1\u6e38"

    aput-object v3, v0, v2

    const/16 v2, 0x55e

    .line 1551
    const-string v3, "1375. advise vt.\u5fe0\u544a\uff0c\u529d\u544a\uff0c\u5efa\u8bae\uff1b\u901a\u77e5\uff0c\u544a\u77e5"

    aput-object v3, v0, v2

    const/16 v2, 0x55f

    .line 1552
    const-string v3, "1376. devise vt.\u8bbe\u8ba1;\u53d1\u660e;\u56fe\u8c0b;\u4f5c\u51fa(\u8ba1\u5212);\u60f3\u51fa(\u529e\u6cd5)"

    aput-object v3, v0, v2

    const/16 v2, 0x560

    .line 1553
    const-string v3, "1377. revise v.\u4fee\u8ba2,\u6821\u8ba2;\u4fee\u6b63,\u4fee\u6539"

    aput-object v3, v0, v2

    const/16 v2, 0x561

    .line 1554
    const-string v3, "1378. supervise v.\u7ba1\u7406,\u76d1\u7763"

    aput-object v3, v0, v2

    const/16 v2, 0x562

    .line 1555
    const-string v3, "1379. wise a.\u6709\u667a\u6167\u7684,\u806a\u660e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x563

    .line 1556
    const-string v3, "1380. likewise ad.\u540c\u6837\u5730,\u7167\u6837\u5730;\u53c8,\u4e5f,\u800c\u4e14"

    aput-object v3, v0, v2

    const/16 v2, 0x564

    .line 1557
    const-string v3, "1381. clockwise a.\u987a\u65f6\u9488\u65b9\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x565

    .line 1558
    const-string v3, "1382. otherwise ad.\u53e6\u6837,\u7528\u522b\u7684\u65b9\u6cd5;\u5728\u5176\u4ed6\u65b9\u9762conj.\u8981\u4e0d\u7136"

    aput-object v3, v0, v2

    const/16 v2, 0x566

    .line 1559
    const-string v3, "1383. false a.\u8c2c\u8bef\u7684,\u865a\u4f2a\u7684,\u4f2a\u9020\u7684,\u5047\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x567

    .line 1560
    const-string v3, "1384. else ad.\u5176\u5b83\uff0c\u53e6\u5916\uff0c\u522b\u7684\uff1b[\u4e0eor\u8fde\u7528]\u5426\u5219"

    aput-object v3, v0, v2

    const/16 v2, 0x568

    .line 1561
    const-string v3, "1385. pulse n.\u8109\u640f,\u8109\u51b2"

    aput-object v3, v0, v2

    const/16 v2, 0x569

    .line 1562
    const-string v3, "1386. impulse v.\u63a8\u52a8 n.\u63a8\u52a8;\u51b2\u52a8,\u523a\u6fc0"

    aput-object v3, v0, v2

    const/16 v2, 0x56a

    .line 1563
    const-string v3, "1387. license n.(licence)\u8bb8\u53ef\u8bc1,\u6267\u7167 v.\u51c6\u8bb8,\u8ba4\u53ef"

    aput-object v3, v0, v2

    const/16 v2, 0x56b

    .line 1564
    const-string v3, "1388. dense a.\u6d53\u539a\u7684,\u5bc6\u96c6\u7684,\u7a20\u5bc6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x56c

    .line 1565
    const-string v3, "1389. condense v.(\u4f7f)\u51b7\u51dd\uff0c(\u4f7f)\u51dd\u7ed3\uff1b\u6d53\u7f29\uff0c\u538b\u7f29\uff0c\u7b80\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x56d

    .line 1566
    const-string v3, "1390. immense a.\u5e7f\u5927\u7684,\u5de8\u5927\u7684;[\u53e3]\u6781\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x56e

    .line 1567
    const-string v3, "1391. expense n.\u82b1\u8d39,\u6d88\u8d39,\u6d88\u8017"

    aput-object v3, v0, v2

    const/16 v2, 0x56f

    .line 1568
    const-string v3, "1392. sense n.\u611f\u5b98;\u611f\u89c9;\u5224\u65ad\u529b;\u610f\u4e49 v.\u89c9\u5f97,\u610f\u8bc6\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x570

    .line 1569
    const-string v3, "1393. nonsense n.\u80e1\u8bf4,\u5e9f\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x571

    .line 1570
    const-string v3, "1394. tense n.\u65f6\u6001 v.\u62c9\u7d27\uff0c(\u4f7f)\u7d27\u5f20 a.\u7ef7\u7d27\u7684\uff0c\u7d27\u5f20\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x572

    .line 1571
    const-string v3, "1395. intense a.\u5f3a\u70c8\u7684,\u5267\u70c8\u7684;\u70ed\u70c8\u7684,\u70ed\u60c5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x573

    .line 1572
    const-string v3, "1396. response n.\u56de\u7b54,\u54cd\u5e94,\u53cd\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x574

    .line 1573
    const-string v3, "1397. dose n.\u5242\u91cf,\u4e00\u670d,\u4e00\u5242 v.(\u7ed9\u2026)\u670d\u836f"

    aput-object v3, v0, v2

    const/16 v2, 0x575

    .line 1574
    const-string v3, "1398. hose n.\u6c34\u9f99\u5e26,\u8f6f\u7ba1 v.\u7528\u8f6f\u7ba1(\u6dcb\u6d47,\u51b2\u6d17)"

    aput-object v3, v0, v2

    const/16 v2, 0x576

    .line 1575
    const-string v3, "1399. those pron./a.[that\u7684\u590d\u6570]\u90a3\u4e9b\uff1b\u90a3\u4e9b\u4eba(\u4e1c\u897f)"

    aput-object v3, v0, v2

    const/16 v2, 0x577

    .line 1576
    const-string v3, "1400. whose pron.\u8c01\u7684\uff1b\u54ea(\u4e2a)\u4eba\u7684\uff0c\u90a3\u4e9b(\u4eba)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x578

    .line 1577
    const-string v3, "1401. lose v.\u4e22\u5931,\u8ff7\u8def,\u8f93\u6389,\u4e8f\u672c,\u5931\u8d25,\u8d70\u6162,\u4f7f\u6c89\u6e4e\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x579

    .line 1578
    const-string v3, "1402. close v./n.\u5173\uff1b\u7ed3\u675f a./ad.\u8fd1\u7684(\u5730)\uff1b\u7d27\u5bc6\u7684(\u5730)"

    aput-object v3, v0, v2

    const/16 v2, 0x57a

    .line 1579
    const-string v3, "1403. enclose v.\u56f4\u4f4f,\u5708\u8d77,\u5c01\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x57b

    .line 1580
    const-string v3, "1404. disclose v.\u63ed\u793a,\u6cc4\u9732"

    aput-object v3, v0, v2

    const/16 v2, 0x57c

    .line 1581
    const-string v3, "1405. nose n.\u9f3b\u5b50;(\u98de\u673a,\u8239\u7b49\u7684)\u524d\u7aef,\u7a81\u51fa\u90e8\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x57d

    .line 1582
    const-string v3, "1406. diagnose vt.\u8bca\u65ad(\u75be\u75c5)\uff1b\u5224\u65ad(\u95ee\u9898)"

    aput-object v3, v0, v2

    const/16 v2, 0x57e

    .line 1583
    const-string v3, "1407. goose n.(pl.geese)\u9e45,\u96cc\u9e45,\u9e45\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x57f

    .line 1584
    const-string v3, "1408. choose v.\u9009\u62e9,\u6311\u9009;\u7518\u613f"

    aput-object v3, v0, v2

    const/16 v2, 0x580

    .line 1585
    const-string v3, "1409. loose a.(\u5bbd)\u677e\u7684\uff1b\u4e0d\u7cbe\u786e\u7684\uff1b\u81ea\u7531\u7684\uff0c\u6563\u6f2b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x581

    .line 1586
    const-string v3, "1410. pose n.\u59ff\u52bf,\u59ff\u6001 v.\u9020\u6210,\u63d0\u51fa,\u6446\u59ff\u52bf,\u4f6f\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x582

    .line 1587
    const-string v3, "1411. impose v.\u5f81(\u7a0e);(on)\u628a\u2026\u5f3a\u52a0\u7ed9"

    aput-object v3, v0, v2

    const/16 v2, 0x583

    .line 1588
    const-string v3, "1412. compose v.\u7ec4\u6210,\u6784\u6210;(of)\u7531\u2026\u7ec4\u6210;\u521b\u4f5c(\u8bd7\u6b4c\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x584

    .line 1589
    const-string v3, "1413. propose v.\u63d0\u8bae,\u5efa\u8bae;\u63d0\u540d,\u63a8\u8350;\u6c42\u5a5a"

    aput-object v3, v0, v2

    const/16 v2, 0x585

    .line 1590
    const-string v3, "1414. oppose v.\u53cd\u5bf9,\u4f7f\u5bf9\u7acb,\u4f7f\u5bf9\u6297,\u4f7f\u76f8\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x586

    .line 1591
    const-string v3, "1415. suppose v.\u6599\u60f3,\u731c\u60f3;\u5047\u5b9a;conj.\u5047\u4f7f...\u7ed3\u679c\u4f1a\u600e\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x587

    .line 1592
    const-string v3, "1416. purpose n.\u76ee\u7684,\u610f\u56fe;\u7528\u9014,\u6548\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0x588

    .line 1593
    const-string v3, "1417. dispose v.(of)\u5904\u7406,\u5904\u7f6e;(for)\u5e03\u7f6e,\u5b89\u6392"

    aput-object v3, v0, v2

    const/16 v2, 0x589

    .line 1594
    const-string v3, "1418. expose v.(to)\u4f7f\u66b4\u9732,\u53d7\u5230;\u4f7f\u66dd\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x58a

    .line 1595
    const-string v3, "1419. rose n.\u73ab\u7470,\u8537\u8587"

    aput-object v3, v0, v2

    const/16 v2, 0x58b

    .line 1596
    const-string v3, "1420. prose n.\u6563\u6587 a.\u6563\u6587\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x58c

    .line 1597
    const-string v3, "1421. lapse n.\u5931\u8bef,\u6d41\u901d,\u4e27\u5931,\u4e0b\u964d v.\u5931\u6548,\u504f\u79bb,\u6d41\u901d"

    aput-object v3, v0, v2

    const/16 v2, 0x58d

    .line 1598
    const-string v3, "1422. elapse vi\uff0e(\u65f6\u95f4)\u6e9c\u8d70\uff1b(\u5149\u9634)\u901d\u53bb"

    aput-object v3, v0, v2

    const/16 v2, 0x58e

    .line 1599
    const-string v3, "1423. collapse v./n.\u5012\u584c\uff1b\u5d29\u6e83\uff1b(\u4ef7\u683c)\u66b4\u8dcc\uff1b\u5012\u95ed\uff0c\u7834\u4ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x58f

    .line 1600
    const-string v3, "1424. eclipse n.\u65e5\u98df,\u6708\u98df"

    aput-object v3, v0, v2

    const/16 v2, 0x590

    .line 1601
    const-string v3, "1425. glimpse n./v.\u4e00\u77a5,\u77a5\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x591

    .line 1602
    const-string v3, "1426. coarse a.\u7c97\u7cd9\u7684,\u7c97\u52a3\u7684;\u7c97\u9c81\u7684,\u7c97\u4fd7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x592

    .line 1603
    const-string v3, "1427. immerse v.\u4f7f\u6c89\u6d78\u5728;\u4f7f\u6d78\u6ca1"

    aput-object v3, v0, v2

    const/16 v2, 0x593

    .line 1604
    const-string v3, "1428. disperse v.(\u4f7f)\u5206\u6563;(\u4f7f)\u6563\u5f00;\u758f\u6563"

    aput-object v3, v0, v2

    const/16 v2, 0x594

    .line 1605
    const-string v3, "1429. verse n.\u97f5\u6587,\u8bd7;\u8bd7\u8282,\u8bd7\u53e5"

    aput-object v3, v0, v2

    const/16 v2, 0x595

    .line 1606
    const-string v3, "1430. adverse a.\u9006\u7684\uff0c\u76f8\u53cd\u7684\uff1b\u654c\u5bf9\u7684\uff1b\u4e0d\u5229\u7684\uff1b\u6709\u5bb3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x596

    .line 1607
    const-string v3, "1431. reverse n.\u76f8\u53cd;\u80cc\u9762 a.\u76f8\u53cd\u7684 v.\u98a0\u5012,\u5012\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0x597

    .line 1608
    const-string v3, "1432. diverse a.\u591a\u79cd\u591a\u6837\u7684,(from)\u4e0d\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x598

    .line 1609
    const-string v3, "1433. universe n.\u5b87\u5b99,\u4e07\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x599

    .line 1610
    const-string v3, "1434. inverse a.\u76f8\u53cd\u7684,\u5012\u8f6c\u7684,\u53cd\u8f6c\u7684 n.\u76f8\u53cd\u4e4b\u7269 v.\u5012\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0x59a

    .line 1611
    const-string v3, "1435. horse n.\u9a6c\uff1b\u8df3\u9a6c\uff0c\u978d\u9a6c v.\u9a91\u9a6c"

    aput-object v3, v0, v2

    const/16 v2, 0x59b

    .line 1612
    const-string v3, "1436. worse a./ad.\u66f4\u574f,\u66f4\u5dee(\u7684/\u5730)"

    aput-object v3, v0, v2

    const/16 v2, 0x59c

    .line 1613
    const-string v3, "1437. curse n.\u8bc5\u5492,\u5492\u8bed,\u7978\u56e0 vt.\u8bc5\u5492,\u5492\u9a82,\u4f7f\u53d7\u7f6a"

    aput-object v3, v0, v2

    const/16 v2, 0x59d

    .line 1614
    const-string v3, "1438. nurse n.\u62a4\u58eb,\u4fdd\u59c6 v.\u62a4\u7406,\u770b\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x59e

    .line 1615
    const-string v3, "1439. course n.\u8bfe\u7a0b,\u6559\u7a0b;\u8fc7\u7a0b,\u8fdb\u7a0b;\u8def\u7a0b,\u8def\u7ebf;\u4e00\u9053\u83dc"

    aput-object v3, v0, v2

    const/16 v2, 0x59f

    .line 1616
    const-string v3, "1440. intercourse n.\u4ea4\u6d41,\u4ea4\u5f80,\u4ea4\u9645,\u6027\u4ea4"

    aput-object v3, v0, v2

    const/16 v2, 0x5a0

    .line 1617
    const-string v3, "1441. discourse n.\u8bba\u6587;\u6f14\u8bf4;\u8c08\u8bdd;\u8bdd\u8bed vi.\u8bb2\u8ff0,\u8457\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x5a1

    .line 1618
    const-string v3, "1442. purse n.\u94b1\u5305"

    aput-object v3, v0, v2

    const/16 v2, 0x5a2

    .line 1619
    const-string v3, "1443. use n.\u4f7f/\u5e94\u7528\uff1b\u7528\u6cd5/\u9014\uff1b\u76ca/\u7528\u5904 vt.\u7528\uff1b\u6d88\u8017"

    aput-object v3, v0, v2

    const/16 v2, 0x5a3

    .line 1620
    const-string v3, "1444. cause n.\u539f\u56e0;\u4e8b\u4e1a,\u4e8b\u4ef6,\u594b\u6597\u76ee\u6807 v.\u4f7f\u4ea7\u751f,\u5f15\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x5a4

    .line 1621
    const-string v3, "1445. because conj.\u56e0\u4e3a\uff0c\u7531\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x5a5

    .line 1622
    const-string v3, "1446. clause n.(\u6b63\u5f0f\u6587\u4ef6\u6216\u6cd5\u5f8b\u6587\u4ef6\u7684)\u6761\u6b3e;\u4ece\u53e5,\u5206\u53e5"

    aput-object v3, v0, v2

    const/16 v2, 0x5a6

    .line 1623
    const-string v3, "1447. applause n.\u9f13\u638c\uff1b\u559d\u5f69\uff1b\u5938\u5956\uff0c\u8d5e\u626c"

    aput-object v3, v0, v2

    const/16 v2, 0x5a7

    .line 1624
    const-string v3, "1448. pause v./n.\u4e2d\u6b62,\u6682\u505c"

    aput-object v3, v0, v2

    const/16 v2, 0x5a8

    .line 1625
    const-string v3, "1449. abuse vt.\u6ee5\u7528\uff1b\u8fb1\u9a82\uff1b\u8bcb\u6bc1 n.\u6ee5\u7528\uff1b\u6076\u4e60\uff1b\u5f0a\u7aef"

    aput-object v3, v0, v2

    const/16 v2, 0x5a9

    .line 1626
    const-string v3, "1450. accuse vt.\u63a7\u544a\uff0c\u6307\u8d23 vi.\u6307\u63a7\uff0c\u6307\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0x5aa

    .line 1627
    const-string v3, "1451. excuse v.\u539f\u8c05,\u5bbd\u6055,\u514d\u9664 n.\u501f\u53e3,\u8fa9\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0x5ab

    .line 1628
    const-string v3, "1452. fuse n.\u4fdd\u9669\u4e1d,\u5bfc\u706b\u7ebf,\u5f15\u4fe1 v.\u7194\u5316,\u7194\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x5ac

    .line 1629
    const-string v3, "1453. refuse v.\u62d2\u7edd,\u8c22\u7edd n.\u5e9f\u7269,\u5783\u573e"

    aput-object v3, v0, v2

    const/16 v2, 0x5ad

    .line 1630
    const-string v3, "1454. diffuse v.\u6269\u6563;\u4f20\u64ad a.(\u6587\u7ae0\u7b49)\u5197\u957f\u7684,\u6f2b\u65e0\u8fb9\u9645\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5ae

    .line 1631
    const-string v3, "1455. confuse v.\u4f7f\u6df7\u4e71,\u6df7\u6dc6"

    aput-object v3, v0, v2

    const/16 v2, 0x5af

    .line 1632
    const-string v3, "1456. amuse vt.\u5411\u2026\u63d0\u4f9b\u5a31\u4e50\uff0c\u4f7f\u2026\u6d88\u9063\uff1b\u5f15\u4eba\u53d1\u7b11"

    aput-object v3, v0, v2

    const/16 v2, 0x5b0

    .line 1633
    const-string v3, "1457. house n.\u623f\u5c4b\uff1b\u5546\u4e1a\u673a\u6784\uff1b[H-]\u8bae\u9662 v.\u7ed9...\u623f\u5b50\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x5b1

    .line 1634
    const-string v3, "1458. warehouse n.\u4ed3\u5e93,\u8d27\u6808"

    aput-object v3, v0, v2

    const/16 v2, 0x5b2

    .line 1635
    const-string v3, "1459. greenhouse n.\u6e29\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x5b3

    .line 1636
    const-string v3, "1460. blouse n.\u5973\u886c\u8863\uff0c\u77ed\u4e0a\u8863\uff0c\u5bbd\u9614\u7684\u7f69\u886b"

    aput-object v3, v0, v2

    const/16 v2, 0x5b4

    .line 1637
    const-string v3, "1461. mouse n.(pl.mice)\u9f20,\u8017\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x5b5

    .line 1638
    const-string v3, "1462. spouse n.\u914d\u5076(\u6307\u592b\u6216\u59bb)"

    aput-object v3, v0, v2

    const/16 v2, 0x5b6

    .line 1639
    const-string v3, "1463. rouse vt./vi.\u5524\u9192\uff0c\u5524\u8d77\uff1b\u6fc0\u52b1\uff1b\u6fc0\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x5b7

    .line 1640
    const-string v3, "1464. arouse vt.\u5524\u9192\uff0c\u53eb\u9192\uff1b\u5524\u8d77\uff0c\u6fc0\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x5b8

    .line 1641
    const-string v3, "1465. browse vi.\u968f\u610f\u7ffb\u9605\uff0c\u6d4f\u89c8\uff1b(\u725b\u3001\u7f8a\u7b49)\u5403\u8349"

    aput-object v3, v0, v2

    const/16 v2, 0x5b9

    .line 1642
    const-string v3, "1466. analyse vt.\uff08analyze\uff09\u5206\u6790\uff0c\u5206\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0x5ba

    .line 1643
    const-string v3, "1467. debate v./n.\u4e89\u8bba,\u8fa9\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x5bb

    .line 1644
    const-string v3, "1468. dedicate vt.\u5949\u732e;\u732e\u8eab\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x5bc

    .line 1645
    const-string v3, "1469. indicate v.\u6307\u51fa,\u6307\u793a;\u8868\u660e,\u6697\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x5bd

    .line 1646
    const-string v3, "1470. certificate n.\u8bc1(\u660e)\u4e66,\u6267\u7167"

    aput-object v3, v0, v2

    const/16 v2, 0x5be

    .line 1647
    const-string v3, "1471. delicate a.\u7ea4\u5f31\u7684;\u7cbe\u81f4\u7684;\u5fae\u5999\u7684;\u7075\u654f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5bf

    .line 1648
    const-string v3, "1472. complicate v.\u4f7f..\u590d\u6742\uff1b\u4f7f..\u96be\u61c2\uff1b\u4f7f\uff08\u75be\u75c5\u7b49\uff09\u6076\u5316\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x5c0

    .line 1649
    const-string v3, "1473. duplicate n.\u590d\u5236\u54c1 v.\u590d\u5199,\u4f7f\u52a0\u500d a.\u590d\u5236\u7684,\u4e8c\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5c1

    .line 1650
    const-string v3, "1474. communicate v.\u4f20\u8fbe,\u4f20\u9001;\u4ea4\u6d41;\u901a\u8baf,\u901a\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x5c2

    .line 1651
    const-string v3, "1475. fabricate v.\u634f\u9020,\u7f16\u9020(\u8c0e\u8a00,\u501f\u53e3\u7b49);\u5efa\u9020,\u5236\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x5c3

    .line 1652
    const-string v3, "1476. lubricate v.\u6da6\u6ed1,\u52a0\u6da6\u6ed1\u6cb9,\u884c\u8d3f,\u6536\u4e70"

    aput-object v3, v0, v2

    const/16 v2, 0x5c4

    .line 1653
    const-string v3, "1477. intricate a.\u590d\u6742\u7684,\u9519\u7efc\u7684,\u96be\u4ee5\u7406\u89e3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5c5

    .line 1654
    const-string v3, "1478. locate v.\u67e5\u51fa,\u63a2\u51fa,\u67e5\u627e\u2026\u5730\u70b9,\u4f7f\u2026\u5750\u843d\u4e8e,\u4f4d\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x5c6

    .line 1655
    const-string v3, "1479. allocate v.\u5206\u914d\uff0c\u5206\u6d3e\uff1b\u62e8\u7ed9\uff1b\u5212\u5f52"

    aput-object v3, v0, v2

    const/16 v2, 0x5c7

    .line 1656
    const-string v3, "1480. advocate n.\u8fa9\u62a4\u8005\uff0c\u62e5\u62a4\u8005\uff0c\u9f13\u5439\u8005 vt.\u62e5\u62a4\uff0c\u63d0\u5021"

    aput-object v3, v0, v2

    const/16 v2, 0x5c8

    .line 1657
    const-string v3, "1481. educate v.\u6559\u80b2,\u57f9\u517b,\u8bad\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0x5c9

    .line 1658
    const-string v3, "1482. date n.\u65e5\u671f,\u5e74\u4ee3 v.\u6ce8\u660e\u2026\u7684\u65e5\u671f n./v.\u7ea6\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x5ca

    .line 1659
    const-string v3, "1483. up-to-date a.\u73b0\u4ee3\u5316\u7684\uff0c\u6700\u65b0\u7684\uff1b\u8ddf\u4e0a\u65f6\u4ee3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5cb

    .line 1660
    const-string v3, "1484. candidate n.\u5019\u9009\u4eba,\u5019\u8865\u8005;\u62a5\u8003\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x5cc

    .line 1661
    const-string v3, "1485. consolidate v.\u4f7f\u52a0\u56fa\uff0c\u4f7f\u52a0\u5f3a\uff1b(\u628a...)\u8054\u4e3a\u4e00\u4f53\uff0c\u5408\u5e76"

    aput-object v3, v0, v2

    const/16 v2, 0x5cd

    .line 1662
    const-string v3, "1486. intimidate vt.\u80c1\u8feb\uff0c\u5a01\u80c1(\u67d0\u4eba\u505a\u67d0\u4e8b)"

    aput-object v3, v0, v2

    const/16 v2, 0x5ce

    .line 1663
    const-string v3, "1487. accommodate vt.\u5411\u2026\u63d0\u4f9b\u4f4f\u5904\uff1b\u5bf9...\u4e88\u4ee5\u7167\u987e\u6027\u8003\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0x5cf

    .line 1664
    const-string v3, "1488. update v.\u66f4\u65b0,\u4f7f\u73b0\u4ee3\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x5d0

    .line 1665
    const-string v3, "1489. permeate v.\u5f25\u6f2b\uff0c\u904d\u5e03\uff0c\u6563\u5e03\uff1b\u6e17\u5165\uff0c\u6e17\u900f"

    aput-object v3, v0, v2

    const/16 v2, 0x5d1

    .line 1666
    const-string v3, "1490. create v.\u521b\u9020,\u521b\u4f5c;\u5f15\u8d77,\u9020\u6210,\u5efa\u7acb"

    aput-object v3, v0, v2

    const/16 v2, 0x5d2

    .line 1667
    const-string v3, "1491. fate n.\u547d\u8fd0"

    aput-object v3, v0, v2

    const/16 v2, 0x5d3

    .line 1668
    const-string v3, "1492. gate n.\u5927\u95e8\uff1b\u5165\u53e3\uff1b\u89c2\u4f17\u4eba\u6570\uff0c\u95e8\u7968\u6536\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x5d4

    .line 1669
    const-string v3, "1493. delegate n.\u4ee3\u8868 vt.\u59d4\u6d3e\u2026\u4e3a\u4ee3\u8868;\u6388\u6743;\u59d4\u6258"

    aput-object v3, v0, v2

    const/16 v2, 0x5d5

    .line 1670
    const-string v3, "1494. segregate vt.\u4f7f???\u5206\u5f00\uff0c\u9694\u79bb\uff08\u75c5\u60a3\u7b49\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x5d6

    .line 1671
    const-string v3, "1495. irrigate vt.\u704c\u6e89\uff0c\u4fee\u6c34\u5229 vi.\u8fdb\u884c\u704c\u6e89"

    aput-object v3, v0, v2

    const/16 v2, 0x5d7

    .line 1672
    const-string v3, "1496. investigate v.\u8c03\u67e5,\u8c03\u67e5\u7814\u7a76"

    aput-object v3, v0, v2

    const/16 v2, 0x5d8

    .line 1673
    const-string v3, "1497. hate v.\u6068,\u618e\u6068;\u4e0d\u613f,\u4e0d\u559c\u6b22 n.\u6068,\u618e\u6076"

    aput-object v3, v0, v2

    const/16 v2, 0x5d9

    .line 1674
    const-string v3, "1498. appreciate vt.\u4e3a...\u8868\u793a\u611f\u6fc0\uff0c\u611f\u8c22\uff1b\u6b23\u8d4f\uff0c\u8d4f\u8bc6\uff0c\u8bc4\u4ef7"

    aput-object v3, v0, v2

    const/16 v2, 0x5da

    .line 1675
    const-string v3, "1499. associate vt.\u8054\u60f3\uff1b\u4ea4\u5f80\uff1b\u8054\u5408\uff1bn.\u4f19\u4f34\uff1ba.\u8054\u5408\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5db

    .line 1676
    const-string v3, "1500. radiate v.\u653e\u5c04,\u8f90\u5c04;\u6563\u5e03,\u4f20\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0x5dc

    .line 1677
    const-string v3, "1501. immediate a.\u7acb\u5373\u7684,\u5373\u65f6\u7684;\u76f4\u63a5\u7684,\u6700\u63a5\u8fd1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x5dd

    .line 1678
    const-string v3, "1502. intermediate a.\u4e2d\u95f4\u7684,\u5c45\u95f4\u7684;\u4e2d\u7ea7\u7684 n.\u4e2d\u95f4\u4f53,\u5a92\u4ecb\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x5de

    .line 1679
    const-string v3, "1503. affiliate v.\u4f7f\u96b6\u5c5e(\u6216\u9644\u5c5e)\u4e8e n.\u9644\u5c5e\u673a\u6784\uff0c\u5206\u516c\u53f8"

    aput-object v3, v0, v2

    const/16 v2, 0x5df

    .line 1680
    const-string v3, "1504. humiliate v.\u4f7f\u7f9e\u8fb1\uff0c\u4f7f\u4e22\u8138[\u540c]disgrace"

    aput-object v3, v0, v2

    const/16 v2, 0x5e0

    .line 1681
    const-string v3, "1505. appropriate a.\u9002\u5f53\u7684,\u6070\u5f53\u7684,\u7279\u6709\u7684 vt.\u62e8\u7ed9,\u632a\u7528,\u76d7\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x5e1

    .line 1682
    const-string v3, "1506. initiate vt.\u5f00\u59cb\uff0c\u521b\u59cb\uff0c\u53d1\u52a8\uff1b\u542f\u8499\uff0c\u4f7f\u5165\u95e8\uff1b\u5f15\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x5e2

    .line 1683
    const-string v3, "1507. differentiate v.\u533a\u5206,\u533a\u522b;(\u4f7f)\u4e0d\u540c"

    aput-object v3, v0, v2

    const/16 v2, 0x5e3

    .line 1684
    const-string v3, "1508. negotiate v.\u5546\u8ba2\uff1b\u8c08\u5224\uff0c\u6d3d\u8c08\uff0c\u4ea4\u6d89"

    aput-object v3, v0, v2

    const/16 v2, 0x5e4

    .line 1685
    const-string v3, "1509. deviate v.(from)\u80cc\u79bb,\u504f\u79bb"

    aput-object v3, v0, v2

    const/16 v2, 0x5e5

    .line 1686
    const-string v3, "1510. alleviate v.\u51cf\u8f7b\uff0c\u7f13\u548c\uff0c\u7f13\u89e3(\u75db\u82e6\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x5e6

    .line 1687
    const-string v3, "1511. "

    aput-object v3, v0, v2

    const/16 v2, 0x5e7

    .line 1688
    const-string v3, "1512. "

    aput-object v3, v0, v2

    const/16 v2, 0x5e8

    .line 1689
    const-string v3, "1513. skate v.\u6e9c\u51b0,\u6ed1\u51b0 n.\u51b0\u978b"

    aput-object v3, v0, v2

    const/16 v2, 0x5e9

    .line 1690
    const-string v3, "1514. late a.\u8fdf\u7684\uff0c\u665a\u7684\uff0c\u665a\u671f\u7684\uff1b\u5df2\u6545\u7684 ad.\u8fdf\uff0c\u665a"

    aput-object v3, v0, v2

    const/16 v2, 0x5ea

    .line 1691
    const-string v3, "1515. escalate v.(\u4f7f)\u9010\u6b65\u589e\u957f(\u6216\u53d1\u5c55)\uff0c(\u4f7f)\u9010\u6b65\u5347\u7ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x5eb

    .line 1692
    const-string v3, "1516. relate v.\u53d9\u8ff0,\u8bb2\u8ff0;\u4f7f\u4e92\u76f8\u5173\u8054"

    aput-object v3, v0, v2

    const/16 v2, 0x5ec

    .line 1693
    const-string v3, "1517. correlate n.\u76f8\u4e92\u5173\u8054\u7684\u4e8b\u7269 v.(with,to)(\u4f7f)\u4e92\u76f8\u5173\u8054"

    aput-object v3, v0, v2

    const/16 v2, 0x5ed

    .line 1694
    const-string v3, "1518. assimilate vt.\u5438\u6536\uff0c\u6d88\u5316\uff1b\u4f7f\u540c\u5316 vi.\u88ab\u5438\u6536\uff1b\u88ab\u540c\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x5ee

    .line 1695
    const-string v3, "1519. ventilate vt.\u4f7f\u901a\u98ce;\u7ed9\u2026\u88c5\u901a\u98ce\u8bbe\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x5ef

    .line 1696
    const-string v3, "1520. chocolate n.\u5de7\u514b\u529b(\u7cd6),\u8d6d\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x5f0

    .line 1697
    const-string v3, "1521. violate vt.\u8fdd\u80cc;\u5192\u72af;\u59a8\u788d;\u4fb5\u72af;\u4eb5\u6e0e(\u5723\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x5f1

    .line 1698
    const-string v3, "1522. desolate a.\u8352\u51c9\u7684;\u5b64\u72ec\u7684 v.\u4f7f\u8352\u829c"

    aput-object v3, v0, v2

    const/16 v2, 0x5f2

    .line 1699
    const-string v3, "1523. isolate vt.\u9694\u79bb,\u5b64\u7acb"

    aput-object v3, v0, v2

    const/16 v2, 0x5f3

    .line 1700
    const-string v3, "1524. plate n.\u91d1\u5c5e\u677f,\u7247;\u76d8\u5b50,\u76c6\u5b50;\u677f,\u94a2\u677fv.\u9540,\u7535\u9540"

    aput-object v3, v0, v2

    const/16 v2, 0x5f4

    .line 1701
    const-string v3, "1525. contemplate vt.\u76d8\u7b97\uff0c\u8ba1\u8bae\uff1b\u5468\u5bc6\u8003\u8651\uff1b\u6ce8\u89c6\uff0c\u51dd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x5f5

    .line 1702
    const-string v3, "1526. translate v.\u7ffb\u8bd1\uff0c\u89e3\u91ca\uff1b\u8f6c\u5316\uff0c"

    aput-object v3, v0, v2

    const/16 v2, 0x5f6

    .line 1703
    const-string v3, "1527. speculate vi.\u601d\u7d22\uff1b\u63a8\u6d4bvt.\u6295\u673a\uff1b\u601d\u7d22\uff0c\u63a8\u6d4b"

    aput-object v3, v0, v2

    const/16 v2, 0x5f7

    .line 1704
    const-string v3, "1528. articulate a.\u5584\u4e8e\u8868\u8fbe\u7684\uff1b\u6709\u5173\u8282\u76f8\u8fde\u7684 v.\u6e05\u695a\u5730\u8bb2\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x5f8

    .line 1705
    const-string v3, "1529. calculate v.\u8ba1\u7b97,\u63a8\u7b97;\u8ba1\u5212,\u6253\u7b97"

    aput-object v3, v0, v2

    const/16 v2, 0x5f9

    .line 1706
    const-string v3, "1530. circulate v.(\u4f7f)\u5faa\u73af,(\u4f7f)\u6d41\u901a"

    aput-object v3, v0, v2

    const/16 v2, 0x5fa

    .line 1707
    const-string v3, "1531. regulate v.\u7ba1\u5236,\u63a7\u5236;\u8c03\u8282,\u6821\u51c6;\u8c03\u6574"

    aput-object v3, v0, v2

    const/16 v2, 0x5fb

    .line 1708
    const-string v3, "1532. simulate v.\u6a21\u4eff,\u6a21\u62df;\u5047\u88c5,\u5192\u5145"

    aput-object v3, v0, v2

    const/16 v2, 0x5fc

    .line 1709
    const-string v3, "1533. stimulate v.\u523a\u6fc0,\u4f7f\u5174\u594b;\u6fc0\u52b1,\u9f13\u821e"

    aput-object v3, v0, v2

    const/16 v2, 0x5fd

    .line 1710
    const-string v3, "1534. formulate v. \u7528\u516c\u5f0f\u8868\u793a;\u89c4\u5212;\u8bbe\u8ba1;\u7cfb\u7edf\u5730\u9610\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x5fe

    .line 1711
    const-string v3, "1535. accumulate vt.\u5806\u79ef\uff0c\u79ef\u7d2f\uff0c\u79ef\u805avi.\u7d2f\u79ef\uff0c\u805a\u79ef"

    aput-object v3, v0, v2

    const/16 v2, 0x5ff

    .line 1712
    const-string v3, "1536. manipulate vt.(\u719f\u7ec3\u5730)\u4f7f\u7528\uff0c\u64cd\u4f5c\uff1b(\u5de7\u5999\u5730)\u5904\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x600

    .line 1713
    const-string v3, "1537. insulate vt.\u9694\u79bb,\u5b64\u7acb;\u4f7f\u7edd\u7f18,\u4f7f\u7edd\u70ed"

    aput-object v3, v0, v2

    const/16 v2, 0x601

    .line 1714
    const-string v3, "1538. congratulate v.(on)\u795d\u8d3a,\u5411\u2026\u81f4\u8d3a\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x602

    .line 1715
    const-string v3, "1539. mate n.\u4f19\u4f34,\u540c\u4e8b,\u540c\u4f34,\u914d\u5076 v. \u7ed3\u4f34,\u914d\u5bf9,\u4ea4\u914d"

    aput-object v3, v0, v2

    const/16 v2, 0x603

    .line 1716
    const-string v3, "1540. climate n.\u6c14\u5019;\u98ce\u6c14,\u793e\u4f1a\u601d\u6f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x604

    .line 1717
    const-string v3, "1541. legitimate a.\u5408\u6cd5\u7684\uff1b\u5408\u7406\u7684\uff0c\u5408\u4e4e\u903b\u8f91\u7684 vt.\u4f7f\u5408\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x605

    .line 1718
    const-string v3, "1542. ultimate a.\u6700\u540e\u7684,\u6700\u7ec8\u7684;\u6839\u672c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x606

    .line 1719
    const-string v3, "1543. intimate a.\u4eb2\u5bc6\u7684,\u5bc6\u5207\u7684 n.\u719f\u53cb,\u719f\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x607

    .line 1720
    const-string v3, "1544. estimate v./n.\u4f30\u8ba1,\u4f30\u4ef7;\u8bc4\u4f30"

    aput-object v3, v0, v2

    const/16 v2, 0x608

    .line 1721
    const-string v3, "1545. underestimate vt.\u4f4e\u4f30\uff0c\u770b\u8f7b"

    aput-object v3, v0, v2

    const/16 v2, 0x609

    .line 1722
    const-string v3, "1546. approximate a.\u8fd1\u4f3c\u7684 vi.(to)\u63a5\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0x60a

    .line 1723
    const-string v3, "1547. classmate (\u540d)\u540c\u73ed\u540c\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x60b

    .line 1724
    const-string v3, "1548. senate n.\u53c2\u8bae\u9662,\u4e0a\u9662"

    aput-object v3, v0, v2

    const/16 v2, 0x60c

    .line 1725
    const-string v3, "1549. designate v.\u6307\u660e,\u6307\u51fa;\u4efb\u547d,\u6307\u6d3e"

    aput-object v3, v0, v2

    const/16 v2, 0x60d

    .line 1726
    const-string v3, "1550. fascinate v.\u8ff7\u4f4f,\u5f3a\u70c8\u5438\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x60e

    .line 1727
    const-string v3, "1551. subordinate a.(to)\u6b21\u8981\u7684,\u4ece\u5c5e\u7684;\u4e0b\u7ea7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x60f

    .line 1728
    const-string v3, "1552. coordinate a.\u540c\u7b49\u7684,\u5e76\u5217\u7684;\u5750\u6807\u7684 n.\u5750\u6807"

    aput-object v3, v0, v2

    const/16 v2, 0x610

    .line 1729
    const-string v3, "1553. coordinate a.\u540c\u7b49\u7684 n.\u540c\u7b49\u8005,\u5750\u6807 vt.\u534f\u4f5c\uff0c\u534f\u8c03"

    aput-object v3, v0, v2

    const/16 v2, 0x611

    .line 1730
    const-string v3, "1554. originate v.(in,from)\u8d77\u6e90,\u53d1\u751f;\u9996\u521b,\u521b\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x612

    .line 1731
    const-string v3, "1555. contaminate v.\u5f04\u6c61,\u5f04\u810f,\u6bd2\u5bb3,\u4f20\u67d3,\u67d3\u6c61"

    aput-object v3, v0, v2

    const/16 v2, 0x613

    .line 1732
    const-string v3, "1556. eliminate vt.\u9664\u53bb;\u6dd8\u6c70;\u6392(\u5220,\u6d88)\u9664;\u524a\u51cf(\u4eba\u5458)"

    aput-object v3, v0, v2

    const/16 v2, 0x614

    .line 1733
    const-string v3, "1557. discriminate v.\u533a\u522b,\u8fa8\u522b;(against)\u6709\u5dee\u522b\u5730\u5bf9\u5f85,\u6b67\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x615

    .line 1734
    const-string v3, "1558. dominate v.\u652f\u914d,\u7edf\u6cbb,\u63a7\u5236;\u5360\u4f18\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0x616

    .line 1735
    const-string v3, "1559. nominate v.\u63d0\u540d,\u4efb\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0x617

    .line 1736
    const-string v3, "1560. terminate vi.(\u4f7f)\u7ed3\u675f\uff0c(\u4f7f)\u505c\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x618

    .line 1737
    const-string v3, "1561. illuminate vt.\u7167\u4eae\uff0c\u7167\u660e\uff1b\u7528\u706f\u5149\u88c5\u9970\uff1b\u8bf4\u660e\uff0c\u9610\u91ca"

    aput-object v3, v0, v2

    const/16 v2, 0x619

    .line 1738
    const-string v3, "1562. assassinate vt.\u6697\u6740\uff0c\u884c\u523a\uff1b\u4e2d\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0x61a

    .line 1739
    const-string v3, "1563. donate vt.\u635f\u8d60(\u91d1\u94b1\u7b49);\u8d60\u4e88"

    aput-object v3, v0, v2

    const/16 v2, 0x61b

    .line 1740
    const-string v3, "1564. alternate a.\u4ea4\u66ff\u7684\uff0c\u8f6e\u6d41\u7684 v.(\u4f7f)\u4ea4\u66ff\uff0c(\u4f7f)\u8f6e\u6d41"

    aput-object v3, v0, v2

    const/16 v2, 0x61c

    .line 1741
    const-string v3, "1565. fortunate a.\u5e78\u8fd0\u7684,\u4fa5\u5e78\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x61d

    .line 1742
    const-string v3, "1566. anticipate vt.\u9884\u6599\uff1b\u671f\u671b\uff1b\u9884\u5148\u8003\u8651\uff1b\u62a2\u5148\uff1b\u63d0\u524d\u4f7f\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x61e

    .line 1743
    const-string v3, "1567. participate v.(in)\u53c2\u4e0e,\u53c2\u52a0;\u5206\u4eab,\u5206\u62c5;\u542b\u6709,\u5e26\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x61f

    .line 1744
    const-string v3, "1568. dissipate v.\u9a71\u6563;(\u4f7f\u4e91\u3001\u96fe\u3001\u7591\u8651\u7b49)\u6d88\u6563;\u6325\u970d"

    aput-object v3, v0, v2

    const/16 v2, 0x620

    .line 1745
    const-string v3, "1569. rate n.\u901f\u7387;\u7b49\u7ea7;\u4ef7\u683c,\u8d39\u7528 v.\u4f30\u4ef7;\u8bc4\u7ea7,\u8bc4\u4ef7"

    aput-object v3, v0, v2

    const/16 v2, 0x621

    .line 1746
    const-string v3, "1570. separate a.(from)\u5206\u79bb\u7684,\u5206\u5f00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x622

    .line 1747
    const-string v3, "1571. celebrate vt.\u5e86\u795d\uff1b\u9882\u626c\uff0c\u8d5e\u7f8evi.\u5e86\u795d\uff0c\u8fc7\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x623

    .line 1748
    const-string v3, "1572. vibrate v.(\u4f7f)\u632f\u52a8,(\u4f7f)\u6447\u6446\uff1b\u53d7\u2026\u800c\u611f\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x624

    .line 1749
    const-string v3, "1573. carbohydrate n.\u78b3\u6c34\u5316\u5408\u7269; \u7cd6\u7c7b\uff1b(plural)\u6dc0\u7c89\u8d28\u6216\u7cd6\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x625

    .line 1750
    const-string v3, "1574. liberate vt.\u89e3\u653e,\u91ca\u653e"

    aput-object v3, v0, v2

    const/16 v2, 0x626

    .line 1751
    const-string v3, "1575. deliberate a.\u6df1\u601d\u719f\u8651\u7684,\u6545\u610f\u7684 vt.\u7814\u8ba8,\u5546\u8ba8"

    aput-object v3, v0, v2

    const/16 v2, 0x627

    .line 1752
    const-string v3, "1576. considerate a.\u8003\u8651\u5468\u5230\u7684,\u4f53\u8c05\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x628

    .line 1753
    const-string v3, "1577. moderate a.\u6709\u8282\u5236\u7684,\u4e2d\u7b49\u7684,\u9002\u5ea6\u7684,\u6e29\u548c\u7684,\u7a33\u5065\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x629

    .line 1754
    const-string v3, "1578. exaggerate v.\u5938\u5927,\u5938\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0x62a

    .line 1755
    const-string v3, "1579. accelerate v.\u4f7f\u52a0\u901f\uff0c\u4f7f\u589e\u901f\uff0c\u4fc3\u8fdb vi.\u52a0\u5feb\uff0c\u589e\u52a0"

    aput-object v3, v0, v2

    const/16 v2, 0x62b

    .line 1756
    const-string v3, "1580. tolerate vt.\u5bb9\u5fcd,\u9ed8\u8bb8\uff1b\u5bf9(\u836f\u7269\u3001\u6bd2\u54c1\u7b49)\u6709\u8010\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x62c

    .line 1757
    const-string v3, "1581. generate vt.\u4ea7\u751f,\u53d1\u751f;\u751f\u6b96"

    aput-object v3, v0, v2

    const/16 v2, 0x62d

    .line 1758
    const-string v3, "1582. degenerate v.\u8870\u9000,\u5815\u843d,\u8715\u5316 a.\u5815\u843d\u7684 n.\u5815\u843d\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x62e

    .line 1759
    const-string v3, "1583. operate v.\u64cd\u4f5c,\u8fd0\u8f6c,\u5f00\u52a8,\u8d77\u4f5c\u7528,\u52a8\u624b\u672f"

    aput-object v3, v0, v2

    const/16 v2, 0x62f

    .line 1760
    const-string v3, "1584. cooperate v.(with)\u5408\u4f5c,\u534f\u4f5c,\u76f8\u914d\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x630

    .line 1761
    const-string v3, "1585. desperate a.\u4e0d\u987e\u4e00\u5207\u7684\uff0c\u94e4\u800c\u8d70\u9669\u7684\uff1b\u7edd\u671b\u7684\uff0c\u5371\u6025\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x631

    .line 1762
    const-string v3, "1586. illiterate a.\u6587\u76f2\u7684,\u672a\u53d7\u6559\u80b2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x632

    .line 1763
    const-string v3, "1587. integrate v.(into,with)(\u4f7f)\u6210\u4e3a\u4e00\u4f53,(\u4f7f)\u7ed3\u5408\u5728\u4e00\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x633

    .line 1764
    const-string v3, "1588. migrate v.\u8fc1\u79fb,\u79fb\u5c45(\u56fd\u5916)"

    aput-object v3, v0, v2

    const/16 v2, 0x634

    .line 1765
    const-string v3, "1589. emigrate v.(\u53cd)immigrate;(to,from)\u81ea\u672c\u56fd\u79fb\u5c45\u4ed6"

    aput-object v3, v0, v2

    const/16 v2, 0x635

    .line 1766
    const-string v3, "1590. pirate n./v.\u6d77\u76d7,\u76d7\u7248(\u8005)"

    aput-object v3, v0, v2

    const/16 v2, 0x636

    .line 1767
    const-string v3, "1591. elaborate v./a.\u7cbe\u5fc3\u5236\u4f5c(\u7684);\u8be6\u7ec6\u9610\u8ff0(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x637

    .line 1768
    const-string v3, "1592. collaborate vi.\u534f\u4f5c\uff0c\u5408\u4f5c\uff1b(\u4e0e\u654c\u4eba)\u52fe\u7ed3"

    aput-object v3, v0, v2

    const/16 v2, 0x638

    .line 1769
    const-string v3, "1593. decorate v.\u88c5\u9970,\u88c5\u749c,\u5e03\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x639

    .line 1770
    const-string v3, "1594. deteriorate v.(\u4f7f)\u6076\u5316,(\u4f7f)\u53d8\u574f"

    aput-object v3, v0, v2

    const/16 v2, 0x63a

    .line 1771
    const-string v3, "1595. commemorate vt.\u7eaa\u5ff5\uff0c\u5e86\u795d"

    aput-object v3, v0, v2

    const/16 v2, 0x63b

    .line 1772
    const-string v3, "1596. evaporate v.\u84b8\u53d1,\u6325\u53d1;\u6c89\u6dc0;\u53d1\u5c04;\u6d88\u5931"

    aput-object v3, v0, v2

    const/16 v2, 0x63c

    .line 1773
    const-string v3, "1597. incorporate v.\u5408\u5e76,\u7eb3\u5165,\u7ed3\u5408 a.\u5408\u5e76\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x63d

    .line 1774
    const-string v3, "1598. doctorate n.\u535a\u58eb\u5b66\u4f4d;\u535a\u58eb\u5934\u8854"

    aput-object v3, v0, v2

    const/16 v2, 0x63e

    .line 1775
    const-string v3, "1599. penetrate v.\u7a7f\u8fc7,\u6e17\u5165,\u770b\u7a7f"

    aput-object v3, v0, v2

    const/16 v2, 0x63f

    .line 1776
    const-string v3, "1600. concentrate v.(on)\u96c6\u4e2d,\u4e13\u5fc3;\u6d53\u7f29 n.\u6d53\u7f29\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x640

    .line 1777
    const-string v3, "1601. magistrate n.\u5730\u65b9\u884c\u653f\u5b98\uff0c\u5730\u65b9\u6cd5\u5b98\uff0c\u6cbb\u5b89\u5b98"

    aput-object v3, v0, v2

    const/16 v2, 0x641

    .line 1778
    const-string v3, "1602. demonstrate v.\u8bba\u8bc1,\u8bc1\u5b9e;\u6f14\u793a,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x642

    .line 1779
    const-string v3, "1603. illustrate v.\u4e3e\u4f8b\u8bf4\u660e,\u9610\u660e;\u56fe\u89e3,\u52a0\u63d2\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x643

    .line 1780
    const-string v3, "1604. frustrate vt.\u632b\u8d25,\u963b\u6320,\u4f7f\u7070\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x644

    .line 1781
    const-string v3, "1605. accurate a.\u6b63\u786e\u65e0\u8bef\u7684\uff1b\u51c6\u786e\u7684\uff0c\u7cbe\u786e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x645

    .line 1782
    const-string v3, "1606. saturate vt.\u4f7f\u6e7f\u900f\uff0c\u6d78\u900f\uff1b\u4f7f\u5145\u6ee1\uff0c\u4f7f\u9971\u548c"

    aput-object v3, v0, v2

    const/16 v2, 0x646

    .line 1783
    const-string v3, "1607. compensate v.(for)\u8865\u507f,\u8d54\u507f"

    aput-object v3, v0, v2

    const/16 v2, 0x647

    .line 1784
    const-string v3, "1608. dictate v.\u53e3\u6388;(\u4f7f)\u542c\u5199;\u6307\u4ee4,\u6307\u793a,\u547d\u4ee4;"

    aput-object v3, v0, v2

    const/16 v2, 0x648

    .line 1785
    const-string v3, "1609. meditate v.\u60f3,\u8003\u8651,(\u5c24\u6307\u5b97\u6559\u4e0a\u7684)\u6c89\u601d,\u51a5\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0x649

    .line 1786
    const-string v3, "1610. agitate v.\u6447\u52a8(\u6db2\u4f53)\uff1b\u4f7f\u7126\u8651\u4e0d\u5b89\uff1b\u56f0\u6270\uff1b\u9f13\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x64a

    .line 1787
    const-string v3, "1611. facilitate v.\u4f7f\u53d8\u5f97(\u66f4)\u5bb9\u6613;\u4f7f\u4fbf\u5229;\u63a8\u52a8;\u5e2e\u52a9;\u5904\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x64b

    .line 1788
    const-string v3, "1612. imitate v.\u6a21\u4eff,\u4eff\u6548;\u4eff\u9020,\u4f2a\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x64c

    .line 1789
    const-string v3, "1613. irritate vt.\u6fc0\u6012,\u607c\u706b,\u4f7f\u6025\u8e81"

    aput-object v3, v0, v2

    const/16 v2, 0x64d

    .line 1790
    const-string v3, "1614. hesitate v.\u72b9\u8c6b,\u8e0c\u8e87;\u542b\u7cca,\u652f\u543e"

    aput-object v3, v0, v2

    const/16 v2, 0x64e

    .line 1791
    const-string v3, "1615. necessitate v.\u4f7f\u6210\u4e3a\u5fc5\u8981,\u9700\u8981"

    aput-object v3, v0, v2

    const/16 v2, 0x64f

    .line 1792
    const-string v3, "1616. rotate v.(\u4f7f)\u65cb\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0x650

    .line 1793
    const-string v3, "1617. state n.\u72b6\u6001,\u60c5\u51b5;\u56fd,\u5dde v.\u9648\u8ff0,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x651

    .line 1794
    const-string v3, "1618. estate n.\u623f\u5730\u4ea7;\u4e0d\u52a8\u4ea7;\u6240\u6709\u6743;\u5730\u4f4d;\u751f\u6d3b\u72b6\u51b5"

    aput-object v3, v0, v2

    const/16 v2, 0x652

    .line 1795
    const-string v3, "1619. evacuate vt.\u64a4\u79bb\uff0c\u758f\u6563\uff0c\u6392\u6cc4\uff0c\u5265\u593a"

    aput-object v3, v0, v2

    const/16 v2, 0x653

    .line 1796
    const-string v3, "1620. graduate n.\u5927\u5b66\u6bd5\u4e1a\u751f,\u7814\u7a76\u751f v.\u5927\u5b66\u6bd5\u4e1aa.\u6bd5\u4e86\u4e1a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x654

    .line 1797
    const-string v3, "1621. undergraduate n.\u5927\u5b66\u751f,\u5927\u5b66\u8086\u4e1a\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x655

    .line 1798
    const-string v3, "1622. evaluate v.\u4f30\u4ef7,\u8bc4\u4ef7;\u6c42\u2026\u7684\u503c"

    aput-object v3, v0, v2

    const/16 v2, 0x656

    .line 1799
    const-string v3, "1623. adequate adj.\u5145\u8db3\u7684\uff0c\u8db3\u591f\u7684\uff1b\u9002\u5f53\u7684\uff0c\u80dc\u4efb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x657

    .line 1800
    const-string v3, "1624. fluctuate v.(\u4f7f)\u6ce2\u52a8;(\u4f7f)\u8d77\u4f0f"

    aput-object v3, v0, v2

    const/16 v2, 0x658

    .line 1801
    const-string v3, "1625. aggravate vt.\u52a0\u91cd(\u5267),\u4f7f\u6076\u5316\uff1b\u6fc0\u6012,\u4f7f\u607c\u706b"

    aput-object v3, v0, v2

    const/16 v2, 0x659

    .line 1802
    const-string v3, "1626. elevate vt.\u4e3e\u8d77,\u63d0\u62d4,\u632f\u594b,\u63d0\u5347...\u7684\u804c\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x65a

    .line 1803
    const-string v3, "1627. private a.\u79c1\u4eba\u7684,\u4e2a\u4eba\u7684,\u79d8\u5bc6\u7684,\u79c1\u4e0b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x65b

    .line 1804
    const-string v3, "1628. activate vt.\u542f\u52a8\uff0c\u6fc0\u6d3b\uff1b\u9a71\u52a8\uff0c\u9a71\u4f7f\uff1b\u4f7f\u5f00\u59cb\u8d77\u4f5c\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x65c

    .line 1805
    const-string v3, "1629. cultivate v.\u8015\u4f5c,\u683d\u57f9,\u517b\u6b96;\u57f9\u517b,\u6559\u517b,\u78e8\u70bc"

    aput-object v3, v0, v2

    const/16 v2, 0x65d

    .line 1806
    const-string v3, "1630. motivate vt.\u4fc3\u52a8\uff1b\u6fc0\u52b1\uff0c\u9f13\u52b1\uff0c\u4f5c\u4e3a\u2026\u7684\u52a8\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x65e

    .line 1807
    const-string v3, "1631. renovate v.\u66f4\u65b0,\u4fee\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0x65f

    .line 1808
    const-string v3, "1632. delete vt.\u5220\u9664"

    aput-object v3, v0, v2

    const/16 v2, 0x660

    .line 1809
    const-string v3, "1633. athlete n.\u8fd0\u52a8\u5458\uff0c\u4f53\u80b2\u5bb6\uff0c\u8eab\u5f3a\u529b\u58ee\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x661

    .line 1810
    const-string v3, "1634. obsolete a.\u5df2\u5e9f\u5f03\u7684,\u8fc7\u65f6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x662

    .line 1811
    const-string v3, "1635. complete a.\u5b8c\u5168\u7684,\u5706\u6ee1\u7684 v.\u5b8c\u6210,\u7ed3\u675f,\u4f7f\u5b8c\u6ee1"

    aput-object v3, v0, v2

    const/16 v2, 0x663

    .line 1812
    const-string v3, "1636. compete vi.\u6bd4\u8d5b\uff1b\u7ade\u4e89\uff1b\u5bf9\u6297"

    aput-object v3, v0, v2

    const/16 v2, 0x664

    .line 1813
    const-string v3, "1637. concrete a.\u5177\u4f53\u7684,\u5b9e\u8d28\u6027\u7684n.\u6df7\u51dd\u571fv.\u7528\u6df7\u51dd\u571f\u4fee\u7b51"

    aput-object v3, v0, v2

    const/16 v2, 0x665

    .line 1814
    const-string v3, "1638. bite v./n.\u54ac,\u53ee n.\u4e00\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x666

    .line 1815
    const-string v3, "1639. cite v.\u5f15\u7528,\u5f15\u8bc1,\u4e3e(\u4f8b)"

    aput-object v3, v0, v2

    const/16 v2, 0x667

    .line 1816
    const-string v3, "1640. recite v.\u80cc\u8bf5,\u6717\u8bf5"

    aput-object v3, v0, v2

    const/16 v2, 0x668

    .line 1817
    const-string v3, "1641. excite v.\u523a\u6fc0,\u4f7f\u6fc0\u52a8;\u6fc0\u53d1,\u6fc0\u52b1"

    aput-object v3, v0, v2

    const/16 v2, 0x669

    .line 1818
    const-string v3, "1642. white a.\u767d\u8272\u7684\uff1b\u82cd\u767d\u7684\uff1b\u767d\u79cd\u7684 n.\u767d\u8272\uff1b\u767d\u79cd\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x66a

    .line 1819
    const-string v3, "1643. kite n.\u98ce\u7b5d"

    aput-object v3, v0, v2

    const/16 v2, 0x66b

    .line 1820
    const-string v3, "1644. elite n.<\u6cd5>[\u96c6\u5408\u540d\u8bcd]\u7cbe\u534e;\u7cbe\u9510;\u4e2d\u575a\u5206\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x66c

    .line 1821
    const-string v3, "1645. satellite n.\u536b\u661f,\u4eba\u9020\u536b\u661f;\u9644\u5c5e\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x66d

    .line 1822
    const-string v3, "1646. polite a.\u6709\u793c\u8c8c\u7684,\u5ba2\u6c14\u7684;\u6709\u6559\u517b\u7684,\u6587\u96c5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x66e

    .line 1823
    const-string v3, "1647. ignite v.\u70b9\u706b,\u5f15\u71c3"

    aput-object v3, v0, v2

    const/16 v2, 0x66f

    .line 1824
    const-string v3, "1648. finite a.\u6709\u9650\u7684\uff1b[\u6570]\u6709\u7a77\u7684,\u9650\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x670

    .line 1825
    const-string v3, "1649. definite a.\u660e\u786e\u7684;\u4e00\u5b9a\u7684;\u610f\u5fd7\u575a\u5f3a\u7684,\u7acb\u573a\u575a\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x671

    .line 1826
    const-string v3, "1650. infinite a.\u65e0\u9650\u7684,\u65e0\u7a77\u7684 n.\u65e0\u9650"

    aput-object v3, v0, v2

    const/16 v2, 0x672

    .line 1827
    const-string v3, "1651. unite vi.\u8054\u5408,\u56e2\u7ed3;\u7edf\u4e00,\u5408\u5e76vt.\u4f7f\u8054\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x673

    .line 1828
    const-string v3, "1652. spite n.\u6076\u610f;\u6028\u6068"

    aput-object v3, v0, v2

    const/16 v2, 0x674

    .line 1829
    const-string v3, "1653. despite prep.\u4e0d\u7ba1,\u4e0d\u987e"

    aput-object v3, v0, v2

    const/16 v2, 0x675

    .line 1830
    const-string v3, "1654. favorite n.(favourite)\u6700\u559c\u6b22\u7684\u4eba\u6216\u7269 a.\u559c\u7231\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x676

    .line 1831
    const-string v3, "1655. write v.\u5199\uff0c\u4e66\u5199\uff0c\u5199\u5b57\uff1b\u5199\u4f5c\uff1b\u5199\u4fe1(\u7ed9)\uff0c\u51fd\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0x677

    .line 1832
    const-string v3, "1656. site n.\u4f4d\u7f6e,\u573a\u6240,\u5730\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x678

    .line 1833
    const-string v3, "1657. parasite n.\u5bc4\u751f\u866b,\u98df\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0x679

    .line 1834
    const-string v3, "1658. exquisite a.\u4f18\u7f8e\u7684\uff0c\u9ad8\u96c5\u7684\uff0c\u7cbe\u81f4\u7684\uff1b\u5267\u70c8\u7684\uff0c\u5f02\u5e38\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x67a

    .line 1835
    const-string v3, "1659. composite a.\u6df7\u5408\u6210\u7684\uff0c\u7efc\u5408\u6210\u7684n.\u5408\u6210\u7269\uff0c\u590d\u5408\u6750\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x67b

    .line 1836
    const-string v3, "1660. opposite a.\u5bf9\u9762\u7684,\u76f8\u5bf9\u7684,\u76f8\u53cd\u7684 n.\u5bf9\u7acb\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x67c

    .line 1837
    const-string v3, "1661. appetite n.\u98df\u6b32\uff0c\u80c3\u53e3\uff1b\u6b32\u671b\uff0c\u6027\u6b32\uff1b\u7231\u597d\uff0c\u8da3\u5473"

    aput-object v3, v0, v2

    const/16 v2, 0x67d

    .line 1838
    const-string v3, "1662. quite ad.\u5341\u5206,\u5b8c\u5168;\u76f8\u5f53,\u9887;\u7684\u786e,\u771f\u6b63"

    aput-object v3, v0, v2

    const/16 v2, 0x67e

    .line 1839
    const-string v3, "1663. suite n.\u5957\u95f4\uff1b\u4e00\u5957\u5bb6\u5177\uff1b\u5957\uff0c\u7ec4\uff0c\u7cfb\u5217"

    aput-object v3, v0, v2

    const/16 v2, 0x67f

    .line 1840
    const-string v3, "1664. invite vt.\u9080\u8bf7,\u62db\u5f85"

    aput-object v3, v0, v2

    const/16 v2, 0x680

    .line 1841
    const-string v3, "1665. anecdote n.\u8f76\u4e8b\uff0c\u8da3\u95fb\uff0c\u77ed\u6545\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x681

    .line 1842
    const-string v3, "1666. remote a.\u8fdc\u7684,\u9065\u8fdc\u7684,\u758f\u8fdc\u7684,\u504f\u50fb\u7684,\u7ec6\u5fae\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x682

    .line 1843
    const-string v3, "1667. promote v.\u4fc3\u8fdb,\u53d1\u626c;\u63d0\u5347,\u63d0\u62d4;\u589e\u8fdb,\u52a9\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0x683

    .line 1844
    const-string v3, "1668. note n.\u7b14\u8bb0;\u6309\u8bed,\u6ce8\u91ca;\u949e\u7968,\u7eb8\u5e01v.\u8bb0\u4e0b,\u6458\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x684

    .line 1845
    const-string v3, "1669. denote vt.\u8868\u793a,\u610f\u5473\u7740"

    aput-object v3, v0, v2

    const/16 v2, 0x685

    .line 1846
    const-string v3, "1670. quote v.\u5f15\u7528,\u63f4\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x686

    .line 1847
    const-string v3, "1671. vote n.\u6295\u7968,\u8868\u51b3;\u9009\u7968,\u9009\u7968\u6570 v.\u6295\u7968,\u8868\u51b3"

    aput-object v3, v0, v2

    const/16 v2, 0x687

    .line 1848
    const-string v3, "1672. devote v.(to)\u5949\u732e,\u81f4\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x688

    .line 1849
    const-string v3, "1673. haste n.\u5306\u5fd9,\u6025\u901f;\u8349\u7387 v.\u8d76\u5feb;\u5306\u5fd9"

    aput-object v3, v0, v2

    const/16 v2, 0x689

    .line 1850
    const-string v3, "1674. paste n.\u7cca,\u6d46\u7cca v.\u7c98,\u8d34"

    aput-object v3, v0, v2

    const/16 v2, 0x68a

    .line 1851
    const-string v3, "1675. taste v.\u54c1\u5c1d;(of)\u6709\u2026\u5473\u9053;\u4f53\u9a8c n.\u6ecb\u5473;\u5473\u89c9"

    aput-object v3, v0, v2

    const/16 v2, 0x68b

    .line 1852
    const-string v3, "1676. waste v.\u6d6a\u8d39 a.\u65e0\u7528\u7684;\u8352\u829c\u7684 n.\u6d6a\u8d39;\u5e9f\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x68c

    .line 1853
    const-string v3, "1677. cassette n.\u76d2\u5b50;\u76d2\u5f0f\u78c1\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x68d

    .line 1854
    const-string v3, "1678. tribute n.\u8d21\u54c1;\u9882\u8bcd,\u79f0\u8d5e,(\u8868\u793a\u656c\u610f\u7684)\u793c\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x68e

    .line 1855
    const-string v3, "1679. contribute v.(to)\u8d21\u732e,\u6350\u52a9,\u6350\u732e;\u6295\u7a3f"

    aput-object v3, v0, v2

    const/16 v2, 0x68f

    .line 1856
    const-string v3, "1680. distribute v.\u5206\u53d1;\u5206\u914d;\u5206\u5e03;\u914d(\u7535);(over)\u6563\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0x690

    .line 1857
    const-string v3, "1681. attribute v.(to)\u5f52\u56e0\u4e8e,\u5f52\u5c5e\u4e8e n.\u5c5e\u6027,\u54c1\u8d28,\u7279\u5f81"

    aput-object v3, v0, v2

    const/16 v2, 0x691

    .line 1858
    const-string v3, "1682. acute a.\u5267\u70c8\u7684\uff1b\u654f\u9510\u7684\uff1b\u6210\u9510\u89d2\u7684\uff1b\u5c16\u7684\uff0c\u9ad8\u97f3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x692

    .line 1859
    const-string v3, "1683. prosecute vt.\u5b9e\u884c\uff0c\u4ece\u4e8b v.\u8d77\u8bc9\uff0c\u544a\u53d1 vi.\u4f5c\u68c0\u5bdf\u5b98"

    aput-object v3, v0, v2

    const/16 v2, 0x693

    .line 1860
    const-string v3, "1684. persecute v.\u8feb\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0x694

    .line 1861
    const-string v3, "1685. execute v.\u5b9e\u884c;\u5b9e\u65bd;\u6267\u884c;\u5b8c\u6210;\u5c65\u884c;\u5904\u6b7b"

    aput-object v3, v0, v2

    const/16 v2, 0x695

    .line 1862
    const-string v3, "1686. refute v.\u53cd\u9a73,\u9a73\u65a5"

    aput-object v3, v0, v2

    const/16 v2, 0x696

    .line 1863
    const-string v3, "1687. parachute n.\u964d\u843d\u4f1e v.\u8df3\u4f1e"

    aput-object v3, v0, v2

    const/16 v2, 0x697

    .line 1864
    const-string v3, "1688. salute v./n.\u656c\u793c,\u9e23\u793c\u70ae;\u8fce\u63a5,\u6b22\u8fce"

    aput-object v3, v0, v2

    const/16 v2, 0x698

    .line 1865
    const-string v3, "1689. dilute vt.\u7a00\u91ca\uff0c\u51b2\u6de1 a.\u7a00\u91ca\u7684\uff0c\u51b2\u6de1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x699

    .line 1866
    const-string v3, "1690. pollute v.\u5f04\u810f,\u6c61\u67d3"

    aput-object v3, v0, v2

    const/16 v2, 0x69a

    .line 1867
    const-string v3, "1691. absolute a.\u7edd\u5bf9\u7684\uff0c\u5b8c\u5168\u7684\uff1b\u786e\u5b9e\u7684\uff0c\u80af\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x69b

    .line 1868
    const-string v3, "1692. resolute a.\u575a\u51b3\u7684,\u679c\u65ad\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x69c

    .line 1869
    const-string v3, "1693. mute a.\u54d1\u7684,\u7f04\u9ed8\u7684n.\u54d1\u5df4;\u5f31\u97f3\u5668v.\u51cf\u5f31\u2026\u7684\u58f0\u97f3"

    aput-object v3, v0, v2

    const/16 v2, 0x69d

    .line 1870
    const-string v3, "1694. commute v.\u4e58\u516c\u4ea4\u8f66\u4e0a\u4e0b\u73ed,\u4e58\u8f66(\u8239\u7b49)\u5f80\u8fd4\u4e8e\u4e24\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x69e

    .line 1871
    const-string v3, "1695. minute n.\u5206\u949f,\u7247\u523b;(pl.)\u4f1a\u8bae\u8bb0\u5f55a.\u5fae\u5c0f\u7684,\u5fae\u7ec6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x69f

    .line 1872
    const-string v3, "1696. route n.\u8def\u7ebf,\u8def\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0x6a0

    .line 1873
    const-string v3, "1697. compute v./n.\u8ba1\u7b97,\u4f30\u8ba1"

    aput-object v3, v0, v2

    const/16 v2, 0x6a1

    .line 1874
    const-string v3, "1698. dispute n.\u4e89\u8bba,\u4e89\u6267 v.\u4e89\u8bba,\u8fa9\u8bba;\u53cd\u9a73;\u6000\u7591;\u963b\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x6a2

    .line 1875
    const-string v3, "1699. statute n.\u6210\u6587\u6cd5\uff0c\u6cd5\u4ee4\uff0c\u6cd5\u89c4\uff1b\u7ae0\u7a0b\uff0c\u89c4\u5219\uff0c\u6761\u4f8b"

    aput-object v3, v0, v2

    const/16 v2, 0x6a3

    .line 1876
    const-string v3, "1700. substitute n.\u4ee3\u66ff\u8005\uff1b\u66ff\u8eab\uff1b\u4ee3\u7528\u54c1 v.(for)\u4ee3\u66ff,\u66ff\u6362"

    aput-object v3, v0, v2

    const/16 v2, 0x6a4

    .line 1877
    const-string v3, "1701. institute n.\u5b66\u4f1a,\u7814\u7a76\u6240;\u5b66\u9662 v.\u8bbe\u7acb,\u8bbe\u7f6e,\u5236\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x6a5

    .line 1878
    const-string v3, "1702. constitute vt.\u7ec4\u6210\uff0c\u6784\u6210\uff0c\u5f62\u6210\uff1b\u8bbe\u7acb\uff0c\u5efa\u7acb\uff0c\u4efb\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0x6a6

    .line 1879
    const-string v3, "1703. cue \u6697\u793a, \u63d0\u793a, \u7403\u6746"

    aput-object v3, v0, v2

    const/16 v2, 0x6a7

    .line 1880
    const-string v3, "1704. barbecue n.\u70e4\u8089\uff1b\u70e4\u8089\u7528\u7684\u53f0\u67b6 vt.\u7099\u70e4(\u8089\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x6a8

    .line 1881
    const-string v3, "1705. rescue v./n.\u8425\u6551,\u63f4\u6551"

    aput-object v3, v0, v2

    const/16 v2, 0x6a9

    .line 1882
    const-string v3, "1706. due a.(to)\u5e94\u652f\u4ed8\u7684;(\u8f66,\u8239\u7b49)\u9884\u5b9a\u5e94\u5230\u8fbe\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6aa

    .line 1883
    const-string v3, "1707. queue n.\u884c\u5217,\u957f\u961f v.(up)\u6392\u961f,\u6392\u961f\u7b49\u5f85"

    aput-object v3, v0, v2

    const/16 v2, 0x6ab

    .line 1884
    const-string v3, "1708. league n.\u540c\u76df,\u8054\u76df;\u8054\u5408\u4f1a,\u793e\u56e2"

    aput-object v3, v0, v2

    const/16 v2, 0x6ac

    .line 1885
    const-string v3, "1709. colleague n.\u540c\u4e8b,\u540c\u50da"

    aput-object v3, v0, v2

    const/16 v2, 0x6ad

    .line 1886
    const-string v3, "1710. plague n.\u761f\u75ab,\u707e\u5bb3,\u9ebb\u70e6,\u82e6\u607c vt.\u6298\u78e8,\u4f7f\u82e6\u607c"

    aput-object v3, v0, v2

    const/16 v2, 0x6ae

    .line 1887
    const-string v3, "1711. vague a.\u4e0d\u660e\u786e\u7684,\u542b\u7cca\u7684,\u66a7\u6627\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6af

    .line 1888
    const-string v3, "1712. intrigue n.\u9634\u8c0bv.\u5bc6\u8c0b,\u79c1\u901a;\u6fc0\u8d77\u2026\u7684\u5174\u8da3;\u8be1\u8ba1\u53d6\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x6b0

    .line 1889
    const-string v3, "1713. fatigue n./v.(\u4f7f)\u75b2\u52b3"

    aput-object v3, v0, v2

    const/16 v2, 0x6b1

    .line 1890
    const-string v3, "1714. tongue n.\u820c;\u8bed\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x6b2

    .line 1891
    const-string v3, "1715. analogue n.\u7c7b\u4f3c\u7269\uff1b\u76f8\u4f3c\u4f53\uff1b\u6a21\u62df"

    aput-object v3, v0, v2

    const/16 v2, 0x6b3

    .line 1892
    const-string v3, "1716. argue vi.\u8fa9\u8bba\uff0c\u4e89\u8bba vt.\u8fa9\u8bba\uff0c\u8bba\u8bc1\uff1b\u8bf4\u670d\uff0c\u529d\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x6b4

    .line 1893
    const-string v3, "1717. value n.\u4ef7\u683c;\u4ef7\u503c;\u5b9e\u7528\u6027 v.\u8bc4\u4ef7,\u4f30\u4ef7;\u5c0a\u91cd"

    aput-object v3, v0, v2

    const/16 v2, 0x6b5

    .line 1894
    const-string v3, "1718. blue a.\u84dd\u8272\u7684;\u9752\u7070\u8272\u7684\uff1b\u6cae\u4e27\u7684,\u9634\u90c1\u7684 n.\u84dd\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x6b6

    .line 1895
    const-string v3, "1719. clue n.\u7ebf\u7d22,\u6697\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x6b7

    .line 1896
    const-string v3, "1720. glue n.\u80f6,\u80f6\u6c34 v.\u80f6\u5408,\u7c98\u8d34"

    aput-object v3, v0, v2

    const/16 v2, 0x6b8

    .line 1897
    const-string v3, "1721. avenue n.\u6797\u836b\u8def\uff0c\u5927\u8857\uff1b(\u6bd4\u55bb)\u9014\u5f84\uff0c\u6e20\u9053\uff0c\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x6b9

    .line 1898
    const-string v3, "1722. revenue n.\u8d22\u653f\u6536\u5165,\u7a0e\u6536"

    aput-object v3, v0, v2

    const/16 v2, 0x6ba

    .line 1899
    const-string v3, "1723. continue v.\u7ee7\u7eed,\u8fde\u7eed,\u5ef6\u4f38"

    aput-object v3, v0, v2

    const/16 v2, 0x6bb

    .line 1900
    const-string v3, "1724. opaque a.\u4e0d\u900f\u660e(\u5149)\u7684;\u96be\u7406\u89e3\u7684,\u6666\u6da9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6bc

    .line 1901
    const-string v3, "1725. cheque n.(check)\u652f\u7968,\u7a7a\u767d\u652f\u7968;\u603b\u6536\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x6bd

    .line 1902
    const-string v3, "1726. technique n.\u6280\u5de7\uff0c\u624b\u827a\uff0c\u6280\u80fd\uff1b\u6280\u672f\uff0c\u5de5\u827a"

    aput-object v3, v0, v2

    const/16 v2, 0x6be

    .line 1903
    const-string v3, "1727. unique a.\u552f\u4e00\u7684,\u72ec\u4e00\u65e0\u4e8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6bf

    .line 1904
    const-string v3, "1728. antique a.\u53e4\u5f0f\u7684\uff0c\u8fc7\u65f6\u7684\u3000n.\u6709\u4ef7\u503c\u7684\u53e4\u7269\uff0c\u53e4\u8463"

    aput-object v3, v0, v2

    const/16 v2, 0x6c0

    .line 1905
    const-string v3, "1729. true a.\u771f\u5b9e\uff0c\u4e0d\u5047\u7684\uff1b\u5fe0\u5b9e\uff0c\u53ef\u9760\u7684\uff1b\u6b63\u786e\u65e0\u8bef\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6c1

    .line 1906
    const-string v3, "1730. sue v.\u63a7\u544a,\u5bf9\u2026\u63d0\u51fa\u8bc9\u8bbc,\u8d77\u8bc9"

    aput-object v3, v0, v2

    const/16 v2, 0x6c2

    .line 1907
    const-string v3, "1731. pursue v.\u8ffd\u8d76,\u8ffd\u8e2a;\u7ee7\u7eed,\u4ece\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x6c3

    .line 1908
    const-string v3, "1732. issue n.\u95ee\u9898,\u4e89\u7aef,\u53d1\u884c(\u7269),\u671f\u53f7 vt.\u53d1\u884c,\u6d41\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x6c4

    .line 1909
    const-string v3, "1733. tissue n.\u7ec7\u7269,\u8584\u7ee2,\u7eb8\u5dfe;(\u52a8,\u690d\u7269\u7684)\u7ec4\u7ec7"

    aput-object v3, v0, v2

    const/16 v2, 0x6c5

    .line 1910
    const-string v3, "1734. statue n.\u5851\u50cf,\u96d5\u50cf"

    aput-object v3, v0, v2

    const/16 v2, 0x6c6

    .line 1911
    const-string v3, "1735. virtue n.\u5fb7\u884c,\u7f8e\u5fb7;\u8d1e\u64cd;\u4f18\u70b9;\u529f\u6548,\u6548\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x6c7

    .line 1912
    const-string v3, "1736. cave n.\u6d1e,\u7a74"

    aput-object v3, v0, v2

    const/16 v2, 0x6c8

    .line 1913
    const-string v3, "1737. heave v.(\u7528\u529b)\u4e3e\uff0c\u63d0\uff0c\u62c9\uff1b\u6254\uff1b\u62d6\uff1b\u5455\u5410n.\u4e3e\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x6c9

    .line 1914
    const-string v3, "1738. leave v.\u79bb\u5f00;\u7559\u4e0b,\u5fd8\u5e26;\u8ba9,\u542c\u4efb;\u4ea4\u4ed8n.\u8bb8\u53ef;\u5047\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x6ca

    .line 1915
    const-string v3, "1739. weave v.\u7f16(\u7ec7) n.\u7f16\u7ec7\u6cd5\uff0c\u7f16\u7ec7\u5f0f\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x6cb

    .line 1916
    const-string v3, "1740. have v.\u6709\uff0c\u5177\u6709\uff1b\u4f53\u4f1a\uff0c\u7ecf\u53d7\uff1b\u4ece\u4e8b\uff1b\u4f7f\uff1b\u5403\uff0c\u559d"

    aput-object v3, v0, v2

    const/16 v2, 0x6cc

    .line 1917
    const-string v3, "1741. behave v.\u4e3e\u6b62,\u4e3e\u52a8,\u8868\u73b0;\u8fd0\u8f6c,\u5f00\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x6cd

    .line 1918
    const-string v3, "1742. shave v.\u5243,\u522e,\u5228,\u524a n.\u522e\u8138"

    aput-object v3, v0, v2

    const/16 v2, 0x6ce

    .line 1919
    const-string v3, "1743. slave n.\u5974\u96b6,\u82e6\u5de5 v.\u505a\u82e6\u5de5,\u62fc\u547d\u5730\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0x6cf

    .line 1920
    const-string v3, "1744. pave v.\u94fa\u780c,\u94fa(\u8def)"

    aput-object v3, v0, v2

    const/16 v2, 0x6d0

    .line 1921
    const-string v3, "1745. brave a.\u52c7\u6562\u7684 v.\u52c7\u6562\u5730\u9762\u5bf9(\u5371\u9669\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x6d1

    .line 1922
    const-string v3, "1746. grave n.\u575f\u5893 a.\u4e25\u8083\u7684,\u5e84\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6d2

    .line 1923
    const-string v3, "1747. save v.\u6551,\u62ef\u6551;\u50a8\u84c4,\u8d2e\u5b58;\u8282\u7701"

    aput-object v3, v0, v2

    const/16 v2, 0x6d3

    .line 1924
    const-string v3, "1748. wave n.\u6ce2\u6d6a;(\u6325\u624b)\u793a\u610f;\u98d8\u626c v.(\u6325\u624b)\u793a\u610f,\u81f4\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x6d4

    .line 1925
    const-string v3, "1749. eve n.(\u8282\u65e5\u7b49\u7684)\u524d\u591c,\u524d\u5915"

    aput-object v3, v0, v2

    const/16 v2, 0x6d5

    .line 1926
    const-string v3, "1750. sleeve n.\u8896\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x6d6

    .line 1927
    const-string v3, "1751. achieve vt.\u5b9e\u73b0\uff0c\u5b8c\u6210\uff1b\u8fbe\u5230\uff0c\u5f97\u5230vi.\u8fbe\u5230\u9884\u671f\u76ee\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6d7

    .line 1928
    const-string v3, "1752. believe vt.\u76f8\u4fe1\uff0c\u8ba4\u4e3a vi.\u76f8\u4fe1\uff0c\u4fe1\u4efb\uff0c\u4fe1\u5949"

    aput-object v3, v0, v2

    const/16 v2, 0x6d8

    .line 1929
    const-string v3, "1753. relieve v.\u51cf\u8f7b,\u89e3\u9664,\u63f4\u6551,\u6551\u6d4e,\u6362\u73ed"

    aput-object v3, v0, v2

    const/16 v2, 0x6d9

    .line 1930
    const-string v3, "1754. grieve v.\u4f7f\u60b2\u4f24,\u4f7f\u4f24\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x6da

    .line 1931
    const-string v3, "1755. retrieve vt.\u91cd\u65b0\u5f97\u5230\uff0c\u53d6\u56de\uff1b\u633d\u56de\uff0c\u8865\u6551\uff1b\u68c0\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x6db

    .line 1932
    const-string v3, "1756. naive a.\u5929\u771f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6dc

    .line 1933
    const-string v3, "1757. dive v./n.\u6f5c\u6c34,\u8df3\u6c34,\u4fef\u51b2"

    aput-object v3, v0, v2

    const/16 v2, 0x6dd

    .line 1934
    const-string v3, "1758. deceive v.\u6b3a\u9a97,\u8499\u853d"

    aput-object v3, v0, v2

    const/16 v2, 0x6de

    .line 1935
    const-string v3, "1759. receive v.\u6536\u5230,\u63a5\u5230;\u906d\u53d7,\u53d7\u5230;\u63a5\u5f85,\u63a5\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x6df

    .line 1936
    const-string v3, "1760. conceive v.(of)\u8bbe\u60f3,\u6784\u601d,\u60f3\u8c61;\u4ee5\u4e3a;\u6000\u80ce,\u6000\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x6e0

    .line 1937
    const-string v3, "1761. perceive v.\u5bdf\u89c9,\u611f\u77e5;\u7406\u89e3,\u9886\u609f"

    aput-object v3, v0, v2

    const/16 v2, 0x6e1

    .line 1938
    const-string v3, "1762. five num.\u4e94 pron./a.\u4e94(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x6e2

    .line 1939
    const-string v3, "1763. "

    aput-object v3, v0, v2

    const/16 v2, 0x6e3

    .line 1940
    const-string v3, "1764. "

    aput-object v3, v0, v2

    const/16 v2, 0x6e4

    .line 1941
    const-string v3, "1765. give v.\u7ed9\uff0c\u6388\u4e88\uff1b\u4f9b\u7ed9\uff1b\u732e\u51fa\uff0c\u8ba9\u6b65\uff1b\u6350\u8d60\uff1b\u53d1\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x6e5

    .line 1942
    const-string v3, "1766. forgive v.\u539f\u8c05,\u9976\u6055"

    aput-object v3, v0, v2

    const/16 v2, 0x6e6

    .line 1943
    const-string v3, "1767. live v.\u6d3b\u7740,\u751f\u6d3b,\u5c45\u4f4f a.\u6d3b\u7684,\u751f\u52a8\u7684,\u76f4\u64ad\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6e7

    .line 1944
    const-string v3, "1768. alive a.\u6d3b\u7740\u7684\uff1b\u5b58\u5728\u7684\uff1b\u6d3b\u8dc3\u7684\uff1b(to)\u654f\u611f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6e8

    .line 1945
    const-string v3, "1769. drive v.\u5f00(\u8f66);\u9a71;\u9a71\u52a8,\u628a(\u9489,\u6869)\u6253\u5165 n.\u9a7e\u9a76"

    aput-object v3, v0, v2

    const/16 v2, 0x6e9

    .line 1946
    const-string v3, "1770. derive v.\u53d6\u5f97;\u5bfc\u51fa;\u5f15\u7533;\u6765\u81ea;\u6e90\u81ea;\u51fa\u81ea"

    aput-object v3, v0, v2

    const/16 v2, 0x6ea

    .line 1947
    const-string v3, "1771. thrive v.\u5174\u65fa,\u7e41\u8363"

    aput-object v3, v0, v2

    const/16 v2, 0x6eb

    .line 1948
    const-string v3, "1772. deprive vt.\u5265\u593a,\u593a\u53bb,\u4f7f\u4e27\u5931"

    aput-object v3, v0, v2

    const/16 v2, 0x6ec

    .line 1949
    const-string v3, "1773. arrive vi.\u5230\u8fbe\uff1b(\u65f6\u95f4\u3001\u4e8b\u4ef6)\u5230\u6765\uff0c\u53d1\u751f\uff1b\u8fbe\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x6ed

    .line 1950
    const-string v3, "1774. contrive vt.\u8c0b\u5212\uff0c\u7b56\u5212\uff1b\u8bbe\u6cd5\u505a\u5230\uff1b\u8bbe\u8ba1\uff0c\u60f3\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x6ee

    .line 1951
    const-string v3, "1775. strive v.\u594b\u6597,\u52aa\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x6ef

    .line 1952
    const-string v3, "1776. cohesive a.\u7c98\u5408\u6027\u7684\uff0c\u6709\u7ed3\u5408\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f0

    .line 1953
    const-string v3, "1777. decisive a.\u51b3\u5b9a\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f1

    .line 1954
    const-string v3, "1778. offensive a.\u5192\u72af\u7684,\u653b\u51fb\u7684 n.\u653b\u52bf,\u8fdb\u653b"

    aput-object v3, v0, v2

    const/16 v2, 0x6f2

    .line 1955
    const-string v3, "1779. comprehensive a.\u5185\u5bb9\u5e7f\u6cdb\u7684,\u603b\u62ec\u6027\u7684\uff0c\u7efc\u5408\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f3

    .line 1956
    const-string v3, "1780. expensive a.\u82b1\u8d39\u7684,\u6602\u8d35\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f4

    .line 1957
    const-string v3, "1781. intensive a.\u52a0\u5f3a\u7684,\u96c6\u4e2d\u7684,\u6df1\u5165\u7ec6\u81f4\u7684,\u7cbe\u8015\u7ec6\u4f5c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f5

    .line 1958
    const-string v3, "1782. extensive a.\u5e7f\u5927\u7684,\u5e7f\u9614\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f6

    .line 1959
    const-string v3, "1783. explosive a.\u7206\u70b8(\u6027)\u7684,\u7206\u53d1(\u6027)\u7684 n.\u7206\u70b8\u7269,\u70b8\u836f"

    aput-object v3, v0, v2

    const/16 v2, 0x6f7

    .line 1960
    const-string v3, "1784. massive a.\u5927\u800c\u91cd\u7684,\u539a\u5b9e\u7684,\u7c97\u5927\u7684;\u5927\u89c4\u6a21\u7684,\u5927\u91cf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f8

    .line 1961
    const-string v3, "1785. passive a.\u88ab\u52a8\u7684,\u6d88\u6781\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6f9

    .line 1962
    const-string v3, "1786. successive a.\u63a5\u8fde\u7684,\u8fde\u7eed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6fa

    .line 1963
    const-string v3, "1787. excessive a.\u8fc7\u591a\u7684;\u8fc7\u5206\u7684;\u989d\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0x6fb

    .line 1964
    const-string v3, "1788. aggressive a.\u4fb5\u7565\u7684\uff0c\u597d\u6597\u7684\uff0c\u6709\u8fdb\u53d6\u5fc3\u7684\uff0c\u6562\u4f5c\u6562\u4e3a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6fc

    .line 1965
    const-string v3, "1789. progressive a.\u8fdb\u6b65\u7684,\u5148\u8fdb\u7684;\u524d\u8fdb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6fd

    .line 1966
    const-string v3, "1790. impressive a.\u7ed9\u4eba\u6df1\u523b\u5370\u8c61\u7684,\u611f\u4eba\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6fe

    .line 1967
    const-string v3, "1791. inclusive a.(of)\u5305\u62ec\u7684,\u5305\u542b\u7684;\u8303\u56f4\u5e7f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x6ff

    .line 1968
    const-string v3, "1792. exclusive a.\u72ec\u5360\u7684;\u6392\u4ed6\u7684;\u5b64\u9ad8\u7684;\u552f\u4e00\u7684;\u9ad8\u7ea7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x700

    .line 1969
    const-string v3, "1793. indicative a.(of)\u6307\u793a\u7684,\u6697\u793a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x701

    .line 1970
    const-string v3, "1794. creative a.\u6709\u521b\u9020\u529b\u7684,\u521b\u9020\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x702

    .line 1971
    const-string v3, "1795. negative a.\u5426\u5b9a\u7684,\u6d88\u6781\u7684,\u9634\u6027\u7684 n.\u8d1f\u6570;(\u6444\u5f71)\u5e95\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x703

    .line 1972
    const-string v3, "1796. initiative a.\u521b\u59cb\u7684,\u8d77\u59cb\u7684 n.\u7b2c\u4e00\u6b65,\u521b\u59cb,\u4e3b\u52a8\u7cbe\u795e"

    aput-object v3, v0, v2

    const/16 v2, 0x704

    .line 1973
    const-string v3, "1797. relative a.\u76f8\u5bf9\u7684,\u6bd4\u8f83\u7684,\u6709\u5173\u7cfb\u7684 n.\u4eb2\u621a,\u5173\u7cfb\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x705

    .line 1974
    const-string v3, "1798. native a.\u672c\u5730\u7684,\u672c\u56fd\u7684;\u5929\u751f\u7684 n.\u672c\u5730\u4eba,\u672c\u56fd\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x706

    .line 1975
    const-string v3, "1799. imaginative a.\u5bcc\u6709\u60f3\u8c61\u529b\u7684,\u7231\u60f3\u8c61\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x707

    .line 1976
    const-string v3, "1800. alternative n.\u4e8c\u9009\u4e00\uff1b\u4f9b\u9009\u62e9\u7684\u4e1c\u897f\uff1b\u53d6\u820d a.\u4e8c\u9009\u4e00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x708

    .line 1977
    const-string v3, "1801. comparative a.\u6bd4\u8f83\u7684,\u76f8\u5f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x709

    .line 1978
    const-string v3, "1802. imperative n.\u547d\u4ee4;\u9700\u8981;\u89c4\u5219;\u7948\u4f7f\u8bed\u6c14a.\u5f3a\u5236\u7684;\u7d27\u6025\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x70a

    .line 1979
    const-string v3, "1803. cooperative a.\u5408\u4f5c\u7684,\u534f\u4f5c\u7684 n.\u5408\u4f5c\u793e"

    aput-object v3, v0, v2

    const/16 v2, 0x70b

    .line 1980
    const-string v3, "1804. narrative a.\u53d9\u8ff0\u6027\u7684 n.\u53d9\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x70c

    .line 1981
    const-string v3, "1805. qualitative a.\u6027\u8d28\u4e0a\u7684,\u5b9a\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x70d

    .line 1982
    const-string v3, "1806. quantitative a.\u6570\u91cf\u7684,\u5b9a\u91cf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x70e

    .line 1983
    const-string v3, "1807. representative n.\u4ee3\u8868,\u4ee3\u7406\u4eba a.(of)\u5178\u578b\u7684,\u6709\u4ee3\u8868\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x70f

    .line 1984
    const-string v3, "1808. tentative a.\u8bd5\u63a2\u6027\u7684\uff0c\u6682\u65f6\u7684\uff1b\u72b9\u8c6b\u4e0d\u51b3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x710

    .line 1985
    const-string v3, "1809. conservative a.\u4fdd\u5b88\u7684,\u5b88\u65e7\u7684 n.\u4fdd\u5b88\u4e3b\u4e49\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x711

    .line 1986
    const-string v3, "1810. active adj.\u6d3b\u8dc3\u7684\uff0c\u654f\u6377\u7684\uff0c\u79ef\u6781\u7684\uff1b\u5728\u6d3b\u52a8\u4e2d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x712

    .line 1987
    const-string v3, "1811. radioactive a.\u653e\u5c04\u6027,\u653e\u5c04\u5f15\u8d77\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x713

    .line 1988
    const-string v3, "1812. attractive a.\u5438\u5f15\u4eba\u7684\uff0c\u5f15\u4eba\u6ce8\u610f\u7684\uff1b\u6f02\u4eae\u7684\uff0c\u8ff7\u4eba\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x714

    .line 1989
    const-string v3, "1813. effective a.\u6709\u6548\u7684,\u751f\u6548\u7684;\u88ab\u5b9e\u65bd\u7684;\u7ed9\u4eba\u6df1\u523b\u5370\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x715

    .line 1990
    const-string v3, "1814. objective n.\u76ee\u6807,\u76ee\u7684 a.\u5ba2\u89c2\u7684,\u771f\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x716

    .line 1991
    const-string v3, "1815. subjective a.\u4e3b\u89c2(\u4e0a)\u7684\uff0c\u4e2a\u4eba\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x717

    .line 1992
    const-string v3, "1816. adjective n.\u5f62\u5bb9\u8bcd a.\u5f62\u5bb9\u8bcd\u7684\uff0c\u7528\u4f5c\u5f62\u5bb9\u8bcd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x718

    .line 1993
    const-string v3, "1817. collective n.\u96c6\u4f53 a.\u96c6\u4f53\u7684,\u5171\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x719

    .line 1994
    const-string v3, "1818. respective a.\u5404\u81ea\u7684,\u5404\u4e2a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x71a

    .line 1995
    const-string v3, "1819. irrespective a.\u4e0d\u987e\u7684,\u4e0d\u8003\u8651\u7684,\u65e0\u5173\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x71b

    .line 1996
    const-string v3, "1820. prospective a.\u9884\u671f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x71c

    .line 1997
    const-string v3, "1821. perspective n.\u900f\u89c6\u753b\u6cd5,\u900f\u89c6\u56fe;\u8fdc\u666f,\u524d\u9014;\u89c2\u70b9,\u770b\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x71d

    .line 1998
    const-string v3, "1822. detective n.\u4fa6\u63a2"

    aput-object v3, v0, v2

    const/16 v2, 0x71e

    .line 1999
    const-string v3, "1823. productive a.\u751f\u4ea7(\u6027)\u7684,\u80fd\u4ea7\u7684,\u591a\u4ea7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x71f

    .line 2000
    const-string v3, "1824. destructive a.\u7834\u574f\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x720

    .line 2001
    const-string v3, "1825. primitive a.\u539f\u59cb\u7684,\u8fdc\u53e4\u7684,\u65e9\u671f\u7684;\u7c97\u7cd9\u7684,\u7b80\u5355\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x721

    .line 2002
    const-string v3, "1826. cognitive a.\u8ba4\u77e5\u7684\uff0c\u8ba4\u8bc6\u80fd\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x722

    .line 2003
    const-string v3, "1827. sensitive a.(to)\u654f\u611f\u7684,\u6613\u53d7\u4f24\u5bb3\u7684;\u7075\u654f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x723

    .line 2004
    const-string v3, "1828. positive a.\u80af\u5b9a\u7684,\u79ef\u6781\u7684,\u7edd\u5bf9\u7684,\u65e0\u7591\u7684,\u6b63\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x724

    .line 2005
    const-string v3, "1829. competitive a.\u7ade\u4e89\u7684\uff1b\u597d\u7ade\u4e89\u7684\uff1b(\u4ef7\u683c\u7b49\u7684)\u6709\u7ade\u4e89\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x725

    .line 2006
    const-string v3, "1830. incentive n.\u523a\u6fc0;\u52a8\u529b;\u9f13\u52b1;\u8bf1\u56e0;\u52a8\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x726

    .line 2007
    const-string v3, "1831. motive n.\u52a8\u673a,\u76ee\u7684 a.\u53d1\u52a8\u7684,\u8fd0\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x727

    .line 2008
    const-string v3, "1832. locomotive n.\u673a\u8f66,\u706b\u8f66\u5934 a.\u8fd0\u52a8\u7684,\u79fb\u52a8\u7684,\u8fd0\u8f7d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x728

    .line 2009
    const-string v3, "1833. captive n.\u4fd8\u864f a.\u88ab\u4fd8\u864f\u7684,\u88ab\u76d1\u7981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x729

    .line 2010
    const-string v3, "1834. consecutive a.\u8fde\u7eed\u7684\uff1b\u8fde\u8d2f\u7684\uff1b\u987a\u5e8f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x72a

    .line 2011
    const-string v3, "1835. executive n.\u603b\u7ecf\u7406,\u8463\u4e8b,\u884c\u653f\u8d1f\u8d23\u4eba a.\u6267\u884c\u7684,\u5b9e\u65bd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x72b

    .line 2012
    const-string v3, "1836. revive v.\u6062\u590d;(\u4f7f)\u590d\u82cf"

    aput-object v3, v0, v2

    const/16 v2, 0x72c

    .line 2013
    const-string v3, "1837. survive v.\u5e78\u514d\u4e8e,\u5e78\u5b58;\u6bd4\u2026\u957f\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0x72d

    .line 2014
    const-string v3, "1838. valve n.\u9600;(\u82f1)\u7535\u5b50\u7ba1,\u771f\u7a7a\u7ba1;(\u5fc3\u810f\u7684\uff09\u74e3\u819c"

    aput-object v3, v0, v2

    const/16 v2, 0x72e

    .line 2015
    const-string v3, "1839. twelve num.\u5341\u4e8c pron./a.\u5341\u4e8c(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x72f

    .line 2016
    const-string v3, "1840. solve v.\u89e3\u51b3,\u89e3\u7b54"

    aput-object v3, v0, v2

    const/16 v2, 0x730

    .line 2017
    const-string v3, "1841. resolve v.\u51b3\u5fc3;(\u4f7f)\u5206\u89e3,\u6eb6\u89e3;\u51b3\u8bae n.\u89e3\u51b3;\u51b3\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x731

    .line 2018
    const-string v3, "1842. dissolve v.(\u4f7f)\u6eb6\u89e3,(\u4f7f)\u878d\u5316;\u89e3\u6563,\u53d6\u6d88"

    aput-object v3, v0, v2

    const/16 v2, 0x732

    .line 2019
    const-string v3, "1843. evolve v.(\u4f7f)\u53d1\u5c55;(\u4f7f)\u8fdb\u5316;(\u4f7f)\u8fdb\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0x733

    .line 2020
    const-string v3, "1844. revolve v.(\u4f7f)\u65cb\u8f6c;\u8003\u8651;\u3010\u5929\u3011\u516c\u8f6c,\u5faa\u73af"

    aput-object v3, v0, v2

    const/16 v2, 0x734

    .line 2021
    const-string v3, "1845. involve v.\u5377\u5165,\u9677\u5165,\u8fde\u7d2f;\u5305\u542b,\u542b\u6709,\u6d89\u53ca"

    aput-object v3, v0, v2

    const/16 v2, 0x735

    .line 2022
    const-string v3, "1846. above a.\u4e0a\u8ff0\u7684 ad.\u5728\u4e0a\u9762  prep.\u5728..\u4e4b\u4e0a\uff0c\u9ad8\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x736

    .line 2023
    const-string v3, "1847. dove n.\u9e3d\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x737

    .line 2024
    const-string v3, "1848. shove vt.\u4e71\u63a8\uff1b\u4e71\u585evi.\u7528\u529b\u63a8\uff0c\u6324n.\u731b\u63a8"

    aput-object v3, v0, v2

    const/16 v2, 0x738

    .line 2025
    const-string v3, "1849. love n.\u7231\uff0c\u7231\u60c5\uff0c\u559c\u6b22 vt.\u7231\uff0c\u70ed\u7231\uff1b\u7231\u597d\uff0c\u559c\u6b22"

    aput-object v3, v0, v2

    const/16 v2, 0x739

    .line 2026
    const-string v3, "1850. glove n.\u624b\u5957"

    aput-object v3, v0, v2

    const/16 v2, 0x73a

    .line 2027
    const-string v3, "1851. move v.\u79fb\u52a8,\u8fc1\u79fb;\u6d3b\u52a8;\u611f\u52a8 n.\u79fb\u52a8,\u6d3b\u52a8,\u884c\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x73b

    .line 2028
    const-string v3, "1852. remove v.\u79fb\u52a8,\u8131\u6389,\u8c03\u52a8,\u514d\u804c"

    aput-object v3, v0, v2

    const/16 v2, 0x73c

    .line 2029
    const-string v3, "1853. prove v.\u8bc1\u660e,\u8bc1\u5b9e;\u68c0\u9a8c;\u8003\u9a8c;\u9274\u5b9a;\u7ed3\u679c\u662f,\u8868\u660e\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x73d

    .line 2030
    const-string v3, "1854. improve v.\u6539\u5584,\u6539\u8fdb,\u589e\u8fdb;\u597d\u8f6c,\u8fdb\u6b65"

    aput-object v3, v0, v2

    const/16 v2, 0x73e

    .line 2031
    const-string v3, "1855. approve v.(of)\u8d5e\u6210\uff0c\u8d5e\u8bb8\uff0c\u540c\u610f\uff1b\u6279\u51c6\uff0c\u5ba1\u8bae\uff0c\u901a\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x73f

    .line 2032
    const-string v3, "1856. stove n.\u7089\u5b50,\u706b\u7089"

    aput-object v3, v0, v2

    const/16 v2, 0x740

    .line 2033
    const-string v3, "1857. carve v.(\u96d5)\u523b"

    aput-object v3, v0, v2

    const/16 v2, 0x741

    .line 2034
    const-string v3, "1858. starve v.(\u4f7f)\u997f\u6b7b,\u997f\u5f97\u614c,\u6328\u997f"

    aput-object v3, v0, v2

    const/16 v2, 0x742

    .line 2035
    const-string v3, "1859. nerve n.\u795e\u7ecf;\u52c7\u6562,\u80c6\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x743

    .line 2036
    const-string v3, "1860. serve v.\u670d\u52a1,\u5c3d\u8d23;\u62db\u5f85,\u4f8d\u5019;\u7b26\u5408,\u9002\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x744

    .line 2037
    const-string v3, "1861. observe v.\u89c2\u5bdf,\u89c2\u6d4b,\u6ce8\u610f\u5230,\u76d1\u89c6,\u9075\u5b88,\u8bc4\u8ff0,\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x745

    .line 2038
    const-string v3, "1862. deserve v.\u5e94\u53d7,\u503c\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x746

    .line 2039
    const-string v3, "1863. reserve n.\u50a8\u5907(\u7269),\u50a8\u5907\u91d1;\u7f04\u9ed8 v.\u4fdd\u7559,\u50a8\u5907;\u9884\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x747

    .line 2040
    const-string v3, "1864. preserve v.\u4fdd\u62a4,\u7ef4\u6301;\u4fdd\u5b58,\u4fdd\u85cf"

    aput-object v3, v0, v2

    const/16 v2, 0x748

    .line 2041
    const-string v3, "1865. curve n.\u66f2\u7ebf,\u5f2f\u66f2(\u7269) v.\u5f04\u5f2f,\u6210\u66f2\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x749

    .line 2042
    const-string v3, "1866. we pron\uff0e\u6211\u4eec<\u4e3b\u683c>"

    aput-object v3, v0, v2

    const/16 v2, 0x74a

    .line 2043
    const-string v3, "1867. awe n.\u656c\u754f\uff0c\u60ca\u60e7vt.\u4f7f\u656c\u754f\uff0c\u4f7f\u60ca\u60e7"

    aput-object v3, v0, v2

    const/16 v2, 0x74b

    .line 2044
    const-string v3, "1868. owe v.\u6b20(\u503a\u7b49),\u5e94\u5411\u2026\u4ed8\u51fa,\u5f52\u529f\u4e8e,\u5f97\u611f\u8c22"

    aput-object v3, v0, v2

    const/16 v2, 0x74c

    .line 2045
    const-string v3, "1869. axe n.\uff08ax\uff09\u65a7\u5b50\uff1b\u524a\u51cf vt.\u7528\u65a7\u780d"

    aput-object v3, v0, v2

    const/16 v2, 0x74d

    .line 2046
    const-string v3, "1870. dye n.\u67d3\u6599 v.\u67d3,\u67d3\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x74e

    .line 2047
    const-string v3, "1871. eye n.\u773c(\u775b)\uff1b\u89c6\u529b\uff1b\u773c\u529b\uff1b\u76d1\u7763vt.\u770b\uff0c\u5ba1\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x74f

    .line 2048
    const-string v3, "1872. gaze v./n.\u51dd\u89c6,\u6ce8\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x750

    .line 2049
    const-string v3, "1873. blaze n.\u706b\u7130;\u706b\u5149;\u95ea\u5149,\u5149\u8f89  v.\u71c3\u70e7,\u5192\u706b\u7130"

    aput-object v3, v0, v2

    const/16 v2, 0x751

    .line 2050
    const-string v3, "1874. amaze vt.\u4f7f\u60ca\u5947\uff0c\u4f7f\u60ca\u6115\uff1b\u4f7f\u56f0\u60d1 vi.\u8868\u73b0\u51fa\u60ca\u5947"

    aput-object v3, v0, v2

    const/16 v2, 0x752

    .line 2051
    const-string v3, "1875. graze vi.\u5403\u9752\u8349 vt.\u653e\u7267;\u64e6\u4f24;\u63a0\u8fc7 .n.\u64e6\u4f24(\u5904)"

    aput-object v3, v0, v2

    const/16 v2, 0x753

    .line 2052
    const-string v3, "1876. sneeze vi.\u6253\u55b7\u568f\uff0c\u53d1\u55b7\u568f\u58f0n.\u55b7\u568f"

    aput-object v3, v0, v2

    const/16 v2, 0x754

    .line 2053
    const-string v3, "1877. breeze n.\u5fae\u98ce\uff1b\u8f7b\u800c\u6613\u4e3e\u7684\u4e8b vi.\u6765\u53bb\u5306\u5306\uff0c\u6025\u901f\u8d70"

    aput-object v3, v0, v2

    const/16 v2, 0x755

    .line 2054
    const-string v3, "1878. freeze v.\u4f7f\u7ed3\u51b0,\u4f7f\u51dd\u56fa"

    aput-object v3, v0, v2

    const/16 v2, 0x756

    .line 2055
    const-string v3, "1879. squeeze v.\u538b\u69a8,\u6324 n.\u69a8\u53d6,\u52d2\u7d22"

    aput-object v3, v0, v2

    const/16 v2, 0x757

    .line 2056
    const-string v3, "1880. criticize v.(criticise)\u6279\u8bc4,\u8bc4\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x758

    .line 2057
    const-string v3, "1881. seize v.\u6293\u4f4f,\u902e\u4f4f;\u593a\u53d6,\u5360\u9886;\u6ca1\u6536,\u67e5\u5c01"

    aput-object v3, v0, v2

    const/16 v2, 0x759

    .line 2058
    const-string v3, "1882. sympathize v.(sympathise)(with)\u540c\u60c5;\u5171\u9e23,\u540c\u611f;\u8d5e\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0x75a

    .line 2059
    const-string v3, "1883. specialize v.(specialise)(in)\u4e13\u653b,\u4e13\u95e8\u7814\u7a76,\u4e13\u4e1a\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x75b

    .line 2060
    const-string v3, "1884. industrialize v.(industrialise)(\u4f7f)\u5de5\u4e1a\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x75c

    .line 2061
    const-string v3, "1885. generalize v.(generalise)\u5f52\u7eb3,\u6982\u62ec;\u63a8\u5e7f,\u666e\u53ca"

    aput-object v3, v0, v2

    const/16 v2, 0x75d

    .line 2062
    const-string v3, "1886. mobilize v.(mobilise)\u52a8\u5458,\u8d4b\u4e88\u53ef\u52a8\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x75e

    .line 2063
    const-string v3, "1887. utilize vt.\u5229\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x75f

    .line 2064
    const-string v3, "1888. civilize v.(=civilise)\u4f7f\u6587\u660e,\u5f00\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x760

    .line 2065
    const-string v3, "1889. minimize v.(minimize)\u4f7f\u51cf\u5c11\u5230\u6700\u5c11,\u4f7f\u964d\u5230\u6700\u4f4e"

    aput-object v3, v0, v2

    const/16 v2, 0x761

    .line 2066
    const-string v3, "1890. organize v.(organise)\u7ec4\u7ec7,\u7f16\u7ec4"

    aput-object v3, v0, v2

    const/16 v2, 0x762

    .line 2067
    const-string v3, "1891. recognize v.(recognise)\u8ba4\u51fa,\u627f\u8ba4,\u516c\u8ba4,\u8d4f\u8bc6,\u8868\u626c"

    aput-object v3, v0, v2

    const/16 v2, 0x763

    .line 2068
    const-string v3, "1892. summarize v.(summarise)\u6982\u62ec,\u603b\u7ed3"

    aput-object v3, v0, v2

    const/16 v2, 0x764

    .line 2069
    const-string v3, "1893. characterize v.(characterise)\u8868\u793a\u2026\u7684\u7279\u6027;\u63cf\u8ff0\u2026\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x765

    .line 2070
    const-string v3, "1894. prize n.\u5956\u8d4f,\u5956\u91d1,\u5956\u54c1 v.\u73cd\u89c6,\u73cd\u60dc"

    aput-object v3, v0, v2

    const/16 v2, 0x766

    .line 2071
    const-string v3, "1895. size n.\u5927\u5c0f,\u5c3a\u5bf8,\u89c4\u6a21;\u5c3a\u7801"

    aput-object v3, v0, v2

    const/16 v2, 0x767

    .line 2072
    const-string v3, "1896. emphasize v.(emphasise)\u5f3a\u8c03"

    aput-object v3, v0, v2

    const/16 v2, 0x768

    .line 2073
    const-string v3, "1897. bronze n.\u9752\u94dc\uff1b\u9752\u94dc\u8272\uff0c\u53e4\u94dc\u8272\uff1b\u9752\u94dc\u5236\u54c1\uff0c\u94dc\u724c"

    aput-object v3, v0, v2

    const/16 v2, 0x769

    .line 2074
    const-string v3, "1898. doze v./n.\u778c\u7761;\u5047\u5bd0"

    aput-object v3, v0, v2

    const/16 v2, 0x76a

    .line 2075
    const-string v3, "1899. paralyze v.(paralyse)\u4f7f\u762b\u75ea(\u9ebb\u75f9);\u4f7f\u4e27\u5931\u4f5c\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x76b

    .line 2076
    const-string v3, "1900. deaf a.\u804b\u7684;\u4e0d\u613f\u542c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x76c

    .line 2077
    const-string v3, "1901. leaf n.\u53f6\u5b50;(\u4e66\u520a\u7684)\u4e00\u9875,\u4e00\u5f20;\u91d1\u5c5e\u8584\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x76d

    .line 2078
    const-string v3, "1902. loaf n.\u4e00\u4e2a\u9762\u5305"

    aput-object v3, v0, v2

    const/16 v2, 0x76e

    .line 2079
    const-string v3, "1903. beef n.\u725b\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x76f

    .line 2080
    const-string v3, "1904. chef n.(\u9910\u9986\u7b49\u7684)\u53a8\u5e08\u957f\uff0c\u53a8\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x770

    .line 2081
    const-string v3, "1905. chief a.\u4e3b\u8981\u7684,\u9996\u8981\u7684 n.\u9996\u9886,\u9886\u8896"

    aput-object v3, v0, v2

    const/16 v2, 0x771

    .line 2082
    const-string v3, "1906. handkerchief n.\u624b\u5e15"

    aput-object v3, v0, v2

    const/16 v2, 0x772

    .line 2083
    const-string v3, "1907. mischief n.\u635f\u5bb3,\u4f24\u5bb3,\u5371\u5bb3;\u6076\u4f5c\u5267,\u80e1\u95f9;\u707e\u7978"

    aput-object v3, v0, v2

    const/16 v2, 0x773

    .line 2084
    const-string v3, "1908. thief n.(thieves)\u8d3c\uff1b\u5c0f\u5077"

    aput-object v3, v0, v2

    const/16 v2, 0x774

    .line 2085
    const-string v3, "1909. belief n.\u4fe1\u4efb\uff0c\u76f8\u4fe1\uff0c\u4fe1\u5ff5\uff1b\u4fe1\u4ef0\uff0c\u4fe1\u6761"

    aput-object v3, v0, v2

    const/16 v2, 0x775

    .line 2086
    const-string v3, "1910. relief n.(\u75db\u82e6\u7b49)\u51cf\u8f7b,\u89e3\u9664;\u63f4\u6551,\u6551\u6d4e"

    aput-object v3, v0, v2

    const/16 v2, 0x776

    .line 2087
    const-string v3, "1911. brief a.\u7b80\u77ed\u7684,\u7b80\u6d01\u7684 v.\u7b80\u77ed\u4ecb\u7ecd,\u7b80\u8981\u6c47\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x777

    .line 2088
    const-string v3, "1912. grief n.\u60b2\u4f24\uff0c\u60b2\u75db\uff1b\u60b2\u4f24\u7684\u4e8b\uff0c\u60b2\u75db\u7684\u7f18\u7531"

    aput-object v3, v0, v2

    const/16 v2, 0x778

    .line 2089
    const-string v3, "1913. staff n.\u5168\u4f53\u804c\u5de5;\u6760,\u68d2;\u53c2\u8c0b\u90e8 v.\u914d\u5907\u5de5\u4f5c\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x779

    .line 2090
    const-string v3, "1914. cliff n.\u60ac\u5d16;\u5ced\u58c1"

    aput-object v3, v0, v2

    const/16 v2, 0x77a

    .line 2091
    const-string v3, "1915. sniff vi.\u55c5\u2026\u5473\u9053\uff1b\u62bd\u9f3b\u6d95\uff1b\u5bf9\u55e4\u4e4b\u4ee5\u9f3b\uff0c\u8511\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x77b

    .line 2092
    const-string v3, "1916. tariff n.\u5173\u7a0e,\u7a0e\u7387;(\u65c5\u9986,\u996d\u5e97\u7b49)\u4ef7\u76ee\u8868,\u6536\u8d39\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x77c

    .line 2093
    const-string v3, "1917. stiff a.\u786c\u7684,\u50f5\u76f4\u7684;\u62d8\u8c28\u7684;\u5446\u677f\u7684;\u8270\u96be\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x77d

    .line 2094
    const-string v3, "1918. off ad.\u79bb\u5f00\uff1b\u5728\u8fdc\u5904\uff1b\u8131\u5f00 prep.\u4ece\uff0c\u4ece...\u79bb\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x77e

    .line 2095
    const-string v3, "1919. layoff n.\u4e34\u65f6\u89e3\u96c7,\u64cd\u4f5c\u505c\u6b62,\u6d3b\u52a8\u505c\u6b62\u671f\u95f4,\u5931\u4e1a\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x77f

    .line 2096
    const-string v3, "1920. puff n.\u4e00\u9635,\u4e00\u80a1(\u6c14\u5473\u7b49);\u5598\u606f;\u5439\u5618v.\u5598\u606f,\u9f13\u5439"

    aput-object v3, v0, v2

    const/16 v2, 0x780

    .line 2097
    const-string v3, "1921. stuff n.\u539f\u6599,\u6750\u6599,\u4e1c\u897f v.\u586b\u6ee1,\u585e\u6ee1"

    aput-object v3, v0, v2

    const/16 v2, 0x781

    .line 2098
    const-string v3, "1922. if conj.(\u7528\u4e8e\u8fde\u63a5\u5bbe\u8bed\u4ece\u53e5)\u662f\u5426\uff1b\u662f\u4e0d\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x782

    .line 2099
    const-string v3, "1923. half n.\u534a\uff0c\u4e00\u534a a.\u4e00\u534a\u7684\uff0c\u4e0d\u5b8c\u5168\u7684 ad.\u4e00\u534a\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x783

    .line 2100
    const-string v3, "1924. behalf n.\u5229\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0x784

    .line 2101
    const-string v3, "1925. shelf n.\u67b6\u5b50,\u6401\u677f"

    aput-object v3, v0, v2

    const/16 v2, 0x785

    .line 2102
    const-string v3, "1926. self n.\u81ea\u6211\uff0c\u81ea\u5df1(pl.selves)"

    aput-object v3, v0, v2

    const/16 v2, 0x786

    .line 2103
    const-string v3, "1927. oneself pron.[\u53cd\u8eab\u4ee3\u8bcd]\u81ea\u5df1\uff1b\u4eb2\u81ea\uff0c\u672c\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x787

    .line 2104
    const-string v3, "1928. himself pron.[\u53cd\u8eab\u4ee3\u8bcd]\u4ed6\u81ea\u5df1\uff1b\u4ed6\u672c\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x788

    .line 2105
    const-string v3, "1929. herself pron.[\u53cd\u8eab\u4ee3\u8bcd]\u5979\u81ea\u5df1\uff1b\u5979\u4eb2\u81ea\uff0c\u5979\u672c\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x789

    .line 2106
    const-string v3, "1930. yourself pron.[\u53cd\u8eab\u4ee3\u8bcd]\u4f60\u81ea\u5df1\uff1b\u4f60\u4eb2\u81ea"

    aput-object v3, v0, v2

    const/16 v2, 0x78a

    .line 2107
    const-string v3, "1931. itself pron.(it\u7684\u53cd\u8eab\u4ee3\u8bcd)\u5b83\u81ea\u5df1\uff0c\u5b83\u672c\u8eab"

    aput-object v3, v0, v2

    const/16 v2, 0x78b

    .line 2108
    const-string v3, "1932. myself pron.[\u53cd\u8eab\u4ee3\u8bcd]\u6211\u81ea\u5df1\uff1b\u6211\u4eb2\u81ea"

    aput-object v3, v0, v2

    const/16 v2, 0x78c

    .line 2109
    const-string v3, "1933. golf n.\u9ad8\u5c14\u592b\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0x78d

    .line 2110
    const-string v3, "1934. wolf n.\u72fc"

    aput-object v3, v0, v2

    const/16 v2, 0x78e

    .line 2111
    const-string v3, "1935. gulf n.\u6d77\u6e7e"

    aput-object v3, v0, v2

    const/16 v2, 0x78f

    .line 2112
    const-string v3, "1936. of prep.\u2026\u7684\uff1b\u5728\u2026\u4e4b\u4e2d\uff1b\u7528\u2026\u5236\u7684\uff1b\u5173\u4e8e\u2026\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x790

    .line 2113
    const-string v3, "1937. roof n.\u5c4b\u9876,\u9876"

    aput-object v3, v0, v2

    const/16 v2, 0x791

    .line 2114
    const-string v3, "1938. proof n.\u8bc1\u636e,\u8bc1\u660e;\u6821\u6837,\u6837\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0x792

    .line 2115
    const-string v3, "1939. waterproof a.\u9632\u6c34\u7684,\u8010\u6c34\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x793

    .line 2116
    const-string v3, "1940. scarf n.\u56f4\u5dfe,\u5934\u5dfe,\u9886\u5dfe,\u9886\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x794

    .line 2117
    const-string v3, "1941. dwarf n.\u77ee\u5b50\uff0c\u4f8f\u5112\uff0c\u77ee\u5c0f\u7684\u52a8\u690d\u7269 vt.\u4f7f\u2026\u77ee\u5c0f"

    aput-object v3, v0, v2

    const/16 v2, 0x795

    .line 2118
    const-string v3, "1942. bag n.\u888b\uff0c\u63d0\u5305 v.\u628a\u2026\u88c5\u5165\u888b\u4e2d\uff1b\u730e\u6740\uff1b\u5360\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x796

    .line 2119
    const-string v3, "1943. lag v./n.\u843d\u540e,\u6ede\u540e vt.\u7528\u9694\u70ed\u6750\u6599\u8986\u76d6(\u9505\u7089\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x797

    .line 2120
    const-string v3, "1944. flag n.\u65d7"

    aput-object v3, v0, v2

    const/16 v2, 0x798

    .line 2121
    const-string v3, "1945. rag n.\u62b9\u5e03,\u7834\u5e03,\u788e\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0x799

    .line 2122
    const-string v3, "1946. drag v.\u62d6,\u62d6\u66f3"

    aput-object v3, v0, v2

    const/16 v2, 0x79a

    .line 2123
    const-string v3, "1947. tag n.\u6807\u7b7e;\u978b\u5e26;\u5782\u9970;vt.\u52a0\u6807\u7b7e\u4e8e;\u9644\u52a0vi.\u7d27\u968f"

    aput-object v3, v0, v2

    const/16 v2, 0x79b

    .line 2124
    const-string v3, "1948. zigzag n./a.\u4e4b\u5b57\u5f62(\u7684) v.\u4f7f\u66f2\u6298,\u66f2\u6298\u76d8\u65cb"

    aput-object v3, v0, v2

    const/16 v2, 0x79c

    .line 2125
    const-string v3, "1949. beg vt.\u8bf7\u6c42\uff0c\u4e5e\u6c42 vi.\u6073\u8bf7\uff0c\u884c\u4e5e"

    aput-object v3, v0, v2

    const/16 v2, 0x79d

    .line 2126
    const-string v3, "1950. leg n.\u817f\uff0c\u817f\u90e8\uff1b\u652f\u67f1\uff1b(\u65c5\u7a0b\u7684)\u4e00\u6bb5\uff0c\u4e00\u7ad9"

    aput-object v3, v0, v2

    const/16 v2, 0x79e

    .line 2127
    const-string v3, "1951. egg n.\u86cb; \u5375; \u5375\u5f62\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x79f

    .line 2128
    const-string v3, "1952. big a.\u5927\u7684\uff1b\u91cd\u8981\u7684\uff1b\u5bbd\u5b8f\u5927\u91cf\u7684\uff1b\u5927\u53d7\u6b22\u8fce\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7a0

    .line 2129
    const-string v3, "1953. dig v.\u6316,\u6398"

    aput-object v3, v0, v2

    const/16 v2, 0x7a1

    .line 2130
    const-string v3, "1954. pig n.\u732a\uff0c\u732a\u8089\uff1b\u732a\u4e00\u822c\u7684\u4eba(\u6307\u80ae\u810f\uff0c\u8d2a\u5403\u7684\u4eba)"

    aput-object v3, v0, v2

    const/16 v2, 0x7a2

    .line 2131
    const-string v3, "1955. bang n.\u7830\u7830\u7684\u58f0\u97f3;\u731b\u51fb v.\u7830\u5730\u5173\u4e0a,\u731b\u649e,\u731b\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0x7a3

    .line 2132
    const-string v3, "1956. gang n.\u4e00\u5e2e,\u4e00\u7fa4,\u4e00\u4f19"

    aput-object v3, v0, v2

    const/16 v2, 0x7a4

    .line 2133
    const-string v3, "1957. hang v.\u60ac\u6302,\u5782\u540a;\u540a\u6b7b,\u7ede\u6b7b"

    aput-object v3, v0, v2

    const/16 v2, 0x7a5

    .line 2134
    const-string v3, "1958. heading n.\u6807\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0x7a6

    .line 2135
    const-string v3, "1959. leading a.\u9886\u5bfc\u7684,\u6307\u5bfc\u7684;\u7b2c\u4e00\u4f4d\u7684;\u6700\u4e3b\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7a7

    .line 2136
    const-string v3, "1960. reading n.\u8bfb\u4e66,\u8bfb\u7269,(\u4eea\u8868\u7b49\u7684)\u8bfb\u6570,\u9605\u8bfb"

    aput-object v3, v0, v2

    const/16 v2, 0x7a8

    .line 2137
    const-string v3, "1961. wedding n.\u5a5a\u793c"

    aput-object v3, v0, v2

    const/16 v2, 0x7a9

    .line 2138
    const-string v3, "1962. preceding a.\u5728\u524d\u7684,\u5728\u5148\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7aa

    .line 2139
    const-string v3, "1963. proceeding n.\u884c\u52a8,\u8fdb\u884c,(pl.)\u4f1a\u8bae\u5f55,\u5b66\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x7ab

    .line 2140
    const-string v3, "1964. building n.\u5efa\u7b51(\u7269)\uff0c\u623f\u5c4b\uff0c\u5927\u697c [\u540c]structure"

    aput-object v3, v0, v2

    const/16 v2, 0x7ac

    .line 2141
    const-string v3, "1965. notwithstanding prep./ad./conj.\u5c3d\u7ba1"

    aput-object v3, v0, v2

    const/16 v2, 0x7ad

    .line 2142
    const-string v3, "1966. understanding n.\u7406\u89e3,\u7406\u89e3\u529b;\u8c05\u89e3 a.\u4e86\u89e3\u7684,\u901a\u60c5\u8fbe\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7ae

    .line 2143
    const-string v3, "1967. outstanding a.\u7a81\u51fa\u7684,\u663e\u8457\u7684,\u6770\u51fa\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7af

    .line 2144
    const-string v3, "1968. ending n.\u7ed3\u5c3e,\u7ed3\u5c40"

    aput-object v3, v0, v2

    const/16 v2, 0x7b0

    .line 2145
    const-string v3, "1969. finding n.\u53d1\u73b0,\u53d1\u73b0\u7269;(\u5e38pl.)\u8c03\u67e5/\u7814\u7a76\u7ed3\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0x7b1

    .line 2146
    const-string v3, "1970. corresponding a.\u7b26\u5408\u7684,\u76f8\u5e94\u7684,\u5bf9\u5e94\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7b2

    .line 2147
    const-string v3, "1971. regarding prep.\u5173\u4e8e,\u6709\u5173"

    aput-object v3, v0, v2

    const/16 v2, 0x7b3

    .line 2148
    const-string v3, "1972. being n.\u751f\u7269\uff0c\u751f\u547d,\u5b58\u5728\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x7b4

    .line 2149
    const-string v3, "1973. sightseeing n.\u89c2\u5149,\u6e38\u89c8"

    aput-object v3, v0, v2

    const/16 v2, 0x7b5

    .line 2150
    const-string v3, "1974. thing n.\u7269\uff0c\u4e1c\u897f\uff1b\u4e8b\uff0c\u4e8b\u60c5\uff1b\u6240\u6709\u7269\uff1b\u5c40\u9762\uff0c\u60c5\u51b5"

    aput-object v3, v0, v2

    const/16 v2, 0x7b6

    .line 2151
    const-string v3, "1975. something pron.\u67d0\u4e8b\uff0c\u67d0\u7269\uff1b\u88ab\u89c6\u4e3a\u6709\u610f\u4e49\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x7b7

    .line 2152
    const-string v3, "1976. clothing n.\u670d\u88c5,\u88ab\u8925"

    aput-object v3, v0, v2

    const/16 v2, 0x7b8

    .line 2153
    const-string v3, "1977. nothing n.\u6ca1\u6709\u4e1c\u897f\uff1b\u4ec0\u4e48\u4e5f\u6ca1\u6709\uff1b\u65e0\u5173\u7d27\u8981\u7684\u4eba\u6216\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x7b9

    .line 2154
    const-string v3, "1978. anything pron.\u4efb\u4f55\u4e1c\u897f(\u4e8b\u7269)\uff1b\u65e0\u8bba\u4ec0\u4e48\u4e1c\u897f(\u4e8b\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x7ba

    .line 2155
    const-string v3, "1979. everything pron.\u6bcf\u4ef6\u4e8b\uff0c\u4e00\u5207\uff1b\u6700\u91cd\u8981\u7684\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x7bb

    .line 2156
    const-string v3, "1980. king n.\u541b\u4e3b\uff0c\u56fd\u738b"

    aput-object v3, v0, v2

    const/16 v2, 0x7bc

    .line 2157
    const-string v3, "1981. stocking n.\u957f(\u7edf)\u889c"

    aput-object v3, v0, v2

    const/16 v2, 0x7bd

    .line 2158
    const-string v3, "1982. striking a.\u663e\u8457\u7684\uff1b\u60f9\u4eba\u6ce8\u76ee\u7684\uff0c\u5bb9\u8c8c\u51fa\u4f17\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7be

    .line 2159
    const-string v3, "1983. cling v.(to)\u7c98\u4f4f;\u4f9d\u9644;\u575a\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x7bf

    .line 2160
    const-string v3, "1984. feeling n.\u611f\u60c5;\u5fc3\u60c5;\u77e5\u89c9;\u540c\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x7c0

    .line 2161
    const-string v3, "1985. fling v.(\u7528\u529b\u5730)\u6254,\u629b,\u4e22"

    aput-object v3, v0, v2

    const/16 v2, 0x7c1

    .line 2162
    const-string v3, "1986. ceiling n.\u5929\u82b1\u677f\uff1b(\u89c4\u5b9a\u4ef7\u683c\u3001\u5de5\u8d44\u7b49\u7684)\u6700\u9ad8\u9650\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x7c2

    .line 2163
    const-string v3, "1987. spelling n.\u62fc\u6cd5,\u62fc\u5199\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x7c3

    .line 2164
    const-string v3, "1988. dwelling n.\u4f4f\u5b85,\u5bd3\u6240"

    aput-object v3, v0, v2

    const/16 v2, 0x7c4

    .line 2165
    const-string v3, "1989. shilling n.\u5148\u4ee4"

    aput-object v3, v0, v2

    const/16 v2, 0x7c5

    .line 2166
    const-string v3, "1990. willing a.\u613f\u610f\u7684\uff0c\u4e50\u610f\u7684\uff0c\u5fc3\u7518\u60c5\u613f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7c6

    .line 2167
    const-string v3, "1991. darling n.\u5fc3\u7231\u7684\u4eba,\u4eb2\u7231\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7c7

    .line 2168
    const-string v3, "1992. bowling n.\u4fdd\u9f84\u7403\u8fd0\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x7c8

    .line 2169
    const-string v3, "1993. overwhelming a.\u52bf\u4e0d\u53ef\u6321\u7684,\u538b\u5012\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7c9

    .line 2170
    const-string v3, "1994. forthcoming a.\u5373\u5c06\u5230\u6765\u7684;\u51c6\u5907\u597d\u7684;\u4e50\u610f\u5e2e\u52a9\u7684;n.\u6765\u4e34"

    aput-object v3, v0, v2

    const/16 v2, 0x7ca

    .line 2171
    const-string v3, "1995. shortcoming n.\u77ed\u5904,\u7f3a\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x7cb

    .line 2172
    const-string v3, "1996. meaning n.\u610f\u601d,\u610f\u4e49,\u542b\u4e49;\u91cd\u8981\u6027,\u4ef7\u503c"

    aput-object v3, v0, v2

    const/16 v2, 0x7cc

    .line 2173
    const-string v3, "1997. opening n.\u5f00,\u5f00\u653e,\u5f00\u59cb,\u7a7a\u7f3a,\u673a\u4f1a a.\u5f00\u59cb\u7684,\u5f00\u5e55\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7cd

    .line 2174
    const-string v3, "1998. evening n.\u508d\u665a\uff0c\u9ec4\u660f\uff0c\u665a\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x7ce

    .line 2175
    const-string v3, "1999. training n.\u8bad\u7ec3,\u57f9\u517b"

    aput-object v3, v0, v2

    const/16 v2, 0x7cf

    .line 2176
    const-string v3, "2000. beginning n.\u5f00\u59cb\uff0c\u5f00\u7aef\uff1b\u8d77\u6e90\uff0c\u65e9\u671f\u9636\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0x7d0

    .line 2177
    const-string v3, "2001. cunning a./n.\u72e1\u733e(\u7684),\u72e1\u8bc8(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x7d1

    .line 2178
    const-string v3, "2002. air-conditioning n.\u7a7a\u8c03\u8bbe\u5907\uff0c\u7a7a\u8c03\u7cfb\u7edf"

    aput-object v3, v0, v2

    const/16 v2, 0x7d2

    .line 2179
    const-string v3, "2003. learning n.\u77e5\u8bc6,\u5b66\u95ee;\u5b66\u4e60"

    aput-object v3, v0, v2

    const/16 v2, 0x7d3

    .line 2180
    const-string v3, "2004. concerning prep.\u5173\u4e8e\uff0c\u8bba\u53ca"

    aput-object v3, v0, v2

    const/16 v2, 0x7d4

    .line 2181
    const-string v3, "2005. morning n.\u65e9\u6668\uff0c\u4e0a\u5348"

    aput-object v3, v0, v2

    const/16 v2, 0x7d5

    .line 2182
    const-string v3, "2006. lightning n.\u95ea\u7535 a.\u95ea\u7535\u822c\u7684,\u5feb\u901f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7d6

    .line 2183
    const-string v3, "2007. ring n.\u6212\u6307;\u73af;\u94c3\u58f0;(\u6253)\u7535\u8bdd v.\u6309(\u94c3),\u6572(\u949f)"

    aput-object v3, v0, v2

    const/16 v2, 0x7d7

    .line 2184
    const-string v3, "2008. bearing n.\u8f74\u627f\uff1b\u5fcd\u53d7\uff1b\u5173\u7cfb\uff0c\u5f71\u54cd\uff1b\u4e3e\u6b62\uff1b\u65b9\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x7d8

    .line 2185
    const-string v3, "2009. hearing n.\u542c,\u503e\u542c;\u542c\u529b;\u5ba1\u8baf"

    aput-object v3, v0, v2

    const/16 v2, 0x7d9

    .line 2186
    const-string v3, "2010. bring v.\u62ff\u6765\uff0c\u5e26\u6765\uff1b\u4ea7\u751f\uff0c\u5f15\u8d77\uff1b\u4f7f\u5904\u4e8e\u67d0\u79cd\u72b6\u6001"

    aput-object v3, v0, v2

    const/16 v2, 0x7da

    .line 2187
    const-string v3, "2011. engineering n.\u5de5\u7a0b\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x7db

    .line 2188
    const-string v3, "2012. spring n.\u6625;\u8df3;\u6cc9,\u6e90\u6cc9;\u5f39\u7c27,\u53d1\u6761 v.\u8df3,\u8df3\u8dc3"

    aput-object v3, v0, v2

    const/16 v2, 0x7dc

    .line 2189
    const-string v3, "2013. offspring n.\u5b50\u5b59,\u540e\u4ee3;\u7ed3\u679c,\u4ea7\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x7dd

    .line 2190
    const-string v3, "2014. string n.\u5f26,\u7ebf,\u7ec6\u7ef3;(\u4e00\u4e32),(\u4e00\u884c) v.\u7f1a,\u6346"

    aput-object v3, v0, v2

    const/16 v2, 0x7de

    .line 2191
    const-string v3, "2015. "

    aput-object v3, v0, v2

    const/16 v2, 0x7df

    .line 2192
    const-string v3, "2016. "

    aput-object v3, v0, v2

    const/16 v2, 0x7e0

    .line 2193
    const-string v3, "2017. during prep.\u5728\u2026\u671f\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x7e1

    .line 2194
    const-string v3, "2018. sing v.\u5531,\u6f14\u5531;\u9e21\u53eb"

    aput-object v3, v0, v2

    const/16 v2, 0x7e2

    .line 2195
    const-string v3, "2019. promising a.\u6709\u5e0c\u671b\u7684,\u6709\u524d\u9014\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7e3

    .line 2196
    const-string v3, "2020. missing a.\u6f0f\u6389\u7684,\u5931\u53bb\u7684,\u5931\u8e2a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7e4

    .line 2197
    const-string v3, "2021. housing n.\u4f4f\u623f\uff0c\u4f4f\u623f\u4f9b\u7ed9\uff1b(\u5916\u3001\u9600)\u58f3\uff0c\u9632\u62a4\u7f69"

    aput-object v3, v0, v2

    const/16 v2, 0x7e5

    .line 2198
    const-string v3, "2022. meeting n.\u4f1a\u8bae,\u96c6\u5408,\u6c47\u5408,\u4f1a\u89c1,\u63a5\u89c1,\u6c47\u5408\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x7e6

    .line 2199
    const-string v3, "2023. greeting n.\u95ee\u5019,\u81f4\u656c"

    aput-object v3, v0, v2

    const/16 v2, 0x7e7

    .line 2200
    const-string v3, "2024. exciting a.\u4ee4\u4eba\u5174\u594b\u7684,\u4f7f\u4eba\u6fc0\u52a8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7e8

    .line 2201
    const-string v3, "2025. writing n.\u5199,\u5199\u4f5c;\u8457\u4f5c,\u4f5c\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x7e9

    .line 2202
    const-string v3, "2026. handwriting n.\u7b14\u8ff9,\u624b\u8ff9,\u4e66\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x7ea

    .line 2203
    const-string v3, "2027. painting n.\u4e0a\u6cb9\u6f06,\u7740\u8272;\u7ed8\u753b;\u6cb9\u753b;\u753b\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x7eb

    .line 2204
    const-string v3, "2028. sting v./n.\u523a,\u523a\u75db,\u5267\u75db;\u523a,\u53ee"

    aput-object v3, v0, v2

    const/16 v2, 0x7ec

    .line 2205
    const-string v3, "2029. interesting a.\u6709\u8da3\u7684,\u5f15\u4eba\u5165\u80dc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7ed

    .line 2206
    const-string v3, "2030. setting n.\u5b89\u7f6e;\u843d\u5c71;(\u56fa\u5b9a\u4e1c\u897f\u7684)\u67dc\u67b6\u5e95\u5ea7;\u73af\u5883"

    aput-object v3, v0, v2

    const/16 v2, 0x7ee

    .line 2207
    const-string v3, "2031. fitting a.\u9002\u5f53\u7684,\u6070\u5f53\u7684 n.(\u5e38pl.)\u914d\u4ef6,\u9644\u4ef6;\u88c5\u914d"

    aput-object v3, v0, v2

    const/16 v2, 0x7ef

    .line 2208
    const-string v3, "2032. outing n.\u5916\u51fa,\u65c5\u884c,\u6563\u6b65"

    aput-object v3, v0, v2

    const/16 v2, 0x7f0

    .line 2209
    const-string v3, "2033. saving n.\u633d\u6551,\u6551\u52a9,\u8282\u7ea6,\u50a8\u84c4;(pl.)\u50a8\u84c4\u91d1,\u5b58\u6b3e"

    aput-object v3, v0, v2

    const/16 v2, 0x7f1

    .line 2210
    const-string v3, "2034. Thanksgiving n.\u611f\u6069\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x7f2

    .line 2211
    const-string v3, "2035. living a.\u6d3b\u7684,\u6709\u751f\u547d\u7684,\u5929\u7136\u7684,\u903c\u771f\u7684n.\u751f\u6d3b,\u751f\u8ba1"

    aput-object v3, v0, v2

    const/16 v2, 0x7f3

    .line 2212
    const-string v3, "2036. wing n.\u7fc5,\u7fc5\u8180;\u7ffc,\u673a\u7ffc;\u6d3e\u522b vt.\u88c5\u4ee5\u7ffc"

    aput-object v3, v0, v2

    const/16 v2, 0x7f4

    .line 2213
    const-string v3, "2037. drawing n.\u7ed8\u56fe,\u56fe\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x7f5

    .line 2214
    const-string v3, "2038. owing a.\u6b20\u7684,\u672a\u4ed8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7f6

    .line 2215
    const-string v3, "2039. following a.\u4e0b\u5217\u7684\uff0c\u4e0b\u8ff0\u7684\uff0c\u5176\u6b21\u7684\uff0c\u63a5\u7740\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7f7

    .line 2216
    const-string v3, "2040. swing v.\u6447\u6446,\u6447\u8361,\u56de\u8f6c,\u65cb\u8f6c n.\u79cb\u5343;\u6447\u6446,\u6446\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x7f8

    .line 2217
    const-string v3, "2041. underlying a.\u542b\u84c4\u7684,\u6f5c\u5728\u7684;\u5728\u4e0b\u9762\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7f9

    .line 2218
    const-string v3, "2042. long a.\u957f\u7684\uff0c\u957f\u65f6\u95f4\u7684\uff0c\u957f\u671f\u7684 ad.\u957f\u4e45\uff0c\u957f\u671f\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x7fa

    .line 2219
    const-string v3, "2043. along ad.\u5411\u524d\uff1b\u548c...\u4e00\u8d77\uff0c\u4e00\u540c prep.\u6cbf\u7740\uff0c\u987a\u7740"

    aput-object v3, v0, v2

    const/16 v2, 0x7fb

    .line 2220
    const-string v3, "2044. belong v.(to)\u5c5e\u4e8e,\u9644\u5c5e,\u96b6\u5c5e;\u5e94\u5f52\u5165(\u7c7b\u522b,\u8303\u7574\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x7fc

    .line 2221
    const-string v3, "2045. prolong v.\u62c9\u957f,\u5ef6\u957f,\u62d6\u5ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x7fd

    .line 2222
    const-string v3, "2046. among prep.\u5728\u2026\u4e4b\u4e2d\uff1b\u5728\u4e00\u7fa4(\u7ec4)\u4e4b\u4e2d\uff1b\u4e8e\u2026\u4e4b\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x7fe

    .line 2223
    const-string v3, "2047. strong a.\u5f3a\u58ee\u7684,\u5f3a\u5927\u7684;\u5f3a\u70c8\u7684,\u6d53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x7ff

    .line 2224
    const-string v3, "2048. wrong a.\u9519\u7684 ad.\u9519\u8bef\u5730\uff0c\u4e0d\u6b63\u786e\u5730 n.\u9519\u8bef v.\u59d4\u5c48"

    aput-object v3, v0, v2

    const/16 v2, 0x800

    .line 2225
    const-string v3, "2049. song n.\u6b4c\u5531\uff0c(\u866b\u3001\u9e1f\u7b49)\u9e23\u58f0\uff1b\u6b4c\u66f2\uff0c\u6b4c\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x801

    .line 2226
    const-string v3, "2050. lung n.\u80ba"

    aput-object v3, v0, v2

    const/16 v2, 0x802

    .line 2227
    const-string v3, "2051. young a.\u5e74\u8f7b\u7684\uff0c\u5e7c\u5c0f\u7684\uff1b\u6ca1\u7ecf\u9a8c\u7684 n.\u9752\u5e74\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x803

    .line 2228
    const-string v3, "2052. dog n.\u72d7\uff0c\u96c4\u517d vt.\u5c3e\u968f\uff0c\u8ddf\u8e2a"

    aput-object v3, v0, v2

    const/16 v2, 0x804

    .line 2229
    const-string v3, "2053. fog n.\u96fe\u6c14\uff0c\u96fe v.\u4ee5\u96fe\u7b3c\u7f69\uff0c\u88ab\u96fe\u7b3c\u7f69"

    aput-object v3, v0, v2

    const/16 v2, 0x805

    .line 2230
    const-string v3, "2054. jog v.\u6162\u8dd1"

    aput-object v3, v0, v2

    const/16 v2, 0x806

    .line 2231
    const-string v3, "2055. log n.\u539f\u6728,\u5706\u6728;\u822a\u6d77\u65e5\u5fd7"

    aput-object v3, v0, v2

    const/16 v2, 0x807

    .line 2232
    const-string v3, "2056. dialog n.(dialogue)\u5bf9\u8bdd,\u5bf9\u767d"

    aput-object v3, v0, v2

    const/16 v2, 0x808

    .line 2233
    const-string v3, "2057. catalog n.\uff08catalogue\uff09\u76ee\u5f55(\u518c) v.\u7f16\u76ee(\u5f55)"

    aput-object v3, v0, v2

    const/16 v2, 0x809

    .line 2234
    const-string v3, "2058. smog n.\u70df\u96fe"

    aput-object v3, v0, v2

    const/16 v2, 0x80a

    .line 2235
    const-string v3, "2059. frog n.\u86d9"

    aput-object v3, v0, v2

    const/16 v2, 0x80b

    .line 2236
    const-string v3, "2060. bug n.\u81ed\u866b;\u5c0f\u6bdb\u75c5;\u7a83\u542c\u5668 v.\u7a83\u542c"

    aput-object v3, v0, v2

    const/16 v2, 0x80c

    .line 2237
    const-string v3, "2061. hug v./n.\u70ed\u70c8\u62e5\u62b1,\u7d27\u62b1"

    aput-object v3, v0, v2

    const/16 v2, 0x80d

    .line 2238
    const-string v3, "2062. jug n.(\u6709\u67c4\uff0c\u5c0f\u53e3\uff0c\u53ef\u76db\u6c34\u7b49\u7684)\u5927\u58f6\uff0c\u7f50\uff0c\u76c2"

    aput-object v3, v0, v2

    const/16 v2, 0x80e

    .line 2239
    const-string v3, "2063. plug n.\u585e\u5b50,\u63d2\u5934 v.\u5835,\u585e,\u63d2\u4e0a,\u63d2\u6813"

    aput-object v3, v0, v2

    const/16 v2, 0x80f

    .line 2240
    const-string v3, "2064. mug n.(\u6709\u67c4\u7684)\u5927\u8336\u676f"

    aput-object v3, v0, v2

    const/16 v2, 0x810

    .line 2241
    const-string v3, "2065. rug n.(\u5c0f)\u5730\u6bef;\u56f4\u6bef"

    aput-object v3, v0, v2

    const/16 v2, 0x811

    .line 2242
    const-string v3, "2066. drug n.\u836f\u7269;\u9ebb\u9189\u54c1;\u6bd2\u54c1;\u6ede\u9500\u8d27 v.\u4e0b\u9ebb\u836f;\u5438\u6bd2"

    aput-object v3, v0, v2

    const/16 v2, 0x812

    .line 2243
    const-string v3, "2067. shrug vt./n.\u8038\u80a9(\u8868\u793a\u51b7\u6de1\u3001\u6000\u7591\u3001\u65e0\u5948\u3001\u4e0d\u6ee1\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x813

    .line 2244
    const-string v3, "2068. tug v.\u7528\u529b\u62d6(\u6216\u62c9)\uff1b\u82e6\u5e72 n.\u62d6\uff1b\u82e6\u5e72\uff1b\u62d6\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0x814

    .line 2245
    const-string v3, "2069. each a./pron.\u5404,\u5404\u81ea\u7684,\u6bcf"

    aput-object v3, v0, v2

    const/16 v2, 0x815

    .line 2246
    const-string v3, "2070. beach n.\u6d77\u6ee9,\u6e56\u6ee9,\u6cb3\u6ee9"

    aput-object v3, v0, v2

    const/16 v2, 0x816

    .line 2247
    const-string v3, "2071. peach n.\u6843,\u6843\u6811"

    aput-object v3, v0, v2

    const/16 v2, 0x817

    .line 2248
    const-string v3, "2072. reach v.\u62b5\u8fbe;(out)\u4f38\u624b,\u591f\u5230 n.\u80fd\u8fbe\u5230\u7684\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x818

    .line 2249
    const-string v3, "2073. breach n.\u8fdd\u53cd\uff0c\u4e0d\u5c65\u884c\uff1b\u7834\u88c2 vt.\u51b2\u7834\uff0c\u653b\u7834"

    aput-object v3, v0, v2

    const/16 v2, 0x819

    .line 2250
    const-string v3, "2074. preach v.\u5ba3\u8bb2(\u6559\u4e49),\u5e03\u9053;\u7aed\u529b\u9f13\u5439,\u5ba3\u4f20;\u8bf4\u6559"

    aput-object v3, v0, v2

    const/16 v2, 0x81a

    .line 2251
    const-string v3, "2075. teach vt.\u6559\uff0c\u8bb2\u6388\uff1b\u6559\u5bfc(\u8bad)vi.\u8bb2\u8bfe\uff0c\u5f53\u6559\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x81b

    .line 2252
    const-string v3, "2076. stomach n.\u80c3\uff0c\u80c3\u53e3\uff1b\u809a\u5b50\uff0c\u8179\u90e8vt.\u627f\u53d7\uff0c\u5fcd\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0x81c

    .line 2253
    const-string v3, "2077. coach n.\u957f\u9014\u516c\u5171\u6c7d\u8f66\uff1b\u6559\u7ec3 vt.\u8bad\u7ec3\uff0c\u6307\u5bfc\uff0c\u57f9\u8bad"

    aput-object v3, v0, v2

    const/16 v2, 0x81d

    .line 2254
    const-string v3, "2078. reproach v./n.\u8d23\u5907,\u6307\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0x81e

    .line 2255
    const-string v3, "2079. approach v.\u9760\u8fd1\uff0c\u63a5\u8fd1n.\u63a5\u8fd1\uff1b\u9014\u5f84\uff0c\u5165\u95e8;\u65b9\u5f0f,\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x81f

    .line 2256
    const-string v3, "2080. detach vt.\u5206\u5f00, \u5206\u79bb, \u5206\u9063, \u6d3e\u9063(\u519b\u961f)"

    aput-object v3, v0, v2

    const/16 v2, 0x820

    .line 2257
    const-string v3, "2081. attach v.\u7cfb\uff0c\u8d34\uff0c\u88c5\uff0c\u8fde\u63a5\uff1b\u4f7f\u6210\u4e3a\u4e00\u90e8\u5206\uff1b\u4f7f\u4f9d\u604b"

    aput-object v3, v0, v2

    const/16 v2, 0x821

    .line 2258
    const-string v3, "2082. speech n.\u6f14\u8bf4,\u8bb2\u8bdd;\u8a00\u8bed,\u8bed\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x822

    .line 2259
    const-string v3, "2083. which a./pron.\u54ea\u4e2a\uff0c\u54ea\u4e9b\uff1b\u4ec0\u4e48\u6837\u7684\uff1b\u90a3\u4e2a\uff0c\u90a3\u4e9b"

    aput-object v3, v0, v2

    const/16 v2, 0x823

    .line 2260
    const-string v3, "2084. rich a.\u5bcc\u7684,\u6709\u94b1\u7684;\u5bcc\u9976\u7684;(in)\u5145\u8db3\u7684,\u4e30\u5bcc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x824

    .line 2261
    const-string v3, "2085. enrich v.\u4f7f\u5bcc\u8db3;\u4f7f\u80a5\u6c83;\u88c5\u9970;\u52a0\u6599\u4e8e;\u6d53\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x825

    .line 2262
    const-string v3, "2086. sandwich n.\u4e09\u660e\u6cbb,\u5939\u8089\u9762\u5305 v.\u5939\u5165,\u6324\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x826

    .line 2263
    const-string v3, "2087. branch n.(\u6811)\u6761,\u5206\u652f;\u5206\u5e97;(\u5b66\u79d1)\u5206\u79d1,\u90e8\u95e8;\u652f\u6d41"

    aput-object v3, v0, v2

    const/16 v2, 0x827

    .line 2264
    const-string v3, "2088. bench n.\u957f\u51f3,\u6761\u51f3;(\u5de5\u4f5c)\u53f0,\u5ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x828

    .line 2265
    const-string v3, "2089. trench n.&v.(\u6316)\u6c9f\uff0c(\u6316)\u6218\u58d5"

    aput-object v3, v0, v2

    const/16 v2, 0x829

    .line 2266
    const-string v3, "2090. wrench v.\u731b\u62e7\uff1b\u6323\u8131\uff1b\u4f7f\u626d\u4f24 n.\u6273\u624b\uff1b\u75db\u82e6\uff0c\u96be\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0x82a

    .line 2267
    const-string v3, "2091. quench v.\u7184\u706d,\u6251\u706d,\u538b\u5236,\u6291\u5236,\u6b62\u6e34"

    aput-object v3, v0, v2

    const/16 v2, 0x82b

    .line 2268
    const-string v3, "2092. inch n.\u82f1\u5bf8"

    aput-object v3, v0, v2

    const/16 v2, 0x82c

    .line 2269
    const-string v3, "2093. pinch v.\u634f,\u6390,\u62e7;\u6536\u7f29;\u7d27\u6025\u5173\u5934;\u532e\u4e4f;\u538b\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x82d

    .line 2270
    const-string v3, "2094. launch v.\u53d1\u5c04;\u4f7f(\u8239)\u4e0b\u6c34,\u53d1\u52a8,\u5f00\u5c55 n.\u53d1\u5c04,\u4e0b\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x82e

    .line 2271
    const-string v3, "2095. bunch n.(\u4e00)\u7c07,\u675f,\u6346,\u4e32"

    aput-object v3, v0, v2

    const/16 v2, 0x82f

    .line 2272
    const-string v3, "2096. lunch n.\u5348\u9910\uff0c(\u7f8e)\u4fbf\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x830

    .line 2273
    const-string v3, "2097. punch n.\u51b2\u538b\u673a,\u51b2\u5e8a;\u7a7f\u5b54\u673a v.\u51b2\u538b,\u7a7f\u5b54"

    aput-object v3, v0, v2

    const/16 v2, 0x831

    .line 2274
    const-string v3, "2098. epoch n.\u65b0\u7eaa\u5143;\u65f6\u4ee3;\u65f6\u671f;\u3010\u5730\u8d28\u3011\u4e16,\u7eaa,\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x832

    .line 2275
    const-string v3, "2099. arch n.\u62f1\u95e8\uff0c\u6865\u62f1\u6d1e v.\u62f1\u8d77\uff0c(\u4f7f)\u53d8\u6210\u5f13\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x833

    .line 2276
    const-string v3, "2100. search v./n.(for)\u641c\u7d22,\u5bfb\u627e,\u63a2\u67e5"

    aput-object v3, v0, v2

    const/16 v2, 0x834

    .line 2277
    const-string v3, "2101. research v./n.(into,on)\u7814\u7a76,\u8c03\u67e5"

    aput-object v3, v0, v2

    const/16 v2, 0x835

    .line 2278
    const-string v3, "2102. march v.(\u4f7f)\u884c\u519b,(\u4f7f)\u884c\u8fdb n.\u884c\u519b,\u884c\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0x836

    .line 2279
    const-string v3, "2103. March n.\u4e09\u6708(\u7565\u4f5c Mar.)"

    aput-object v3, v0, v2

    const/16 v2, 0x837

    .line 2280
    const-string v3, "2104. monarch n.\u5e1d\u738b\uff0c\u541b\u4e3b\uff0c\u6700\u9ad8\u7edf\u6cbb\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x838

    .line 2281
    const-string v3, "2105. porch n.\u95e8\u5eca,\u5165\u53e3\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x839

    .line 2282
    const-string v3, "2106. torch n.\u624b\u7535\u7b52;\u706b\u70ac,\u706b\u628a"

    aput-object v3, v0, v2

    const/16 v2, 0x83a

    .line 2283
    const-string v3, "2107. church n.\u6559\u5802\uff1b\u6559\u4f1a,\u6559\u6d3e\uff1b\uff08\u5b97\u6559\u7684\uff09\u793c\u62dc\u4eea\u5f0f"

    aput-object v3, v0, v2

    const/16 v2, 0x83b

    .line 2284
    const-string v3, "2108. batch n.\u4e00\u6279,\u4e00\u7ec4,\u4e00\u7fa4"

    aput-object v3, v0, v2

    const/16 v2, 0x83c

    .line 2285
    const-string v3, "2109. catch v.\u6355\u6349,\u6355\u83b7;\u8d76\u4e0a;\u611f\u67d3;\u7406\u89e3,\u542c\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x83d

    .line 2286
    const-string v3, "2110. hatch v.\u5b75,\u5b75\u51fa;\u7b56\u5212,\u56fe\u8c0b n.\u8231\u53e3,\u5c0f\u95e8"

    aput-object v3, v0, v2

    const/16 v2, 0x83e

    .line 2287
    const-string v3, "2111. match n.\u706b\u67f4;\u6bd4\u8d5b,\u7ade\u8d5b;\u5bf9\u624b,\u914d\u5076 v.\u5339\u914d,\u76f8\u79f0"

    aput-object v3, v0, v2

    const/16 v2, 0x83f

    .line 2288
    const-string v3, "2112. snatch n./v.\u652b\u53d6,\u62a2\u593a"

    aput-object v3, v0, v2

    const/16 v2, 0x840

    .line 2289
    const-string v3, "2113. patch n.\u8865\u4e01,\u6591\u70b9,\u788e\u7247\u5c0f\u5757 v.\u8865,\u4fee\u8865,\u63a9\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x841

    .line 2290
    const-string v3, "2114. despatch n./v.(dispatch)\u6d3e\u9063;\u53d1\u9001 n.\u6025\u4ef6;\u65b0\u95fb\u62a5\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x842

    .line 2291
    const-string v3, "2115. scratch v.\u6293,\u6414,\u6252 n.\u6293,\u6414,\u6293\u75d5;\u8d77\u8dd1\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x843

    .line 2292
    const-string v3, "2116. watch v.\u89c2\u770b\uff1b\u770b\u5b88\uff1b(for)\u7aa5\u4f3a\uff0c\u7b49\u5f85 n.\u770b\u7ba1\uff1b\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x844

    .line 2293
    const-string v3, "2117. watch v.\u89c2\u770b;\u6ce8\u89c6;\u770b\u5b88;\u8b66\u6212 n.\u6ce8\u89c6;\u624b\u8868;\u5b88\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x845

    .line 2294
    const-string v3, "2118. fetch v.\u53d6\u6765;\u63a5\u6765;\u5f15\u51fa;\u552e\u5f97;\u5438\u5f15 n.\u53d6\u5f97;\u62ff"

    aput-object v3, v0, v2

    const/16 v2, 0x846

    .line 2295
    const-string v3, "2119. sketch n.\u7d20\u63cf;\u7565\u56fe,\u8349\u56fe;\u6897\u6982 v.\u7ed8\u7565\u56fe,\u901f\u5199,\u5199\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x847

    .line 2296
    const-string v3, "2120. stretch v.\u4f38\u5c55\uff0c\u5ef6\u4f38 n.\u62c9\u957f\uff1b\u4f38\u5c55\uff1b\u4e00\u6bb5\u65f6\u95f4/\u8def\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0x848

    .line 2297
    const-string v3, "2121. ditch n.\u6c9f,\u6c9f\u6e20,\u6c34\u6c9f"

    aput-object v3, v0, v2

    const/16 v2, 0x849

    .line 2298
    const-string v3, "2122. pitch n.\u6ca5\u9752;\u63b7 v.\u7528\u6ca5\u9752\u8986\u76d6;\u6295\u63b7,\u6254"

    aput-object v3, v0, v2

    const/16 v2, 0x84a

    .line 2299
    const-string v3, "2123. stitch n.\u4e00\u9488\uff1b(\u56e0\u8dd1\u6b65\u5f15\u8d77\u7684)\u808b\u90e8\u5267\u75db v.\u7f1d(\u5408)"

    aput-object v3, v0, v2

    const/16 v2, 0x84b

    .line 2300
    const-string v3, "2124. witch n.\u5973\u5deb, \u5deb\u5a46\uff0c\u5deb\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x84c

    .line 2301
    const-string v3, "2125. switch n.\u5f00\u5173\uff1b\u8f6c\u6362\uff1b\u97ad\u5b50 v.\u8f6c\u53d8,\u8f6c\u6362\uff1b\u62bd\u6253"

    aput-object v3, v0, v2

    const/16 v2, 0x84d

    .line 2302
    const-string v3, "2126. clutch v.\u6293\u4f4f,\u652b\u4f4f,\u638c\u63e1 n.\u79bb\u5408\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x84e

    .line 2303
    const-string v3, "2127. much a.\u591a\u7684\uff0c\u5927\u91cf\u7684 ad.\u5341\u5206\uff0c\u975e\u5e38\uff1b\u5230\u6781\u5927\u7a0b\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x84f

    .line 2304
    const-string v3, "2128. couch n.\u957f\u6c99\u53d1\uff1b(\u75c5\u4eba\u8eba\u7684)\u957f\u69bbvt.\u8868\u8fbe"

    aput-object v3, v0, v2

    const/16 v2, 0x850

    .line 2305
    const-string v3, "2129. touch v.\u89e6,\u78b0,\u6478;\u611f\u52a8;\u6d89\u53ca n.\u89e6\u52a8,\u78b0\u5230;\u5c11\u8bb8"

    aput-object v3, v0, v2

    const/16 v2, 0x851

    .line 2306
    const-string v3, "2130. such a.\u8fd9\u6837\u7684;\u4e0a\u8ff0\u7684ad.\u90a3\u4e48pron.\u8fd9\u6837\u7684\u4eba/\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x852

    .line 2307
    const-string v3, "2131. weigh v.\u79f0\u2026\u91cd\u91cf,\u79f0;\u91cd\u8fbe;\u8003\u8651,\u6743\u8861"

    aput-object v3, v0, v2

    const/16 v2, 0x853

    .line 2308
    const-string v3, "2132. high a.\u9ad8\u7684\uff0c\u9ad8\u5ea6\u7684\uff0c\u9ad8\u7ea7\u7684\uff0c\u9ad8\u5c1a\u7684 ad.\u9ad8\u9ad8\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x854

    .line 2309
    const-string v3, "2133. thigh n.\u5927\u817f\uff1b\u80a1\u9aa8"

    aput-object v3, v0, v2

    const/16 v2, 0x855

    .line 2310
    const-string v3, "2134. sigh n.\u53f9\u606f,\u53f9\u606f\u58f0 v.\u53f9\u606f,\u53f9\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x856

    .line 2311
    const-string v3, "2135. laugh v.\u7b11;(on)\u8ba5\u7b11 n.\u7b11,\u7b11\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x857

    .line 2312
    const-string v3, "2136. cough v./n.\u54b3\u55fd"

    aput-object v3, v0, v2

    const/16 v2, 0x858

    .line 2313
    const-string v3, "2137. though ad.\u53ef\u662f\uff0c\u7136\u800c\uff0c\u4e0d\u8fc7 conj.\u5c3d\u7ba1\uff0c\u867d\u7136"

    aput-object v3, v0, v2

    const/16 v2, 0x859

    .line 2314
    const-string v3, "2138. although conj.\u5c3d\u7ba1\uff0c\u867d\u7136...\u4f46\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x85a

    .line 2315
    const-string v3, "2139. plough n.(plow)\u7281,\u8015\u5730,\u7281\u8fc7\u7684\u5730 v.\u7281,\u8d39\u529b\u5730\u524d\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x85b

    .line 2316
    const-string v3, "2140. enough a.(for)\u8db3\u591f\u7684 n.\u8db3\u591f,\u5145\u5206 ad.\u8db3\u591f\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x85c

    .line 2317
    const-string v3, "2141. rough a.\u7c97\u7cd9\u7684;\u7c97\u7565\u7684,\u5927\u81f4\u7684;\u7c97\u91ce\u7684,\u7c97\u66b4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x85d

    .line 2318
    const-string v3, "2142. through prep./ad.\u7a7f\u8fc7\uff1b\u81ea\u59cb\u81f3\u7ec8\uff1b\u7531\uff0c\u4ee5 a.\u76f4\u8fbe\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x85e

    .line 2319
    const-string v3, "2143. thorough a.\u5f7b\u5e95\u7684,\u5b8c\u5168\u7684;\u7cbe\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x85f

    .line 2320
    const-string v3, "2144. tough a.\u575a\u97e7\u7684,\u68d8\u624b\u7684;\u5f3a\u5065\u7684,\u5403\u82e6\u8010\u52b3\u7684;\u7c97\u66b4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x860

    .line 2321
    const-string v3, "2145. graph n.\u56fe\u8868,\u66f2\u7ebf\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x861

    .line 2322
    const-string v3, "2146. paragraph n.\u6bb5,\u8282;\u5c0f\u65b0\u95fb,\u77ed\u8bc4"

    aput-object v3, v0, v2

    const/16 v2, 0x862

    .line 2323
    const-string v3, "2147. telegraph n.\u7535\u62a5\u673a,\u7535\u62a5 v.\u6253\u7535\u62a5,\u53d1\u7535\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x863

    .line 2324
    const-string v3, "2148. triumph n.\u80dc\u5229,\u6210\u529f v.\u5f97\u80dc,\u6218\u80dc"

    aput-object v3, v0, v2

    const/16 v2, 0x864

    .line 2325
    const-string v3, "2149. ash n.\u7070\uff0c\u7070\u672b\uff1b(pl.)\u9aa8\u7070\uff1b(pl.)\u5e9f\u589f"

    aput-object v3, v0, v2

    const/16 v2, 0x865

    .line 2326
    const-string v3, "2150. cash n.\u73b0\u91d1,\u73b0\u6b3e v.\u5151\u73b0,\u4ed8(\u6216\u6536)\u73b0\u6b3e"

    aput-object v3, v0, v2

    const/16 v2, 0x866

    .line 2327
    const-string v3, "2151. dash v./n.\u51b2,\u731b\u51b2,\u7a81\u8fdb n.\u7834\u6298\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x867

    .line 2328
    const-string v3, "2152. lash v.\u97ad\u6253,\u6446\u52a8,\u6346\u624e n.\u97ad\u5b50,\u97ad\u6253,\u776b\u6bdb,\u8bbd\u523a"

    aput-object v3, v0, v2

    const/16 v2, 0x868

    .line 2329
    const-string v3, "2153. clash v./n.\u78b0\u649e n.\u78b0\u649e\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x869

    .line 2330
    const-string v3, "2154. flash n./a.\u95ea\u5149(\u7684) v.\u53d1\u95ea\u5149,\u95ea\u4eae;\u95ea\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0x86a

    .line 2331
    const-string v3, "2155. splash v.\u6e85,\u6cfc n.\u6e85,\u98de\u6e85\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x86b

    .line 2332
    const-string v3, "2156. smash v./n.\u6253\u788e,\u7c89\u788e"

    aput-object v3, v0, v2

    const/16 v2, 0x86c

    .line 2333
    const-string v3, "2157. rash a.\u8f7b\u7387\u7684,\u9c81\u83bd\u7684 n.\u76ae\u75b9"

    aput-object v3, v0, v2

    const/16 v2, 0x86d

    .line 2334
    const-string v3, "2158. crash v./n.\u78b0\u649e,\u5760\u843d,\u6454\u574f n.\u5931\u8d25,\u74e6\u89e3;\u7206\u88c2\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x86e

    .line 2335
    const-string v3, "2159. trash n.\u5783\u573e\uff1b\u62d9\u52a3\u7684\u4f5c\u54c1\uff1b\u6e23\u6ed3\uff0c\u8d25\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x86f

    .line 2336
    const-string v3, "2160. wash n.\u6d17\uff1b\u6d17\u7684\u8863\u7269 vt.\u51b2\u5237\uff0c\u6d17\uff1b\u51b2\u51fa vi.\u6d17\u6fa1"

    aput-object v3, v0, v2

    const/16 v2, 0x870

    .line 2337
    const-string v3, "2161. flesh n.\u8089,\u808c\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x871

    .line 2338
    const-string v3, "2162. fresh a.\u65b0\u9c9c\u7684,\u65e0\u7ecf\u9a8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x872

    .line 2339
    const-string v3, "2163. refresh v.(\u4f7f)\u7cbe\u795e\u632f\u4f5c,(\u4f7f)\u7cbe\u529b\u6062\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0x873

    .line 2340
    const-string v3, "2164. rubbish n.\u5783\u573e,\u5e9f\u7269;\u5e9f\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x874

    .line 2341
    const-string v3, "2165. dish n.\u789f\u5b50,\u76d8\u5b50,\u83dc\u80b4"

    aput-object v3, v0, v2

    const/16 v2, 0x875

    .line 2342
    const-string v3, "2166. fish n.(pl.fish(es))\u9c7c\uff1b\u9c7c\u8089 v.\u6355\u9c7c\uff1b\u9493\u9c7c"

    aput-object v3, v0, v2

    const/16 v2, 0x876

    .line 2343
    const-string v3, "2167. selfish adj.\u81ea\u79c1\u7684\uff0c\u5229\u5df1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x877

    .line 2344
    const-string v3, "2168. establish v.\u5efa\u7acb,\u8bbe\u7acb;\u5b89\u7f6e,\u4f7f\u5b9a\u5c45"

    aput-object v3, v0, v2

    const/16 v2, 0x878

    .line 2345
    const-string v3, "2169. publish v.\u51fa\u7248,\u520a\u5370;\u516c\u5e03,\u53d1\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0x879

    .line 2346
    const-string v3, "2170. relish n.\u7f8e\u5473,\u5473\u9053,\u8c03\u5473\u54c1,\u98df\u6b32,\u4e50\u8da3 v.\u559c\u6b22,\u54c1\u5473"

    aput-object v3, v0, v2

    const/16 v2, 0x87a

    .line 2347
    const-string v3, "2171. abolish vt.\u5e9f\u9664(\u6cd5\u5f8b\u3001\u4e60\u60ef\u7b49)\uff1b\u53d6\u6d88"

    aput-object v3, v0, v2

    const/16 v2, 0x87b

    .line 2348
    const-string v3, "2172. foolish a.\u611a\u7b28\u7684,\u611a\u8822\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x87c

    .line 2349
    const-string v3, "2173. polish v.\u78e8\u5149,\u64e6\u4eae;\u4f7f\u4f18\u7f8e,\u6da6\u9970 n.\u64e6\u5149\u5242,\u4e0a\u5149\u8721"

    aput-object v3, v0, v2

    const/16 v2, 0x87d

    .line 2350
    const-string v3, "2174. accomplish v.\u5b9e\u73b0(\u8ba1\u5212\u7b49)\uff1b\u8fbe\u5230(\u76ee\u7684)\uff1b\u5b8c\u6210(\u4efb\u52a1)"

    aput-object v3, v0, v2

    const/16 v2, 0x87e

    .line 2351
    const-string v3, "2175. vanish vi.\u7a81\u7136\u4e0d\u89c1;\u6d88\u5931"

    aput-object v3, v0, v2

    const/16 v2, 0x87f

    .line 2352
    const-string v3, "2176. finish n.\u5b8c\u6210;\u7ed3\u675f;\u78e8\u5149 v.\u5b8c\u6210;\u7ed3\u675f;\u7528\u5b8c;\u6bc1\u6389"

    aput-object v3, v0, v2

    const/16 v2, 0x880

    .line 2353
    const-string v3, "2177. diminish v.\u7f29\u5c0f,\u51cf\u5c11,\u9012\u51cf"

    aput-object v3, v0, v2

    const/16 v2, 0x881

    .line 2354
    const-string v3, "2178. astonish vt.\u4f7f\u60ca\u8bb6\uff0c\u4f7f\u5403\u60ca"

    aput-object v3, v0, v2

    const/16 v2, 0x882

    .line 2355
    const-string v3, "2179. furnish v.\u4f9b\u5e94,\u63d0\u4f9b;\u88c5\u5907,\u5e03\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x883

    .line 2356
    const-string v3, "2180. punish v.\u60e9\u7f5a,\u5904\u7f5a"

    aput-object v3, v0, v2

    const/16 v2, 0x884

    .line 2357
    const-string v3, "2181. cherish vt.\u62b1\u6709\uff0c\u6000\u6709(\u5e0c\u671b\u7b49)\uff1b\u7231\u62a4\uff0c\u629a\u80b2\uff1b\u73cd\u7231"

    aput-object v3, v0, v2

    const/16 v2, 0x885

    .line 2358
    const-string v3, "2182. perish v.\u4e27\u751f;\u51cb\u8c22;\u6bc1\u706d,\u6d88\u4ea1"

    aput-object v3, v0, v2

    const/16 v2, 0x886

    .line 2359
    const-string v3, "2183. flourish n./v.\u7e41\u8363,\u8302\u76db,\u5174\u65fa"

    aput-object v3, v0, v2

    const/16 v2, 0x887

    .line 2360
    const-string v3, "2184. nourish v.\u63d0\u4f9b\u517b\u5206,\u517b\u80b2,\u6000\u6709(\u5e0c\u671b,\u4ec7\u6068\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x888

    .line 2361
    const-string v3, "2185. anguish n.(\u5c24\u6307\u5fc3\u7075\u4e0a\u7684)\u6781\u5ea6\u75db\u82e6\uff0c\u70e6\u607c"

    aput-object v3, v0, v2

    const/16 v2, 0x889

    .line 2362
    const-string v3, "2186. distinguish v.(from)\u533a\u522b,\u8fa8\u522b;\u8fa8\u8ba4\u51fa;\u4f7f\u6770\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x88a

    .line 2363
    const-string v3, "2187. extinguish v.\u7184\u706d;\u6d88\u706d;\u7ed3\u675f;\u538b\u5236;\u4f7f\u9eef\u7136\u5931\u8272;\u507f\u6e05"

    aput-object v3, v0, v2

    const/16 v2, 0x88b

    .line 2364
    const-string v3, "2188. wish v.\u5e0c\u671b\uff1b\u4f46\u613f\uff1b\u795d n.\u613f\u671b\uff0c\u5e0c\u671b\uff1b[pl.]\u795d\u613f"

    aput-object v3, v0, v2

    const/16 v2, 0x88c

    .line 2365
    const-string v3, "2189. harsh a.\u7c97\u7cd9\u7684\uff1b(\u58f0\u97f3)\u523a\u8033\u7684\uff1b\u82db\u523b\u7684\uff0c\u4e25\u9177\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x88d

    .line 2366
    const-string v3, "2190. bush n.\u704c\u6728(\u4e1b)"

    aput-object v3, v0, v2

    const/16 v2, 0x88e

    .line 2367
    const-string v3, "2191. blush v./n.\u8138\u7ea2"

    aput-object v3, v0, v2

    const/16 v2, 0x88f

    .line 2368
    const-string v3, "2192. flush n.\u8138\u7ea2v.\u53d1\u7ea2;\u5954\u6d41a.\u6d0b\u6ea2\u7684;\u5bcc\u88d5\u7684;\u9f50\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x890

    .line 2369
    const-string v3, "2193. push v.\u63a8;\u50ac\u903c,\u903c\u8feb n.\u63a8,\u63a8\u529b;\u4fc3\u8fdb,\u63a8\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x891

    .line 2370
    const-string v3, "2194. rush v.(\u4f7f)\u51b2;\u5954n.\u51b2,\u6025\u901f\u884c\u8fdb a.(\u4ea4\u901a)\u7e41\u5fd9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x892

    .line 2371
    const-string v3, "2195. brush n.\u5237(\u5b50),\u6bdb\u5237;\u753b\u7b14 v.\u5237,\u64e6,\u63b8,\u62c2;\u63a0\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x893

    .line 2372
    const-string v3, "2196. crush n./v.\u538b\u788e,\u538b\u574f v.\u538b\u670d,\u538b\u57ae"

    aput-object v3, v0, v2

    const/16 v2, 0x894

    .line 2373
    const-string v3, "2197. bath n.\u6c90\u6d74,\u6d17\u6fa1;\u6d74\u5ba4(\u6c60,\u76c6) v.(\u7ed9\u2026)\u6d17\u6fa1"

    aput-object v3, v0, v2

    const/16 v2, 0x895

    .line 2374
    const-string v3, "2198. death n.\u6b7b\uff0c\u6b7b\u4ea1\uff1b\u706d\u4ea1\uff0c\u6bc1\u706d\uff0c\u6b7b\u56e0"

    aput-object v3, v0, v2

    const/16 v2, 0x896

    .line 2375
    const-string v3, "2199. beneath prep.\u5728\u2026\u4e0b\u8fb9,\u5728\u2026\u4e4b\u4e0b ad.\u5728\u4e0b\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0x897

    .line 2376
    const-string v3, "2200. underneath prep.\u5728\u2026\u4e0b\u9762 ad.\u5728\u4e0b\u9762,\u5728\u5e95\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x898

    .line 2377
    const-string v3, "2201. breath n.\u547c\u5438,\u6c14\u606f"

    aput-object v3, v0, v2

    const/16 v2, 0x899

    .line 2378
    const-string v3, "2202. wreath n.\u82b1\u73af,\u82b1\u5708"

    aput-object v3, v0, v2

    const/16 v2, 0x89a

    .line 2379
    const-string v3, "2203. oath n.\u8a93\u8a00,\u8a93\u7ea6,\u8bc5\u5492"

    aput-object v3, v0, v2

    const/16 v2, 0x89b

    .line 2380
    const-string v3, "2204. path n.\u5c0f\u8def,\u5c0f\u5f84;\u8def\u7ebf,\u8f68\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x89c

    .line 2381
    const-string v3, "2205. breadth n.\u5bbd\u5ea6,\u5e45"

    aput-object v3, v0, v2

    const/16 v2, 0x89d

    .line 2382
    const-string v3, "2206. width n.\u5bbd\u5ea6;\u5bbd\u9614,\u5e7f\u9614"

    aput-object v3, v0, v2

    const/16 v2, 0x89e

    .line 2383
    const-string v3, "2207. length n.\u957f,\u957f\u5ea6;\u4e00\u6bb5,\u4e00\u8282,\u7a0b\u5ea6,\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x89f

    .line 2384
    const-string v3, "2208. strength n.\u529b\uff0c\u529b\u91cf\uff1b\u5b9e\u529b\uff1b\u957f\u5904\uff0c\u4f18\u70b9\uff1b\u4eba\u529b\uff1b\u5175\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x8a0

    .line 2385
    const-string v3, "2209. faith n.\u4fe1\u4efb,\u4fe1\u7528;\u4fe1\u4ef0,\u4fe1\u6761"

    aput-object v3, v0, v2

    const/16 v2, 0x8a1

    .line 2386
    const-string v3, "2210. with prep.\u8ddf\u2026\u4e00\u8d77\uff1b\u7528\uff1b\u5177\u6709\uff1b\u5173\u4e8e\uff1b\u56e0\uff1b\u968f\u7740"

    aput-object v3, v0, v2

    const/16 v2, 0x8a2

    .line 2387
    const-string v3, "2211. health n.\u5065\u5eb7,\u5065\u5eb7\u72b6\u51b5;\u536b\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x8a3

    .line 2388
    const-string v3, "2212. wealth n.\u8d22\u5bcc,\u8d22\u4ea7;\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x8a4

    .line 2389
    const-string v3, "2213. commonwealth n.\u5171\u548c\u56fd,\u8054\u90a6,\u5171\u540c\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x8a5

    .line 2390
    const-string v3, "2214. warmth n.\u6696\u548c,\u6e29\u6696;\u70ed\u5fc3,\u70ed\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x8a6

    .line 2391
    const-string v3, "2215. month n.\u6708,\u6708\u4efd"

    aput-object v3, v0, v2

    const/16 v2, 0x8a7

    .line 2392
    const-string v3, "2216. both prep.\u4e24\u8005(\u90fd)\uff0c\u53cc\u65b9(\u90fd\uff09 adj.\u4e24\u4e2a..(\u90fd)"

    aput-object v3, v0, v2

    const/16 v2, 0x8a8

    .line 2393
    const-string v3, "2217. cloth n.(\u4e00\u5757)\u5e03,\u7ec7\u7269,\u8863\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x8a9

    .line 2394
    const-string v3, "2218. booth n.\u7535\u8bdd\u4ead,\u8d27\u644a"

    aput-object v3, v0, v2

    const/16 v2, 0x8aa

    .line 2395
    const-string v3, "2219. smooth a.\u5149\u6ed1\u7684;\u987a\u5229\u7684;\u67d4\u548c\u7684 v.(over)\u63a9\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x8ab

    .line 2396
    const-string v3, "2220. tooth n.(pl.teeth)\u7259\u9f7f\uff1b\u9f7f\u72b6\u7269\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x8ac

    .line 2397
    const-string v3, "2221. depth n.\u6df1\uff0c\u6df1\u5ea6,\u6df1\u5965,\u6df1\u523b"

    aput-object v3, v0, v2

    const/16 v2, 0x8ad

    .line 2398
    const-string v3, "2222. earth n.\u5730\u7403\uff1b\u9646\u5730\uff1b\u6ce5\u571f\uff0c\u571f\u58e4\uff1b\u5c18\u4e16\uff0c\u4eba\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x8ae

    .line 2399
    const-string v3, "2223. birth n.\u51fa\u751f\uff0c\u8bde\u751f\uff1b\u51fa\u8eab\uff0c\u8840\u7edf\uff1b\u8d77\u6e90\uff1b\u51fa\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0x8af

    .line 2400
    const-string v3, "2224. forth ad.\u5411\u524d\uff1b\u5411\u5916\uff0c\u5f80\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0x8b0

    .line 2401
    const-string v3, "2225. henceforth ad.\u4eca\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0x8b1

    .line 2402
    const-string v3, "2226. north n.\u5317,\u5317\u65b9 a.\u5317\u65b9\u7684,\u5317\u90e8 ad.\u5411\u5317\u65b9,\u5728\u5317\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0x8b2

    .line 2403
    const-string v3, "2227. worth n.\u4ef7\u503c a.\u503c\u2026\u7684,\u4ef7\u503c\u2026\u7684,\u503c\u5f97\u2026\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8b3

    .line 2404
    const-string v3, "2228. mouth n.\u53e3,\u5634"

    aput-object v3, v0, v2

    const/16 v2, 0x8b4

    .line 2405
    const-string v3, "2229. south n.\u5357,\u5357\u65b9,\u5357\u90e8 a.\u5357\u65b9\u7684,\u5357\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8b5

    .line 2406
    const-string v3, "2230. youth n.\u9752\u5e74;\u5e74\u8f7b\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x8b6

    .line 2407
    const-string v3, "2231. truth n.\u771f\u5b9e\uff0c\u771f\u76f8\uff1b\u771f\u5b9e\u6027\uff1b\u771f\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x8b7

    .line 2408
    const-string v3, "2232. growth n.\u751f\u957f,\u589e\u957f,\u53d1\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0x8b8

    .line 2409
    const-string v3, "2233. myth n.\u795e\u8bdd;\u865a\u6784\u7684\u7406\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x8b9

    .line 2410
    const-string v3, "2234. I pron.(\u4e3b\u683c)\u6211"

    aput-object v3, v0, v2

    const/16 v2, 0x8ba

    .line 2411
    const-string v3, "2235. hi interj.(hey)\u55e8!\u5582!"

    aput-object v3, v0, v2

    const/16 v2, 0x8bb

    .line 2412
    const-string v3, "2236. ski n.\u96ea\u6a47 v.\u6ed1\u96ea"

    aput-object v3, v0, v2

    const/16 v2, 0x8bc

    .line 2413
    const-string v3, "2237. taxi n.\u51fa\u79df\u6c7d\u8f66v.[\u6307\u98de\u673a](\u4f7f)\u6ed1\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x8bd

    .line 2414
    const-string v3, "2238. leak v.\u6f0f,\u6cc4\u6f0f n.\u6f0f\u6d1e,\u6f0f\u9699;\u6cc4\u6f0f,\u6f0f\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x8be

    .line 2415
    const-string v3, "2239. bleak a.\u8352\u51c9\u7684;\u51b7\u9177\u7684;\u6ca1\u6709\u5e0c\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8bf

    .line 2416
    const-string v3, "2240. sneak vi.\u5077\u5077\u5730\u8d70\uff0c\u6e9cvt.\u5077\u5077\u5730\u505a(\u6216\u62ff\u3001\u5403)"

    aput-object v3, v0, v2

    const/16 v2, 0x8c0

    .line 2417
    const-string v3, "2241. peak n.\u5c71\u9876,\u6700\u9ad8\u70b9;\u5cf0,\u5c71\u5cf0 a.\u9ad8\u5cf0\u7684,\u6700\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8c1

    .line 2418
    const-string v3, "2242. speak v.\u8bf4\u8bdd\uff0c\u8bb2\u8bdd\uff1b\u6f14\u8bf4\uff0c\u53d1\u8a00\uff1b(in)\u8bf4\u67d0\u79cd\u8bed\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x8c2

    .line 2419
    const-string v3, "2243. break vt.\u6253\u7834\uff1b\u4e2d\u6b62\uff1b\u8fdd\u53cd vi.\u7834(\u88c2) n.\u4f11\u606f\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x8c3

    .line 2420
    const-string v3, "2244. outbreak n.(\u6218\u4e89,\u6124\u6012,\u706b\u707e\u7b49\u7684)\u7206\u53d1,(\u75be\u75c5\u7684)\u53d1\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0x8c4

    .line 2421
    const-string v3, "2245. steak n.\u725b\u6392\uff1b\u5927\u5757\u8089(\u6216\u9c7c)\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x8c5

    .line 2422
    const-string v3, "2246. weak a.\u865a\u5f31\u7684,\u8f6f\u5f31\u7684;\u4e0d\u591f\u6807\u51c6\u7684;\u6de1\u8584\u7684,\u7a00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8c6

    .line 2423
    const-string v3, "2247. oak n.\u6a61\u6811,\u6a61\u6728 a.\u6a61\u6728\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8c7

    .line 2424
    const-string v3, "2248. cloak n.\u6597\u84ec\uff0c\u62ab\u98ce\uff1b\u63a9\u9970\uff0c\u5e4c\u5b50vt.\u63a9\u76d6\uff0c\u63a9\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x8c8

    .line 2425
    const-string v3, "2249. soak v.\u6d78\u6ce1,\u6d78\u6e7f,\u6d78\u900f"

    aput-object v3, v0, v2

    const/16 v2, 0x8c9

    .line 2426
    const-string v3, "2250. back a.\u540e\u9762\u7684 ad.\u5411\u540e v.\u5012\u9000\uff1b\u652f\u6301 n.\u80cc\uff1b\u540e\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x8ca

    .line 2427
    const-string v3, "2251. feedback n.\u53cd\u9988;\u53cd\u5e94;\u56de\u6388"

    aput-object v3, v0, v2

    const/16 v2, 0x8cb

    .line 2428
    const-string v3, "2252. paperback n.\u5e73\u88c5\u672c\uff0c\u7b80\u88c5\u672c"

    aput-object v3, v0, v2

    const/16 v2, 0x8cc

    .line 2429
    const-string v3, "2253. setback n.\u632b\u6298\uff1b\u5931\u6548\uff1b\u590d\u53d1\uff1b\u5012\u9000"

    aput-object v3, v0, v2

    const/16 v2, 0x8cd

    .line 2430
    const-string v3, "2254. drawback n.\u6b20\u7f3a,\u7f3a\u70b9;\u9000\u8fd8\u7684\u5173\u7a0e"

    aput-object v3, v0, v2

    const/16 v2, 0x8ce

    .line 2431
    const-string v3, "2255. hijack v.\u52ab\u6301\uff0c\u52ab\u673a\uff0c\u62e6\u8def\u62a2\u52ab"

    aput-object v3, v0, v2

    const/16 v2, 0x8cf

    .line 2432
    const-string v3, "2256. lack n./v.\u7f3a\u4e4f,\u4e0d\u8db3"

    aput-object v3, v0, v2

    const/16 v2, 0x8d0

    .line 2433
    const-string v3, "2257. black a.\u9ed1(\u8272)\u7684\uff1b\u9ed1\u6697\u7684 n.\u9ed1(\u8272)\uff1b\u9ed1\u6697\uff1b\u9ed1\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x8d1

    .line 2434
    const-string v3, "2258. slack a.\u61c8\u6020\u7684,\u677e\u9a70\u7684;\u8427\u6761\u7684 n.\u6de1\u5b63;(pl.)\u4fbf\u88e4"

    aput-object v3, v0, v2

    const/16 v2, 0x8d2

    .line 2435
    const-string v3, "2259. snack n.\u5feb\u9910,\u5c0f\u5403,\u70b9\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x8d3

    .line 2436
    const-string v3, "2260. pack v.\u6346\u624e,\u6253\u5305;\u585e\u6ee1,\u6324\u6ee1n.\u5305\u88f9,\u80cc\u5305,\u4e00\u7fa4/\u526f"

    aput-object v3, v0, v2

    const/16 v2, 0x8d4

    .line 2437
    const-string v3, "2261. rack n.\u6302\u7269\u67b6,\u6401\u7269\u67b6 v.\u4f7f\u75db\u82e6,\u6298\u78e8"

    aput-object v3, v0, v2

    const/16 v2, 0x8d5

    .line 2438
    const-string v3, "2262. crack n.\u88c2\u7eb9,\u7f1d\u9699;\u7834\u88c2\u58f0 v.(\u4f7f)\u7834\u88c2,\u7838\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x8d6

    .line 2439
    const-string v3, "2263. track n.\u8dd1\u9053,\u5c0f\u8def;\u8f68\u8ff9,\u8f6e\u8ff9 v.\u8ddf\u8e2a,\u8ffd\u8e2a"

    aput-object v3, v0, v2

    const/16 v2, 0x8d7

    .line 2440
    const-string v3, "2264. sack n.\u888b,\u5305,\u9ebb\u888b v.\u89e3\u96c7"

    aput-object v3, v0, v2

    const/16 v2, 0x8d8

    .line 2441
    const-string v3, "2265. stack n.\u5806,\u4e00\u5806 v.\u5806\u79ef,\u5806\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x8d9

    .line 2442
    const-string v3, "2266. attack v./n.\u653b\u51fb\uff0c\u62a8\u51fb\uff1b\u7740\u624b\uff0c\u5f00\u59cb  n.(\u75c5)\u53d1\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0x8da

    .line 2443
    const-string v3, "2267. "

    aput-object v3, v0, v2

    const/16 v2, 0x8db

    .line 2444
    const-string v3, "2268. "

    aput-object v3, v0, v2

    const/16 v2, 0x8dc

    .line 2445
    const-string v3, "2269. deck n.\u7532\u677f"

    aput-object v3, v0, v2

    const/16 v2, 0x8dd

    .line 2446
    const-string v3, "2270. neck n.\u9888\u8116"

    aput-object v3, v0, v2

    const/16 v2, 0x8de

    .line 2447
    const-string v3, "2271. wreck n.\u5931\u4e8b\u8239(\u6216\u98de\u673a)v.(\u8239\u7b49)\u5931\u4e8b,\u9047\u96be;\u7834\u574f"

    aput-object v3, v0, v2

    const/16 v2, 0x8df

    .line 2448
    const-string v3, "2272. thick a.\u539a\u7684\uff0c\u7c97\u7684\uff0c\u7a20\u7684\uff0c\u6d53\u7684  ad.\u539a\uff0c\u6d53\uff0c\u5bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x8e0

    .line 2449
    const-string v3, "2273. kick n./v.\u8e22"

    aput-object v3, v0, v2

    const/16 v2, 0x8e1

    .line 2450
    const-string v3, "2274. lick vt.\u8214\uff1b(\u706b\u7130\u6216\u6d6a)\u63a0\u8fc7\uff1b\u6253\u8d25 n.\u8214\uff1b\u5c11\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x8e2

    .line 2451
    const-string v3, "2275. click n.\u6ef4\u7b54\u58f0\uff1bvi.\u53d1\u51fa\u6ef4\u7b54\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0x8e3

    .line 2452
    const-string v3, "2276. pick v.\u62fe,\u91c7,\u6458;\u6311\u9009,\u9009\u62e9 n.\u9550,\u9e64\u5634\u9504"

    aput-object v3, v0, v2

    const/16 v2, 0x8e4

    .line 2453
    const-string v3, "2277. brick n.\u7816\u5757\uff0c\u7816\uff1bv.\u7528\u7816\u56f4\u780c\uff0c\u7528\u7816\u586b\u8865"

    aput-object v3, v0, v2

    const/16 v2, 0x8e5

    .line 2454
    const-string v3, "2278. prick n./v.\u523a\u4f24,\u523a\u75db,\u523a\u5b54"

    aput-object v3, v0, v2

    const/16 v2, 0x8e6

    .line 2455
    const-string v3, "2279. trick n.\u8be1\u8ba1,\u9a97\u5c40;\u6076\u4f5c\u5267;\u7a8d\u95e8 vt.\u6b3a\u9a97,\u54c4\u9a97"

    aput-object v3, v0, v2

    const/16 v2, 0x8e7

    .line 2456
    const-string v3, "2280. sick a.\u6709\u75c5\u7684,\u60a3\u75c5\u7684;\u6076\u5fc3\u7684,\u60f3\u5410\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x8e8

    .line 2457
    const-string v3, "2281. tick n.\u6ef4\u7b54\u58f0;\u52fe\u53f7 v.\u6ef4\u7b54\u54cd;\u6253\u52fe\u53f7\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x8e9

    .line 2458
    const-string v3, "2282. stick n.\u68cd,\u68d2,\u624b\u6756 v.\u523a,\u6233,\u624e;\u7c98\u8d34"

    aput-object v3, v0, v2

    const/16 v2, 0x8ea

    .line 2459
    const-string v3, "2283. quick a.\u5feb\u7684;\u7075\u654f\u7684,\u4f36\u4fd0\u7684;\u654f\u9510\u7684 ad.\u5feb,\u8fc5\u901f\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x8eb

    .line 2460
    const-string v3, "2284. cock n.\u516c\u9e21,\u96c4\u9e21;\u9f99\u5934,\u5f00\u5173"

    aput-object v3, v0, v2

    const/16 v2, 0x8ec

    .line 2461
    const-string v3, "2285. dock n.\u8239\u575e,\u7801\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0x8ed

    .line 2462
    const-string v3, "2286. shock n.\u9707\u52a8;\u7535\u51fb,\u89e6\u7535;\u4f11\u514bv.(\u4f7f)\u9707\u52a8/\u9707\u60ca"

    aput-object v3, v0, v2

    const/16 v2, 0x8ee

    .line 2463
    const-string v3, "2287. lock n.\u9501 v.\u9501,\u9501\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x8ef

    .line 2464
    const-string v3, "2288. block n.\u5927\u5757\u6728\uff08\u77f3\uff09\u6599;\u8857\u533a;\u969c\u788d\u7269 v.\u963b\u585e,\u62e6\u963b"

    aput-object v3, v0, v2

    const/16 v2, 0x8f0

    .line 2465
    const-string v3, "2289. clock n.\u949f vt.\u8bb0\u5f55(\u65f6\u95f4\u3001\u901f\u5ea6\u7b49)\uff0c\u4e3a\u2026\u8ba1\u65f6"

    aput-object v3, v0, v2

    const/16 v2, 0x8f1

    .line 2466
    const-string v3, "2290. o\'clock ad.(\u2026)\u70b9\u949f(\u4e0e1\u81f312\u6570\u5b57\u8fde\u7528)"

    aput-object v3, v0, v2

    const/16 v2, 0x8f2

    .line 2467
    const-string v3, "2291. flock n.(\u4e00)\u7fa4,(\u79bd,\u755c\u7b49\u7684)\u7fa4;\u5927\u91cf v.\u7fa4\u96c6,\u6210\u7fa4"

    aput-object v3, v0, v2

    const/16 v2, 0x8f3

    .line 2468
    const-string v3, "2292. mock v.\u5632\u7b11 a.\u5047\u7684,\u6a21\u62df\u7684 n.(\u5e38pl.)\u6a21\u62df\u8003\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x8f4

    .line 2469
    const-string v3, "2293. knock v.\u6572,\u6572\u6253,\u78b0\u649e n.\u6572,\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0x8f5

    .line 2470
    const-string v3, "2294. rock n.\u5ca9\u77f3,\u77f3\u5757 v.\u6447,\u6447\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x8f6

    .line 2471
    const-string v3, "2295. sock n.(pl.)\u77ed\u889c"

    aput-object v3, v0, v2

    const/16 v2, 0x8f7

    .line 2472
    const-string v3, "2296. stock n.\u5907\u6599,\u5e93\u5b58,\u73b0\u8d27;\u80a1\u7968,\u516c\u503a v.\u50a8\u5b58"

    aput-object v3, v0, v2

    const/16 v2, 0x8f8

    .line 2473
    const-string v3, "2297. duck n.\u9e2d,\u9e2d\u8089 v.\u8fc5\u901f\u4fef\u8eab;\u5feb\u901f\u4f4e\u5934;\u8eb2\u907f"

    aput-object v3, v0, v2

    const/16 v2, 0x8f9

    .line 2474
    const-string v3, "2298. luck n.\u8fd0\u6c14;\u597d\u8fd0,\u4fa5\u5e78"

    aput-object v3, v0, v2

    const/16 v2, 0x8fa

    .line 2475
    const-string v3, "2299. truck n.\u5361\u8f66,\u8f7d\u91cd\u6c7d\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x8fb

    .line 2476
    const-string v3, "2300. suck v.&n.\u5438\uff0c\u8210\uff1b\u5438\u6536(\u53d6)"

    aput-object v3, v0, v2

    const/16 v2, 0x8fc

    .line 2477
    const-string v3, "2301. tuck v.\u5377\u8d77;\u585e\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x8fd

    .line 2478
    const-string v3, "2302. cheek n.\u9762\u988a,\u8138"

    aput-object v3, v0, v2

    const/16 v2, 0x8fe

    .line 2479
    const-string v3, "2303. seek v.(after,for)\u5bfb\u627e,\u63a2\u7d22;\u8bd5\u56fe,\u4f01\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x8ff

    .line 2480
    const-string v3, "2304. week n.\u661f\u671f\uff0c\u5468"

    aput-object v3, v0, v2

    const/16 v2, 0x900

    .line 2481
    const-string v3, "2305. chalk n.\u7c89\u7b14,\u767d\u57a9"

    aput-object v3, v0, v2

    const/16 v2, 0x901

    .line 2482
    const-string v3, "2306. talk n.\u8c08\u8bdd\uff1b\u804a\u5929\uff1b\u8bb2\u8bdd\uff1b\u6f14\u8bb2 v.\u8bf4\u8bdd\uff1b\u4ea4\u8c08"

    aput-object v3, v0, v2

    const/16 v2, 0x902

    .line 2483
    const-string v3, "2307. stalk n.\u830e\uff0c\u6897vt.\u6084\u6084\u5730\u8ddf\u8e2avi.\u9ad8\u89c6\u9614\u6b65\u5730\u8d70"

    aput-object v3, v0, v2

    const/16 v2, 0x903

    .line 2484
    const-string v3, "2308. walk v.\u8d70\uff0c\u6b65\u884c\uff0c\u6563\u6b65\uff1b\u8d70\u904d n.\u8d70\uff0c\u6b65\u884c\uff0c\u6563\u6b65"

    aput-object v3, v0, v2

    const/16 v2, 0x904

    .line 2485
    const-string v3, "2309. milk n.\u725b\u5976\uff1b(\u690d\u7269\u6d41\u51fa\u7684)\u767d\u8272\u4e73\u6db2 v.\u6324\u5976"

    aput-object v3, v0, v2

    const/16 v2, 0x905

    .line 2486
    const-string v3, "2310. silk n.\u4e1d,\u7ef8"

    aput-object v3, v0, v2

    const/16 v2, 0x906

    .line 2487
    const-string v3, "2311. folk n.\u4eba\u4eec;\u6c11\u65cf;\u4eb2\u5c5e a.\u6c11\u95f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x907

    .line 2488
    const-string v3, "2312. bulk n.\u4f53\u79ef,\u5bb9\u79ef;\u4e3b\u4f53,\u5927\u6279,\u5927\u91cf,\u5927\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0x908

    .line 2489
    const-string v3, "2313. bank n.\u94f6\u884c\uff1b\u5cb8,\u5824\uff1bvi.\u5b58\u5165(\u7ecf\u8425)\u94f6\u884c\uff1b\u4fe1\u8d56"

    aput-object v3, v0, v2

    const/16 v2, 0x909

    .line 2490
    const-string v3, "2314. thank vt.\u611f\u8c22int.[-s]\u8c22\u8c22n.[pl.]\u611f\u8c22(\u610f)"

    aput-object v3, v0, v2

    const/16 v2, 0x90a

    .line 2491
    const-string v3, "2315. blank a.\u7a7a\u767d\u7684,\u7a7a\u7740\u7684;\u5931\u8272\u7684 n.\u7a7a\u767d;\u8868\u683c"

    aput-object v3, v0, v2

    const/16 v2, 0x90b

    .line 2492
    const-string v3, "2316. rank n.\u519b\u8854,\u793e\u4f1a\u9636\u5c42;\u6392 v.\u5206\u7b49\u7ea7,\u628a\u2026\u5206\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x90c

    .line 2493
    const-string v3, "2317. frank a.\u5766\u767d\u7684,\u76f4\u7387\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x90d

    .line 2494
    const-string v3, "2318. tank n.\u7f50,\u69fd,\u7bb1\uff1b\u5766\u514b vt.\u50a8\u4e8e\u69fd\u4e2d"

    aput-object v3, v0, v2

    const/16 v2, 0x90e

    .line 2495
    const-string v3, "2319. ink n.\u58a8\u6c34\uff0c\u6cb9\u58a8"

    aput-object v3, v0, v2

    const/16 v2, 0x90f

    .line 2496
    const-string v3, "2320. think v.\u60f3\uff0c\u601d\u7d22\uff1b\u8ba4\u4e3a\uff0c\u4ee5\u4e3a\uff1b\u60f3\u8981\uff1b\u6599\u60f3\uff0c\u9884\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0x910

    .line 2497
    const-string v3, "2321. link v.\u8fde\u63a5,\u8054\u7cfb n.\u73af\u8282,\u94fe\u73af"

    aput-object v3, v0, v2

    const/16 v2, 0x911

    .line 2498
    const-string v3, "2322. pink n.\u7c89\u7ea2\u8272 a.\u7c89\u7ea2\u8272\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x912

    .line 2499
    const-string v3, "2323. drink v.(drank,drunk)\u559d\uff0c\u996e n.\u996e\u6599\uff1b\u559d\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0x913

    .line 2500
    const-string v3, "2324. shrink v.\u8d77\u76b1,\u6536\u7f29;\u9000\u7f29,\u754f\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x914

    .line 2501
    const-string v3, "2325. sink v.(\u4f7f)\u4e0b\u6c89,\u4e0b\u843d n.\u6c34\u69fd,\u6c34\u6c60"

    aput-object v3, v0, v2

    const/16 v2, 0x915

    .line 2502
    const-string v3, "2326. wink v.(\u4f7f)\u7728\u773c\uff1b\u7728\u773c\u793a\u610f n.\u7728\u773c\uff1b\u5c0f\u7761\uff0c\u6253\u76f9"

    aput-object v3, v0, v2

    const/16 v2, 0x916

    .line 2503
    const-string v3, "2327. junk n.\u5e9f\u7269\uff0c\u65e7\u8d27\uff1b\u8222\u677f"

    aput-object v3, v0, v2

    const/16 v2, 0x917

    .line 2504
    const-string v3, "2328. drunk a.\u9189\u9152\u7684\uff1b(\u55bb)\u9676\u9189\u7684 n.\u9157\u9152\u8005\uff0c\u9189\u6c49"

    aput-object v3, v0, v2

    const/16 v2, 0x918

    .line 2505
    const-string v3, "2329. trunk n.\u5927\u8863\u7bb1,\u76ae\u7bb1;(\u6c7d\u8f66\u540e\u90e8)\u884c\u674e\u7bb1;\u6811\u5e72,\u8eaf\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0x919

    .line 2506
    const-string v3, "2330. book n.\u4e66\uff0c\u4e66\u7c4d vt.\u8ba2(\u7968\uff0c\u5ea7\u4f4d\uff0c\u623f\u95f4\u7b49)\uff0c\u9884\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x91a

    .line 2507
    const-string v3, "2331. handbook n.\u624b\u518c,\u6307\u5357"

    aput-object v3, v0, v2

    const/16 v2, 0x91b

    .line 2508
    const-string v3, "2332. notebook n.\u7b14\u8bb0\u672c"

    aput-object v3, v0, v2

    const/16 v2, 0x91c

    .line 2509
    const-string v3, "2333. textbook n.\u8bfe\u672c,\u6559\u79d1\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0x91d

    .line 2510
    const-string v3, "2334. cook n.\u53a8\u5e08 v.\u70f9\u8c03\uff0c\u70e7\u716e\uff1b\u7e82\u6539(\u8d26\u76ee)\uff0c\u634f\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0x91e

    .line 2511
    const-string v3, "2335. hook n.\u94a9,\u540a\u94a9,\u94a9\u72b6\u7269 v.\u94a9\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x91f

    .line 2512
    const-string v3, "2336. look vi./n.\u770b\uff0c\u6ce8\u89c6 v.\u597d\u50cf\uff0c\u663e\u5f97 n.\u5916\u8868\uff0c\u8138\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x920

    .line 2513
    const-string v3, "2337. overlook v.\u770b\u6f0f,\u5ffd\u7565;\u4fef\u77b0,\u773a\u671b;\u5bbd\u5bb9,\u653e\u4efb"

    aput-object v3, v0, v2

    const/16 v2, 0x921

    .line 2514
    const-string v3, "2338. outlook n.\u666f\u8272,\u98ce\u5149;\u89c2\u70b9,\u89c1\u89e3;\u5c55\u671b,\u524d\u666f"

    aput-object v3, v0, v2

    const/16 v2, 0x922

    .line 2515
    const-string v3, "2339. brook n.\u5c0f\u6eaavt.[\u5e38\u7528\u4e8e\u5426\u5b9a\u53e5\u6216\u7591\u95ee\u53e5]\u5bb9\u5fcd"

    aput-object v3, v0, v2

    const/16 v2, 0x923

    .line 2516
    const-string v3, "2340. bark vi.(\u72d7\u7b49)\u5420\uff0c\u53ebn.\u5420\u58f0\uff0c\u53eb\u58f0\uff1b\u6811\u76ae"

    aput-object v3, v0, v2

    const/16 v2, 0x924

    .line 2517
    const-string v3, "2341. embark v.(\u4f7f)\u4e0a\u8239(\u6216\u98de\u673a,\u6c7d\u8f66\u7b49);\u7740\u624b,\u4ece\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x925

    .line 2518
    const-string v3, "2342. dark a.\u9ed1\u6697\u7684\uff0c\u6df1(\u8272)\u7684\uff1b\u9690\u79d8\u7684\uff1bn.\u65e0\u5149\uff0c\u9ed1\u6697"

    aput-object v3, v0, v2

    const/16 v2, 0x926

    .line 2519
    const-string v3, "2343. shark n.\u9ca8\u9c7c"

    aput-object v3, v0, v2

    const/16 v2, 0x927

    .line 2520
    const-string v3, "2344. mark n.\u75d5\u8ff9;\u8bb0\u53f7;\u5206\u6570 v.\u6807\u8bb0,\u6253\u5206,\u4f7f\u6709\u7279\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x928

    .line 2521
    const-string v3, "2345. trademark n.\u5546\u6807\uff1b\u7279\u5f81 vt.\u6ce8\u518c\u7684\u2026\u5546\u6807"

    aput-object v3, v0, v2

    const/16 v2, 0x929

    .line 2522
    const-string v3, "2346. remark n.(about,on)\u8bc4\u8bed,\u610f\u89c1 v.(on)\u8bc4\u8bba;\u6ce8\u610f\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x92a

    .line 2523
    const-string v3, "2347. park n.\u516c\u56ed,\u505c\u8f66\u573a,\u8fd0\u52a8\u573a v.\u505c\u653e(\u6c7d\u8f66\u7b49),\u5bc4\u653e"

    aput-object v3, v0, v2

    const/16 v2, 0x92b

    .line 2524
    const-string v3, "2348. spark n.\u706b\u82b1,\u706b\u661f v.\u53d1\u706b\u82b1,\u53d1\u7535\u82b1"

    aput-object v3, v0, v2

    const/16 v2, 0x92c

    .line 2525
    const-string v3, "2349. clerk n.\u804c\u5458,\u529e\u4e8b\u5458;\u5e97\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x92d

    .line 2526
    const-string v3, "2350. fork n.\u53c9,\u8019;\u53c9\u5f62\u7269;\u9910\u53c9"

    aput-object v3, v0, v2

    const/16 v2, 0x92e

    .line 2527
    const-string v3, "2351. pork n.\u732a\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x92f

    .line 2528
    const-string v3, "2352. work n.\u5de5\u4f5c(\u91cf)\uff1b\u4f5c\u54c1\uff1b[pl.]\u5de5\u5382 v.\u5de5\u4f5c\uff1b\u8fd0\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0x930

    .line 2529
    const-string v3, "2353. framework n.\u6784\u67b6;\u6846\u67b6;\u7ed3\u6784;\u7ec4\u7ec7;\u673a\u6784"

    aput-object v3, v0, v2

    const/16 v2, 0x931

    .line 2530
    const-string v3, "2354. homework n.(\u5b66\u751f\u7684)\u5bb6\u5ead\u4f5c\u4e1a\u3001\u8bfe\u5916\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x932

    .line 2531
    const-string v3, "2355. housework n.\u5bb6\u52a1\uff0c\u5bb6\u4e8b(\u4e0d\u53ef\u6570)"

    aput-object v3, v0, v2

    const/16 v2, 0x933

    .line 2532
    const-string v3, "2356. network n.\u7f51\u72b6\u7269;\u5e7f\u64ad\u7f51,\u7535\u89c6\u7f51;\u7f51\u7edc"

    aput-object v3, v0, v2

    const/16 v2, 0x934

    .line 2533
    const-string v3, "2357. ask vt.\u95ee\uff0c\u8be2\u95ee\uff1b\u8bf7\u6c42\uff0c\u8981\u6c42\uff1b\u9080\u8bf7\uff0c\u7ea6\u8bf7"

    aput-object v3, v0, v2

    const/16 v2, 0x935

    .line 2534
    const-string v3, "2358. mask n.\u9762\u5177,\u9762\u7f69;\u5047\u9762\u5177,\u4f2a\u88c5 v. \u63a9\u9970,\u5316\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x936

    .line 2535
    const-string v3, "2359. task n.\u4efb\u52a1,\u4f5c\u4e1a,\u5de5\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0x937

    .line 2536
    const-string v3, "2360. desk n.\u4e66\u684c\uff0c\u529e\u516c\u684c\uff0c\u670d\u52a1\u53f0"

    aput-object v3, v0, v2

    const/16 v2, 0x938

    .line 2537
    const-string v3, "2361. risk v.\u5192\u2026\u7684\u5371\u9669 n.\u5192\u9669;\u98ce\u9669"

    aput-object v3, v0, v2

    const/16 v2, 0x939

    .line 2538
    const-string v3, "2362. brisk a.\u8f7b\u5feb\u7684;\u751f\u6c14\u52c3\u52c3\u7684;\u5174\u9686\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x93a

    .line 2539
    const-string v3, "2363. dusk n.\u8584\u66ae,\u9ec4\u660f"

    aput-object v3, v0, v2

    const/16 v2, 0x93b

    .line 2540
    const-string v3, "2364. hawk n.\u9e70,\u96bc"

    aput-object v3, v0, v2

    const/16 v2, 0x93c

    .line 2541
    const-string v3, "2365. global a.\u7403\u5f62\u7684;\u5168\u7403\u7684,\u5168\u4e16\u754c\u7684;\u5168\u9762\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x93d

    .line 2542
    const-string v3, "2366. verbal a.\u7528\u8a00\u8f9e\u7684,\u7528\u6587\u5b57\u7684;\u53e3\u5934\u7684;\u52a8\u8bcd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x93e

    .line 2543
    const-string v3, "2367. radical a.\u57fa\u672c\u7684,\u91cd\u8981\u7684;\u6fc0\u8fdb\u7684,\u6781\u7aef\u7684;\u6839\u672c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x93f

    .line 2544
    const-string v3, "2368. medical a.\u533b\u5b66\u7684\uff0c\u533b\u7597\u7684\uff0c\u533b\u836f\u7684\uff1b\u5185\u79d1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x940

    .line 2545
    const-string v3, "2369. periodical n.\u671f\u520a,\u6742\u5fd7 a.\u5468\u671f\u7684,\u5b9a\u671f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x941

    .line 2546
    const-string v3, "2370. logical a.\u903b\u8f91\u7684,\u7b26\u5408\u903b\u8f91\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x942

    .line 2547
    const-string v3, "2371. physiological a.\u751f\u7406\u5b66\u7684, \u751f\u7406\u5b66\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x943

    .line 2548
    const-string v3, "2372. chemical a.\u5316\u5b66\u7684 n.(pl.)\u5316\u5b66\u5236\u54c1,\u5316\u5b66\u836f\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x944

    .line 2549
    const-string v3, "2373. economical a.\u8282\u7ea6\u7684,\u7ecf\u6d4e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x945

    .line 2550
    const-string v3, "2374. mechanical a.\u673a\u68b0\u7684,\u7531\u673a\u6784\u5236\u6210\u7684;\u673a\u68b0\u4f3c\u7684,\u5446\u677f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x946

    .line 2551
    const-string v3, "2375. technical a.\u6280\u672f(\u6027)\u7684\uff0c\u5de5\u827a\u7684\uff1b\u4e13\u95e8\u6027\u7684\uff0c\u4e13\u4e1a\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x947

    .line 2552
    const-string v3, "2376. tropical a.\u70ed\u5e26\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x948

    .line 2553
    const-string v3, "2377. typical a.(of)\u5178\u578b\u7684,\u6709\u4ee3\u8868\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x949

    .line 2554
    const-string v3, "2378. numerical a.\u6570\u5b57\u7684\uff0c\u7528\u6570\u5b57\u8868\u793a\u7684\uff0c\u6570\u503c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94a

    .line 2555
    const-string v3, "2379. hysterical a.\u60c5\u7eea\u5f02\u5e38\u6fc0\u52a8\u7684,\u6b47\u65af\u5e95\u91cc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94b

    .line 2556
    const-string v3, "2380. empirical a.\u51ed\u7ecf\u9a8c(\u6216\u89c2\u5bdf)\u7684,\u7ecf\u9a8c\u4e3b\u4e49\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94c

    .line 2557
    const-string v3, "2381. historical a.\u5386\u53f2\u7684;\u6709\u5173\u5386\u53f2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94d

    .line 2558
    const-string v3, "2382. electrical a.\u7535\u7684,\u7535\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94e

    .line 2559
    const-string v3, "2383. classical a.\u7ecf\u5178\u7684,\u53e4\u5178(\u6587\u5b66)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x94f

    .line 2560
    const-string v3, "2384. musical a.\u97f3\u4e50\u7684;\u6709\u97f3\u4e50\u624d\u80fd\u7684 n.\u97f3\u4e50\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x950

    .line 2561
    const-string v3, "2385. physical a.\u7269\u8d28\u7684;\u8089\u4f53\u7684,\u8eab\u4f53\u7684;\u81ea\u7136\u79d1\u5b66\u7684,\u7269\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x951

    .line 2562
    const-string v3, "2386. mathematical a.\u6570\u5b66\u7684\uff1b\u6570\u5b66\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x952

    .line 2563
    const-string v3, "2387. practical a.\u5b9e\u9645\u7684,\u5b9e\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x953

    .line 2564
    const-string v3, "2388. theoretical a.\u7406\u8bba(\u4e0a)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x954

    .line 2565
    const-string v3, "2389. political a.\u653f\u6cbb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x955

    .line 2566
    const-string v3, "2390. critical a.\u6279\u8bc4\u7684,\u8bc4\u8bba\u7684;\u5371\u6025,\u7d27\u8981\u7684;\u4e34\u754c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x956

    .line 2567
    const-string v3, "2391. identical a.(to.with)\u540c\u4e00\u7684,\u540c\u6837\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x957

    .line 2568
    const-string v3, "2392. skeptical a.\u6000\u7591\u7684 [\u82f1]sceptical"

    aput-object v3, v0, v2

    const/16 v2, 0x958

    .line 2569
    const-string v3, "2393. optical a.\u773c\u7684,\u89c6\u529b\u7684;\u5149\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x959

    .line 2570
    const-string v3, "2394. vertical a.\u5782\u76f4\u7684,\u7ad6\u7684 n.\u5782\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x95a

    .line 2571
    const-string v3, "2395. statistical a.\u7edf\u8ba1\u7684,\u7edf\u8ba1\u5b66\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x95b

    .line 2572
    const-string v3, "2396. local a.\u5730\u65b9\u7684,\u5f53\u5730\u7684;\u5c40\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x95c

    .line 2573
    const-string v3, "2397. reciprocal a.\u76f8\u4e92\u7684,\u5f80\u590d\u7684,\u4e92\u5229\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x95d

    .line 2574
    const-string v3, "2398. vocal a.\u58f0\u97f3\u7684;\u6709\u58f0\u7684;\u6b4c\u5531\u7684 n.\u5143\u97f3;\u58f0\u4e50\u4f5c\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x95e

    .line 2575
    const-string v3, "2399. medal n.\u5956\u7ae0,\u52cb\u7ae0,\u7eaa\u5ff5\u7ae0"

    aput-object v3, v0, v2

    const/16 v2, 0x95f

    .line 2576
    const-string v3, "2400. pedal n.\u8e0f\u677f v.\u8e29\u8e0f\u677f,\u9a91\u81ea\u884c\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x960

    .line 2577
    const-string v3, "2401. scandal n.\u4e11\u95fb,\u8bfd\u8c24,\u803b\u8fb1,\u6d41\u8a00\u871a\u8bed,\u53cd\u611f,\u516c\u6124"

    aput-object v3, v0, v2

    const/16 v2, 0x961

    .line 2578
    const-string v3, "2402. feudal a.\u5c01\u5efa\u7684;\u5c01\u5730\u7684;\u9886\u5730\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x962

    .line 2579
    const-string v3, "2403. conceal v.\u9690\u85cf,\u9690\u7792,\u9690\u853d"

    aput-object v3, v0, v2

    const/16 v2, 0x963

    .line 2580
    const-string v3, "2404. deal v.\u5904\u7406;\u505a\u4e70\u5356,\u7ecf\u8425;\u5206\u914d;\u5bf9\u5f85  n.\u4ea4\u6613"

    aput-object v3, v0, v2

    const/16 v2, 0x964

    .line 2581
    const-string v3, "2405. ideal a.\u7406\u60f3\u7684;\u7a7a\u60f3\u7684;\u7406\u60f3\u4e3b\u4e49\u7684;\u552f\u5fc3\u7684 n.\u7406\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0x965

    .line 2582
    const-string v3, "2406. heal v.\u6cbb\u6108,\u6108\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x966

    .line 2583
    const-string v3, "2407. meal n.\u81b3\u98df,\u4e00\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x967

    .line 2584
    const-string v3, "2408. appeal vi.\u547c\u5401\uff0c\u6073\u6c42\uff1b\u7533\u8bc9 n.\u547c\u5401\uff1b\u7533\u8bc9\uff1b\u5438\u5f15\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x968

    .line 2585
    const-string v3, "2409. real a.\u771f\u7684,\u771f\u5b9e\u7684;\u5b9e\u9645\u7684,\u73b0\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x969

    .line 2586
    const-string v3, "2410. cereal n.\u52a0\u5de5\u800c\u6210\u7684\u8c37\u7c7b\u98df\u7269\uff1b\u8c37\u7c7b\u690d\u7269\uff0c\u8c37\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x96a

    .line 2587
    const-string v3, "2411. seal n.\u5c01\u94c5,\u5c01\u6761;\u5370,\u56fe\u7ae0;\u6d77\u8c79 v.\u5c01,\u5bc6\u5c01"

    aput-object v3, v0, v2

    const/16 v2, 0x96b

    .line 2588
    const-string v3, "2412. steal v.\u5077,\u7a83\u53d6;\u5077\u5077\u5730\u505a,\u5de7\u53d6"

    aput-object v3, v0, v2

    const/16 v2, 0x96c

    .line 2589
    const-string v3, "2413. reveal v.\u5c55\u73b0,\u663e\u793a,\u63ed\u793a,\u63ed\u9732,\u544a\u8bc9,\u6cc4\u9732"

    aput-object v3, v0, v2

    const/16 v2, 0x96d

    .line 2590
    const-string v3, "2414. zeal n.\u70ed\u5fc3\uff0c\u70ed\u5ff1\uff0c\u70ed\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x96e

    .line 2591
    const-string v3, "2415. legal a.\u6cd5\u5f8b\u7684,\u6cd5\u5b9a\u7684;\u5408\u6cd5\u7684,\u6b63\u5f53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x96f

    .line 2592
    const-string v3, "2416. illegal a.\u4e0d\u5408\u6cd5\u7684,\u975e\u6cd5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x970

    .line 2593
    const-string v3, "2417. racial a.\u79cd\u7684,\u79cd\u65cf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x971

    .line 2594
    const-string v3, "2418. special a.\u7279\u6b8a\u7684,\u4e13\u95e8\u7684;\u9644\u52a0\u7684,\u989d\u5916\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x972

    .line 2595
    const-string v3, "2419. judicial a.\u53f8\u6cd5\u7684\uff0c\u6cd5\u5ead\u7684\uff0c\u5ba1\u5224\u7684\uff1b\u660e\u65ad\u7684\uff0c\u516c\u6b63\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x973

    .line 2596
    const-string v3, "2420. beneficial a.(to)\u6709\u5229\u7684,\u6709\u76ca\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x974

    .line 2597
    const-string v3, "2421. official n.\u5b98\u5458,\u884c\u653f\u5b98\u5458 a.\u5b98\u65b9\u7684,\u5b98\u65b9\u7684,\u6b63\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x975

    .line 2598
    const-string v3, "2422. artificial a.\u4eba\u5de5\u7684\uff0c\u4eba\u9020\u7684\uff0c\u4eba\u4e3a\u7684\uff1b\u865a\u4f2a\u7684\uff0c\u505a\u4f5c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x976

    .line 2599
    const-string v3, "2423. superficial a.\u8868\u9762\u7684;\u80a4\u6d45\u7684,\u6d45\u8584\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x977

    .line 2600
    const-string v3, "2424. financial a.\u8d22\u653f\u7684,\u91d1\u878d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x978

    .line 2601
    const-string v3, "2425. social a.\u793e\u4f1a\u7684;\u4ea4\u9645\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x979

    .line 2602
    const-string v3, "2426. commercial a.\u5546\u4e1a\u7684\uff1b\u5546\u52a1\u7684\uff1b\u53ef\u83b7\u5229\u7684 n.\u5e7f\u544a\u8282\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0x97a

    .line 2603
    const-string v3, "2427. crucial a.\u81f3\u5173\u91cd\u8981\u7684,\u51b3\u5b9a\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x97b

    .line 2604
    const-string v3, "2428. dial n.\u949f(\u8868)\u9762,\u523b\u5ea6\u76d8,\u62e8\u53f7\u76d8 v.\u62e8\u53f7,\u6253\u7535\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x97c

    .line 2605
    const-string v3, "2429. cordial a.\u8bda\u6073\u7684,\u4eb2\u5207\u7684,\u70ed\u8bda\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x97d

    .line 2606
    const-string v3, "2430. denial n.\u5426\u8ba4;\u62d2\u7edd;\u5426\u8ba4\u67d0\u4e8b\u6216\u67d0\u4e8b\u5b9e\u7684\u58f0\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x97e

    .line 2607
    const-string v3, "2431. colonial a.\u6b96\u6c11\u5730\u7684\uff0c\u5173\u4e8e\u6b96\u6c11\u7684 n.\u6b96\u6c11\u5730\u5c45\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0x97f

    .line 2608
    const-string v3, "2432. aerial a.(\u5728\u6216\u6765\u81ea)\u7a7a\u4e2d\u7684\uff0c\u822a\u7a7a\u7684 n.\u5929\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x980

    .line 2609
    const-string v3, "2433. imperial a.\u5e1d\u56fd\u7684\uff0c\u5e1d\u738b\u7684\uff1b(\u5ea6\u91cf\u8861)\u82f1\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x981

    .line 2610
    const-string v3, "2434. serial n.\u8fde\u8f7d\u5c0f\u8bf4\uff0c\u8fde\u7eed\u5267\uff1b\u8fde\u8f7d\u520a\u7269 a.\u8fde\u7eed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x982

    .line 2611
    const-string v3, "2435. material n.\u6750\u6599,\u539f\u6599,\u8d44\u6599a.\u7269\u8d28\u7684,\u8089\u4f53\u7684,\u5b9e\u8d28\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x983

    .line 2612
    const-string v3, "2436. memorial a.\u8bb0\u5fc6\u7684,\u7eaa\u5ff5\u7684 n.\u7eaa\u5ff5\u7269,\u7eaa\u5ff5\u7891,\u7eaa\u5ff5\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0x984

    .line 2613
    const-string v3, "2437. editorial n.\u793e\u8bba  a.\u793e\u8bba\u7684\uff1b\u7f16\u8f91\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x985

    .line 2614
    const-string v3, "2438. trial n.\u8baf\u95ee\uff0c\u5ba1\u8baf\uff1b\u8bd5\u9a8c\uff1b\u8bd5\u7528\uff1b\u5c1d\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x986

    .line 2615
    const-string v3, "2439. industrial a.\u5de5\u4e1a\u7684,\u4ea7\u4e1a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x987

    .line 2616
    const-string v3, "2440. controversial a.\u5f15\u8d77\u4e89\u8bba\u7684,\u6709\u4e89\u8bae\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x988

    .line 2617
    const-string v3, "2441. initial a.\u6700\u521d\u7684,\u5f00\u5934\u7684;\u8bcd\u9996\u7684 n.\u8bcd\u9996\u5927\u5199\u5b57\u6bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x989

    .line 2618
    const-string v3, "2442. substantial a.\u5b9e\u8d28\u7684;\u76f8\u5f53\u7684;\u663e\u8457\u7684;\u575a\u56fa\u7684;\u5bcc\u88d5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x98a

    .line 2619
    const-string v3, "2443. credential n.\u51ed\u8bc1\uff0c(pl.)\u56fd\u4e66\uff0c\u8bc1\u660e\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0x98b

    .line 2620
    const-string v3, "2444. confidential a.\u79d8(\u673a)\u5bc6\u7684\uff1b\u8868\u793a\u4fe1\u4efb\u7684\uff1b\u62c5\u4efb\u673a\u5bc6\u5de5\u4f5c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x98c

    .line 2621
    const-string v3, "2445. essential a.\u672c\u8d28\u7684,\u57fa\u672c\u7684;\u51c0\u5316\u7684 n.\u672c\u8d28;\u8981\u7d20"

    aput-object v3, v0, v2

    const/16 v2, 0x98d

    .line 2622
    const-string v3, "2446. potential a.\u6f5c\u5728\u7684,\u53ef\u80fd\u7684 n.\u6f5c\u80fd,\u6f5c\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x98e

    .line 2623
    const-string v3, "2447. influential a.\u6709\u5f71\u54cd\u7684;\u6709\u6743\u52bf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x98f

    .line 2624
    const-string v3, "2448. partial a.\u90e8\u5206\u7684,\u4e0d\u5b8c\u5168\u7684;\u504f\u8892\u7684,\u4e0d\u516c\u5e73\u7684,\u504f\u7231\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x990

    .line 2625
    const-string v3, "2449. trivial a.\u7410\u788e\u7684;\u65e0\u8db3\u8f7b\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x991

    .line 2626
    const-string v3, "2450. decimal a.\u5341\u8fdb\u7684,\u5c0f\u6570\u7684,\u5341\u8fdb\u5236\u7684 n.\u5c0f\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x992

    .line 2627
    const-string v3, "2451. animal n.\u52a8\u7269\uff0c\u91ce\u517d\uff0c\u7272\u755c a.\u52a8\u7269\u7684\uff0c\u91ce\u517d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x993

    .line 2628
    const-string v3, "2452. mammal n.\u54fa\u4e73\u52a8\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x994

    .line 2629
    const-string v3, "2453. thermal a.\u70ed\u7684,\u70ed\u529b\u7684\uff1b(\u5c0f\u89c4\u6a21\u7684)\u4e0a\u5347\u6c14\u6d41"

    aput-object v3, v0, v2

    const/16 v2, 0x995

    .line 2630
    const-string v3, "2454. formal a.\u6b63\u5f0f\u7684;\u5f62\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x996

    .line 2631
    const-string v3, "2455. normal a.\u6b63\u5e38\u7684,\u666e\u901a\u7684;\u6b63\u89c4\u7684,\u6807\u51c6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x997

    .line 2632
    const-string v3, "2456. abnormal a.\u53cd\u5e38\u7684\uff0c\u4e0d\u6b63\u5e38\u7684\uff0c\u4e0d\u89c4\u5219\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x998

    .line 2633
    const-string v3, "2457. canal n.\u8fd0\u6cb3;(\u6c9f)\u6e20"

    aput-object v3, v0, v2

    const/16 v2, 0x999

    .line 2634
    const-string v3, "2458. signal n.\u4fe1\u53f7,\u6697\u53f7 v.\u53d1\u4fe1\u53f7,\u7528\u4fe1\u53f7\u901a\u77e5"

    aput-object v3, v0, v2

    const/16 v2, 0x99a

    .line 2635
    const-string v3, "2459. cardinal n.(\u5929\u4e3b\u6559\u7684)\u7ea2\u8863\u4e3b\u6559 a.\u9996\u8981\u7684\uff0c\u57fa\u672c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x99b

    .line 2636
    const-string v3, "2460. final a.\u6700\u7ec8\u7684,\u51b3\u5b9a\u6027\u7684 n.\u7ed3\u5c40;\u51b3\u8d5b;\u671f\u672b\u8003\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x99c

    .line 2637
    const-string v3, "2461. original a.\u6700\u521d\u7684,\u539f\u6587\u7684;\u65b0\u9896\u7684 n.\u539f\u7269,\u539f\u4f5c,\u539f\u6587"

    aput-object v3, v0, v2

    const/16 v2, 0x99d

    .line 2638
    const-string v3, "2462. marginal a.\u8bb0\u5728\u9875\u8fb9\u7684,\u65c1\u6ce8\u7684;(\u610f\u8bc6)\u8fb9\u7f18\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x99e

    .line 2639
    const-string v3, "2463. criminal n.\u7f6a\u72af,\u5211\u4e8b\u72af a.\u72af\u7f6a\u7684,\u5211\u4e8b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x99f

    .line 2640
    const-string v3, "2464. nominal a.\u540d\u4e49\u4e0a\u7684;(\u91d1\u989d,\u79df\u91d1)\u5fae\u4e0d\u8db3\u9053\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a0

    .line 2641
    const-string v3, "2465. terminal a.\u665a\u671f\u7684;\u7ec8\u70b9\u7684;\u671f\u672b\u7684 n.\u7ec8\u70b9(\u7ad9);\u7ec8\u7aef"

    aput-object v3, v0, v2

    const/16 v2, 0x9a1

    .line 2642
    const-string v3, "2466. occasional a.\u5076\u7136\u7684,\u975e\u7ecf\u5e38\u7684,\u7279\u6b8a\u573a\u5408\u7684;\u4e34\u65f6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a2

    .line 2643
    const-string v3, "2467. professional a.\u804c\u4e1a\u7684,\u4e13\u95e8\u7684 n.\u81ea\u7531\u804c\u4e1a\u8005,\u4e13\u4e1a\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x9a3

    .line 2644
    const-string v3, "2468. national a.\u6c11\u65cf\u7684,\u56fd\u5bb6\u7684,\u56fd\u7acb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a4

    .line 2645
    const-string v3, "2469. international a.\u56fd\u9645\u7684,\u4e16\u754c(\u6027)\u7684,\u8de8\u56fd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a5

    .line 2646
    const-string v3, "2470. rational a.\u7406\u6027\u7684,\u5408\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a6

    .line 2647
    const-string v3, "2471. operational a.\u64cd\u4f5c\u7684,\u8fd0\u8f6c\u7684,\u8d77\u4f5c\u7528\u7684,\u7ecf\u8425\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a7

    .line 2648
    const-string v3, "2472. additional a.\u989d\u5916\u7684\uff0c\u9644\u52a0\u7684\uff0c\u53e6\u5916\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a8

    .line 2649
    const-string v3, "2473. conventional a.\u60ef\u4f8b\u7684,\u5e38\u89c4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9a9

    .line 2650
    const-string v3, "2474. exceptional a.\u4f8b\u5916\u7684,\u5f02\u5e38\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9aa

    .line 2651
    const-string v3, "2475. optional a.\u53ef\u4ee5\u4efb\u9009\u7684,\u968f\u610f\u7684,\u975e\u5f3a\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ab

    .line 2652
    const-string v3, "2476. personal a.\u4e2a\u4eba\u7684,\u79c1\u4eba\u7684;\u4eb2\u81ea\u7684;\u8eab\u4f53\u7684,\u4eba\u8eab\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ac

    .line 2653
    const-string v3, "2477. eternal n.\u6c38\u4e45\u7684,\u6c38\u6052\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ad

    .line 2654
    const-string v3, "2478. internal a.\u5185\u90e8\u7684,\u5185\u7684;\u56fd\u5185\u7684,\u5185\u653f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ae

    .line 2655
    const-string v3, "2479. external a.\u5916\u90e8\u7684;\u5ba2\u89c2\u7684;\u5916\u56fd\u7684;\u8868\u9762\u7684;[\u533b]\u5916\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9af

    .line 2656
    const-string v3, "2480. journal n.\u5b9a\u671f\u520a\u7269,\u6742\u5fd7,\u65e5\u62a5;\u65e5\u5fd7,\u65e5\u8bb0"

    aput-object v3, v0, v2

    const/16 v2, 0x9b0

    .line 2657
    const-string v3, "2481. coal n.\u7164,\u7164\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0x9b1

    .line 2658
    const-string v3, "2482. goal n.\u76ee\u7684,\u76ee\u6807;\u5b88\u95e8\u5458,\u7403\u95e8;\u8fdb\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0x9b2

    .line 2659
    const-string v3, "2483. municipal a.\u5e02\u7684,\u5e02\u653f\u7684;\u5e02\u7acb\u7684;\u5730\u65b9\u6027\u7684,\u5730\u65b9\u81ea\u6cbb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9b3

    .line 2660
    const-string v3, "2484. principal a.\u6700\u91cd\u8981\u7684,\u4e3b\u8981\u7684n.\u8d1f\u8d23\u4eba,\u6821\u957f;\u8d44\u672c,\u672c\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x9b4

    .line 2661
    const-string v3, "2485. appal v.\u4f7f\u60ca\u9a87\uff0c\u4f7f\u6050\u6016"

    aput-object v3, v0, v2

    const/16 v2, 0x9b5

    .line 2662
    const-string v3, "2486. cathedral n.\u5927\u6559\u5802"

    aput-object v3, v0, v2

    const/16 v2, 0x9b6

    .line 2663
    const-string v3, "2487. liberal a.\u6177\u6168\u7684,\u5927\u65b9\u7684;\u5bcc\u8db3\u7684;\u81ea\u7531\u7684,\u601d\u60f3\u5f00\u653e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9b7

    .line 2664
    const-string v3, "2488. federal a.\u8054\u90a6\u7684;\u8054\u90a6\u5236\u7684;\u8054\u5408\u7684;\u540c\u76df\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9b8

    .line 2665
    const-string v3, "2489. general a.\u4e00\u822c\u7684,\u666e\u901a\u7684;\u603b\u7684,\u5927\u4f53\u7684 n.\u5c06\u519b"

    aput-object v3, v0, v2

    const/16 v2, 0x9b9

    .line 2666
    const-string v3, "2490. mineral n.\u77ff\u7269,\u77ff\u77f3 a.\u77ff\u7269\u7684,\u77ff\u8d28\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ba

    .line 2667
    const-string v3, "2491. funeral n.\u4e27\u846c,\u846c\u793c"

    aput-object v3, v0, v2

    const/16 v2, 0x9bb

    .line 2668
    const-string v3, "2492. lateral n.\u4fa7\u9762\u7684,\u65c1\u8fb9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9bc

    .line 2669
    const-string v3, "2493. several a.\u51e0\u4e2a\uff0c\u82e5\u5e72\uff0c\u6570\u4e2a\uff1b\u5404\u4e2a\u7684\uff0c\u5404\u81ea\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9bd

    .line 2670
    const-string v3, "2494. integral a.\u6784\u6210\u6574\u4f53\u6240\u5fc5\u9700\u7684;\u5b8c\u6574\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9be

    .line 2671
    const-string v3, "2495. spiral a.\u87ba\u65cb\u5f62\u7684 n.\u87ba\u65cb\uff0c\u87ba\u7ebf v.\u87ba\u65cb\u4e0a\u5347\uff1b\u76d8\u65cb"

    aput-object v3, v0, v2

    const/16 v2, 0x9bf

    .line 2672
    const-string v3, "2496. oral a.\u53e3\u5934\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c0

    .line 2673
    const-string v3, "2497. moral a.\u9053\u5fb7(\u4e0a)\u7684,\u7cbe\u795e\u4e0a\u7684 n.\u5bd3\u610f,\u6559\u80b2\u610f\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0x9c1

    .line 2674
    const-string v3, "2498. central a.\u4e2d\u5fc3\u7684,\u4e2d\u592e\u7684,\u4e2d\u67a2\u7684;\u4e3b\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c2

    .line 2675
    const-string v3, "2499. neutral a.\u4e2d\u7acb\u7684;\u4e2d\u6027\u7684,\u4e2d\u548c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c3

    .line 2676
    const-string v3, "2500. aural a.\u542c\u89c9\u7684\uff0c\u542c\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c4

    .line 2677
    const-string v3, "2501. plural a.\u590d\u6570\u7684 n.\u590d\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x9c5

    .line 2678
    const-string v3, "2502. rural a.\u4e61\u4e0b\u7684,\u7530\u56ed\u7684,\u4e61\u6751\u98ce\u5473\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c6

    .line 2679
    const-string v3, "2503. natural a.\u6b63\u5e38\u7684;\u81ea\u7136\u754c\u7684,\u5929\u7136\u7684,\u5929\u8d4b\u7684,\u56fa\u6709\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9c7

    .line 2680
    const-string v3, "2504. appraisal n.\u5bf9...\u4f5c\u51fa\u7684\u8bc4\u4ef7\uff1b\u8bc4\u4ef7\uff0c\u9274\u5b9a\uff0c\u8bc4\u4f30"

    aput-object v3, v0, v2

    const/16 v2, 0x9c8

    .line 2681
    const-string v3, "2505. proposal n.\u63d0\u8bae,\u5efa\u8bae;\u6c42\u5a5a"

    aput-object v3, v0, v2

    const/16 v2, 0x9c9

    .line 2682
    const-string v3, "2506. disposal n.\u5904\u7406,\u5904\u7f6e;\u5e03\u7f6e,\u5b89\u6392"

    aput-object v3, v0, v2

    const/16 v2, 0x9ca

    .line 2683
    const-string v3, "2507. rehearsal n.\u6392\u7ec3,\u6392\u6f14,\u6f14\u4e60,\u9884\u6f14,\u8bd5\u6f14"

    aput-object v3, v0, v2

    const/16 v2, 0x9cb

    .line 2684
    const-string v3, "2508. universal a.\u666e\u904d\u7684,\u5168\u4f53\u7684,\u901a\u7528\u7684;\u5b87\u5b99\u7684,\u4e16\u754c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9cc

    .line 2685
    const-string v3, "2509. refusal n.\u62d2\u7edd,\u56de\u7edd"

    aput-object v3, v0, v2

    const/16 v2, 0x9cd

    .line 2686
    const-string v3, "2510. fatal a.\u81f4\u547d\u7684,\u6bc1\u706d\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ce

    .line 2687
    const-string v3, "2511. metal n.\u91d1\u5c5e,\u91d1\u5c5e\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x9cf

    .line 2688
    const-string v3, "2512. digital a.\u6570\u5b57\u7684;\u6570\u4f4d\u7684;\u624b\u6307\u7684 n.\u6570\u5b57"

    aput-object v3, v0, v2

    const/16 v2, 0x9d0

    .line 2689
    const-string v3, "2513. capital n.\u9996\u90fd;\u5927\u5199\u5b57\u6bcd;\u8d44\u672c a.\u4e3b\u8981\u7684,\u5927\u5199\u5b57\u6bcd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9d1

    .line 2690
    const-string v3, "2514. hospital n.\u533b\u9662"

    aput-object v3, v0, v2

    const/16 v2, 0x9d2

    .line 2691
    const-string v3, "2515. marital a.\u5a5a\u59fb\u7684,\u592b\u59bb\u4e4b\u95f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9d3

    .line 2692
    const-string v3, "2516. vital a.\u751f\u6b7b\u6538\u5173\u7684,\u91cd\u5927\u7684;\u751f\u547d\u7684,\u751f\u673a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9d4

    .line 2693
    const-string v3, "2517. dental a.\u7259\u9f7f\u7684\uff1b\u7259\u79d1(\u7528)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9d5

    .line 2694
    const-string v3, "2518. accidental a.\u5076\u7136\u7684\uff1b\u610f\u5916\u7684\uff1b\u65e0\u610f\u4e2d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9d6

    .line 2695
    const-string v3, "2519. "

    aput-object v3, v0, v2

    const/16 v2, 0x9d7

    .line 2696
    const-string v3, "2520. "

    aput-object v3, v0, v2

    const/16 v2, 0x9d8

    .line 2697
    const-string v3, "2521. oriental a.\u4e1c\u65b9\u7684,\u4e1c\u65b9\u8bf8\u56fd\u7684 n.\u4e1c\u65b9\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x9d9

    .line 2698
    const-string v3, "2522. mental a.\u7cbe\u795e\u7684,\u601d\u60f3\u7684,\u5fc3\u7406\u7684,\u667a\u529b\u7684,\u8111\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9da

    .line 2699
    const-string v3, "2523. fundamental a.\u57fa\u7840\u7684,\u57fa\u672c\u7684 n.(pl.)\u57fa\u672c\u539f\u5219,\u57fa\u672c\u539f\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x9db

    .line 2700
    const-string v3, "2524. experimental a.\u5b9e\u9a8c(\u6027)\u7684,\u8bd5\u9a8c(\u6027)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9dc

    .line 2701
    const-string v3, "2525. instrumental a.\u4eea\u5668\u7684;\u5668\u68b0\u7684;\u4e50\u5668\u7684;\u8d77\u4f5c\u7528\u7684;\u6709\u5e2e\u52a9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9dd

    .line 2702
    const-string v3, "2526. horizontal a.\u5730\u5e73\u7ebf\u7684;\u6c34\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9de

    .line 2703
    const-string v3, "2527. total n.\u603b\u6570,\u5408\u8ba1 a.\u603b\u7684,\u5168\u90e8\u7684 v.\u5408\u8ba1,\u603b\u6570\u8fbe"

    aput-object v3, v0, v2

    const/16 v2, 0x9df

    .line 2704
    const-string v3, "2528. mortal a.\u81f4\u547d\u7684;\u7ec8\u6709\u4e00\u6b7b\u7684;\u4eba\u4e16\u95f4\u7684 n.\u51e1\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x9e0

    .line 2705
    const-string v3, "2529. crystal n.\u6c34\u6676,\u6c34\u6676\u9970\u54c1;\u7ed3\u6676 a.\u6c34\u6676\u7684,\u900f\u660e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9e1

    .line 2706
    const-string v3, "2530. brutal a.\u6b8b\u5fcd\u7684;\u4e25\u5cfb\u7684;\u4e25\u9177\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9e2

    .line 2707
    const-string v3, "2531. gradual a.\u9010\u6e10\u7684,\u9010\u6b65\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9e3

    .line 2708
    const-string v3, "2532. individual a.\u4e2a\u4eba\u7684,\u5355\u72ec\u7684;\u72ec\u7279\u7684 n.\u4e2a\u4eba,\u4e2a\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x9e4

    .line 2709
    const-string v3, "2533. manual a.\u624b\u7684,\u624b\u5de5\u505a\u7684,\u4f53\u529b\u7684 n.\u624b\u518c,\u6307\u5357"

    aput-object v3, v0, v2

    const/16 v2, 0x9e5

    .line 2710
    const-string v3, "2534. continual a.\u4e0d\u65ad\u7684,\u8fde\u7eed\u7684,\u9891\u7e41\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9e6

    .line 2711
    const-string v3, "2535. annual a.\u6bcf\u5e74\u7684\uff0c\u4e00\u5e74\u751f\u7684 n.\u5e74\u520a\uff1b\u4e00\u5e74\u751f\u690d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x9e7

    .line 2712
    const-string v3, "2536. equal a.\u76f8\u7b49\u7684;\u80dc\u4efb\u7684n.\u76f8\u7b49\u7684\u4e8b\u52a1;\u5bf9\u624bv.\u7b49\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x9e8

    .line 2713
    const-string v3, "2537. casual a.\u5076\u7136\u7684,\u78b0\u5de7\u7684;\u4e34\u65f6\u7684,\u975e\u6b63\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9e9

    .line 2714
    const-string v3, "2538. visual a.\u770b\u7684,\u770b\u5f97\u89c1\u7684;\u89c6\u89c9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ea

    .line 2715
    const-string v3, "2539. usual a.\u901a\u5e38\u7684,\u5e73\u5e38\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9eb

    .line 2716
    const-string v3, "2540. unusual a.\u4e0d\u5e73\u5e38\u7684,\u4e0e\u4f17\u4e0d\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ec

    .line 2717
    const-string v3, "2541. actual a.\u5b9e\u9645\u7684\uff1b\u73b0\u5b9e\u7684\uff0c\u771f\u5b9e\u7684\uff0c\u76ee\u524d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ed

    .line 2718
    const-string v3, "2542. intellectual n.\u77e5\u8bc6\u5206\u5b50 a.\u667a\u529b\u7684\uff0c\u7406\u667a\u7684\uff0c\u6709\u7406\u89e3\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ee

    .line 2719
    const-string v3, "2543. punctual a.\u4e25\u5b88\u65f6\u523b\u7684,\u51c6\u65f6\u7684,\u6b63\u70b9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ef

    .line 2720
    const-string v3, "2544. perpetual a.\u6c38\u4e45\u7684,\u6c38\u6052\u7684,\u957f\u671f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f0

    .line 2721
    const-string v3, "2545. ritual a.\u5b97\u6559\u4eea\u5f0f\u7684,\u5178\u793c\u7684 n.(\u5b97\u6559)\u4eea\u5f0f,\u5178\u793c"

    aput-object v3, v0, v2

    const/16 v2, 0x9f1

    .line 2722
    const-string v3, "2546. spiritual a.\u7cbe\u795e(\u4e0a)\u7684,\u5fc3\u7075\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f2

    .line 2723
    const-string v3, "2547. virtual a.\u5b9e\u9645\u4e0a\u7684,\u4e8b\u5b9e\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f3

    .line 2724
    const-string v3, "2548. mutual a.\u76f8\u4e92\u7684\uff0c\u5f7c\u6b64\u7684\uff1b\u5171\u540c\u7684\uff0c\u5171\u6709\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f4

    .line 2725
    const-string v3, "2549. naval n.\u6d77\u519b\u7684,\u519b\u8230\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f5

    .line 2726
    const-string v3, "2550. medieval a.\u4e2d\u4e16\u7eaa\u7684,\u4e2d\u53e4(\u65f6\u4ee3)\u7684,\u8001\u5f0f\u7684,\u539f\u59cb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f6

    .line 2727
    const-string v3, "2551. rival n.\u7ade\u4e89\u8005,\u5bf9\u624b v.\u7ade\u4e89,\u5bf9\u6297 a.\u7ade\u4e89\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f7

    .line 2728
    const-string v3, "2552. arrival n.\u5230\u8fbe\uff0c\u5230\u6765\uff1b\u5230\u8fbe\u8005\uff0c\u5230\u8fbe\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x9f8

    .line 2729
    const-string v3, "2553. festival n.\u8282\u65e5;\u97f3\u4e50\u8282;\u620f\u5267\u8282 a.\u8282\u65e5\u7684;\u5feb\u4e50\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9f9

    .line 2730
    const-string v3, "2554. survival n.\u5e78\u5b58,\u751f\u5b58;\u5e78\u5b58\u8005,\u6b8b\u5b58\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x9fa

    .line 2731
    const-string v3, "2555. oval a.\u5375\u5f62\u7684\uff0c\u692d\u5706\u5f62\u7684 n.\u5375\u5f62\uff0c\u692d\u5706\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0x9fb

    .line 2732
    const-string v3, "2556. removal n.\u79fb\u52a8,\u8fc1\u5c45;\u9664\u53bb"

    aput-object v3, v0, v2

    const/16 v2, 0x9fc

    .line 2733
    const-string v3, "2557. approval n.\u6279\u51c6\uff0c\u901a\u8fc7\uff1b\u8d5e\u6210\uff0c\u540c\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x9fd

    .line 2734
    const-string v3, "2558. interval n.\u95f4\u9694,\u95f4\u6b47;(\u5e55\u95f4\u6216\u5de5\u95f4)\u4f11\u606f"

    aput-object v3, v0, v2

    const/16 v2, 0x9fe

    .line 2735
    const-string v3, "2559. loyal a.(to)\u5fe0\u8bda\u7684,\u5fe0\u8d1e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x9ff

    .line 2736
    const-string v3, "2560. royal a.\u738b\u5ba4\u7684,\u7687\u5bb6\u7684;\u7b2c\u4e00\u6d41\u7684,\u9ad8\u8d35\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa00

    .line 2737
    const-string v3, "2561. label n.\u6807\u7b7e v.\u628a...\u79f0\u4e3a\uff1b\u7528\u6807\u7b7e\u4e8e\uff1b\u7528\u6807\u7b7e\u6807\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xa01

    .line 2738
    const-string v3, "2562. rebel v.\u53cd\u6297,\u53cd\u53db,\u8d77\u4e49 n.\u53db\u9006\u8005,\u8d77\u4e49\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xa02

    .line 2739
    const-string v3, "2563. cancel v.\u53d6\u6d88,\u628a\u2026\u4f5c\u5e9f;\u5220\u53bb,\u5212\u6389"

    aput-object v3, v0, v2

    const/16 v2, 0xa03

    .line 2740
    const-string v3, "2564. parcel n.\u5305\u88f9,\u90ae\u5305,\u90e8\u5206 v.\u6253\u5305,\u6346\u624e,\u5206\u914d"

    aput-object v3, v0, v2

    const/16 v2, 0xa04

    .line 2741
    const-string v3, "2565. excel vi.\u80dc\u8fc7\u5176\u4ed6;\u64c5\u957f vt.\u80dc\u8fc7\uff0c\u4f18\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xa05

    .line 2742
    const-string v3, "2566. model n.\u6837\u5f0f,\u578b;\u6a21\u8303;\u6a21\u578b,\u539f\u578b;\u6a21\u7279 v.\u6a21\u4eff"

    aput-object v3, v0, v2

    const/16 v2, 0xa06

    .line 2743
    const-string v3, "2567. feel v.\u89e6\uff1b\u8ba4\u4e3a vi.\u6478\u4e0a\u53bb\u6709\u2026\u611f\u89c9\uff1b\u6478\u7d22\uff1b\u89c9\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0xa07

    .line 2744
    const-string v3, "2568. heel n.\u811a\u540e\u8ddf,\u8e35,\u978b\u8ddf"

    aput-object v3, v0, v2

    const/16 v2, 0xa08

    .line 2745
    const-string v3, "2569. wheel n.\u8f6e,\u8f66\u8f6e"

    aput-object v3, v0, v2

    const/16 v2, 0xa09

    .line 2746
    const-string v3, "2570. kneel v.\u8dea,\u4e0b\u8dea"

    aput-object v3, v0, v2

    const/16 v2, 0xa0a

    .line 2747
    const-string v3, "2571. peel v.\u524a\u76ae,\u5265\u76ae n.\u679c\u76ae"

    aput-object v3, v0, v2

    const/16 v2, 0xa0b

    .line 2748
    const-string v3, "2572. reel n.\u5377\u7b52,\u7ebf\u8f74 v.\u5377,\u7ed5"

    aput-object v3, v0, v2

    const/16 v2, 0xa0c

    .line 2749
    const-string v3, "2573. steel n.\u94a2"

    aput-object v3, v0, v2

    const/16 v2, 0xa0d

    .line 2750
    const-string v3, "2574. angel n.\u5929\u4f7f\uff0c\u5b89\u742a\u513f"

    aput-object v3, v0, v2

    const/16 v2, 0xa0e

    .line 2751
    const-string v3, "2575. nickel n.\u954d;\u954d\u5e01;\u4e94\u7f8e\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0xa0f

    .line 2752
    const-string v3, "2576. parallel a.\u5e73\u884c\u7684,\u76f8\u540c\u7684,\u7c7b\u4f3c\u7684n.\u5e73\u884c\u7ebf,\u7c7b\u4f3c,\u5bf9\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0xa10

    .line 2753
    const-string v3, "2577. camel n.\u9a86\u9a7c"

    aput-object v3, v0, v2

    const/16 v2, 0xa11

    .line 2754
    const-string v3, "2578. panel n.\u9762,\u677f;\u63a7\u5236\u677f,\u4eea\u8868\u76d8;\u4e13\u95e8\u5c0f\u7ec4"

    aput-object v3, v0, v2

    const/16 v2, 0xa12

    .line 2755
    const-string v3, "2579. channel n.\u6d77\u5ce1,\u6c34\u9053;\u4fe1\u9053,\u6ce2\u9053;\u8def\u7ebf,\u9014\u5f84"

    aput-object v3, v0, v2

    const/16 v2, 0xa13

    .line 2756
    const-string v3, "2580. personnel n.\u5168\u4f53\u4eba\u5458,\u5168\u4f53\u804c\u5458;\u4eba\u4e8b(\u90e8\u95e8)"

    aput-object v3, v0, v2

    const/16 v2, 0xa14

    .line 2757
    const-string v3, "2581. tunnel n.\u96a7\u9053,\u5c71\u6d1e"

    aput-object v3, v0, v2

    const/16 v2, 0xa15

    .line 2758
    const-string v3, "2582. colonel n.(\u9646\u519b)\u4e0a\u6821"

    aput-object v3, v0, v2

    const/16 v2, 0xa16

    .line 2759
    const-string v3, "2583. repel v.\u51fb\u9000,\u62b5\u5236,\u4f7f\u538c\u6076,\u4f7f\u4e0d\u6109\u5feb"

    aput-object v3, v0, v2

    const/16 v2, 0xa17

    .line 2760
    const-string v3, "2584. compel v.\u5f3a\u8feb,\u8feb\u4f7f"

    aput-object v3, v0, v2

    const/16 v2, 0xa18

    .line 2761
    const-string v3, "2585. propel vt.\u63a8\u8fdb\uff0c\u63a8\u52a8\uff1b\u6fc0\u52b1\uff0c\u9a71\u4f7f"

    aput-object v3, v0, v2

    const/16 v2, 0xa19

    .line 2762
    const-string v3, "2586. expel v.\u628a\u2026\u5f00\u9664;\u9a71\u9010;\u6392\u51fa;\u53d1\u5c04"

    aput-object v3, v0, v2

    const/16 v2, 0xa1a

    .line 2763
    const-string v3, "2587. barrel n.\u6876;\u67aa\u7ba1,\u70ae\u7ba1"

    aput-object v3, v0, v2

    const/16 v2, 0xa1b

    .line 2764
    const-string v3, "2588. quarrel v.\u4e89\u5435,\u4e89\u8bba n.\u4e89\u5435,\u4e89\u5435\u7684\u539f\u56e0"

    aput-object v3, v0, v2

    const/16 v2, 0xa1c

    .line 2765
    const-string v3, "2589. squirrel n.\u677e\u9f20"

    aput-object v3, v0, v2

    const/16 v2, 0xa1d

    .line 2766
    const-string v3, "2590. counsel v./n.\u529d\u544a,\u5fe0\u544a n.\u6cd5\u5f8b\u987e\u95ee,\u8fa9\u62a4\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xa1e

    .line 2767
    const-string v3, "2591. vessel n.\u5bb9\u5668,\u5668\u76bf;\u8239,\u8230;\u7ba1,\u8840\u7ba1"

    aput-object v3, v0, v2

    const/16 v2, 0xa1f

    .line 2768
    const-string v3, "2592. hotel n.\u65c5\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0xa20

    .line 2769
    const-string v3, "2593. motel n.(\u9644\u6709\u505c\u8f66\u573a\u7684)\u6c7d\u8f66\u65c5\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0xa21

    .line 2770
    const-string v3, "2594. fuel n.\u71c3\u6599 vt.\u7ed9\u2026\u52a0\u71c3\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xa22

    .line 2771
    const-string v3, "2595. cruel a.\u6b8b\u5fcd\u7684,\u6b8b\u9177\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa23

    .line 2772
    const-string v3, "2596. travel n.\u65c5\u884c v.\u65c5\u884c;\u884c\u8fdb,\u4f20\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0xa24

    .line 2773
    const-string v3, "2597. level n.\u6c34\u5e73\uff0c\u6c34\u51c6\uff0c\u7b49\u7ea7 v.\u5f04\u5e73\uff0c\u94fa\u5e73 a.\u6c34\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa25

    .line 2774
    const-string v3, "2598. novel n.(\u957f\u7bc7)\u5c0f\u8bf4 a.\u65b0\u5947\u7684,\u65b0\u9896\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa26

    .line 2775
    const-string v3, "2599. jewel n.\u5b9d\u77f3,\u5b9d\u77f3\u9970\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xa27

    .line 2776
    const-string v3, "2600. bowel n.\u80a0\uff1b\uff3bpl.\uff3d\u5185\u90e8\uff0c\u6df1\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0xa28

    .line 2777
    const-string v3, "2601. towel n.\u6bdb\u5dfe vt.\u7528\u6bdb\u5dfe\u64e6\u6216\u64e6\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0xa29

    .line 2778
    const-string v3, "2602. vowel n.\u5143\u97f3,\u5143\u97f3\u5b57\u6bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xa2a

    .line 2779
    const-string v3, "2603. fail v.\u5931\u8d25,\u4e0d\u53ca\u683c;\u8870\u9000,\u51cf\u5f31"

    aput-object v3, v0, v2

    const/16 v2, 0xa2b

    .line 2780
    const-string v3, "2604. hail v.\u4e0b\u96f9;\u6b22\u547c,\u6b22\u8fce n.\u96f9"

    aput-object v3, v0, v2

    const/16 v2, 0xa2c

    .line 2781
    const-string v3, "2605. mail n.\u90ae\u4ef6 v.\u90ae\u5bc4"

    aput-object v3, v0, v2

    const/16 v2, 0xa2d

    .line 2782
    const-string v3, "2606. e-mail n.(electronic mail)\u7535\u5b50\u4fe1\u51fd\uff0c\u7535\u5b50\u90ae\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0xa2e

    .line 2783
    const-string v3, "2607. blackmail n.\u8bb9\u8bc8\uff0c\u6572\u8bc8\uff0c\u52d2\u7d22\uff1b\u80c1\u8feb\uff0c\u606b\u5413"

    aput-object v3, v0, v2

    const/16 v2, 0xa2f

    .line 2784
    const-string v3, "2608. nail n.\u6307\u7532,\u722a;\u9489 v.\u5c06\u2026\u9489\u7262,\u9489\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0xa30

    .line 2785
    const-string v3, "2609. pail n.\u6876, \u63d0\u6876; \u4e00\u6876\u7684\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xa31

    .line 2786
    const-string v3, "2610. rail n.\u680f\u6746,\u56f4\u680f;(pl.)\u94c1\u8def;\u94c1\u8f68;\u6a2a\u6746,\u680f\u6746"

    aput-object v3, v0, v2

    const/16 v2, 0xa32

    .line 2787
    const-string v3, "2611. trail n.\u8e2a\u8ff9,\u75d5\u8ff9;\u5c0f\u8def v.\u8ffd\u8e2a,\u8ddf\u8e2a;\u62d6,\u62d6\u66f3;"

    aput-object v3, v0, v2

    const/16 v2, 0xa33

    .line 2788
    const-string v3, "2612. sail n.\u5e06,\u822a\u884c v.\u822a\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xa34

    .line 2789
    const-string v3, "2613. tail n.\u5c3e\u5df4\uff1b\u5c3e\u90e8\uff1b\u8ddf\u8e2a\u8005 vt.\u5c3e\u968f\uff0c\u8ddf\u8e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xa35

    .line 2790
    const-string v3, "2614. detail n.\u7ec6\u8282,\u8be6\u60c5 v.\u8be6\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0xa36

    .line 2791
    const-string v3, "2615. retail n.\u96f6\u552e"

    aput-object v3, v0, v2

    const/16 v2, 0xa37

    .line 2792
    const-string v3, "2616. entail vt.\u4f7f\u627f\u62c5;\u9700\u8981;\u628a(\u75be\u75c5\u7b49)\u9057\u4f20\u7ed9;\u9650\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xa38

    .line 2793
    const-string v3, "2617. avail n.[\u4e00\u822c\u7528\u4e8e\u5426\u5b9a\u53e5\u6216\u7591\u95ee\u53e5\u4e2d]\u6548\u7528,\u5229\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0xa39

    .line 2794
    const-string v3, "2618. prevail v.(over,against)\u53d6\u80dc,\u5360\u4f18\u52bf;\u6d41\u884c,\u76db\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xa3a

    .line 2795
    const-string v3, "2619. pencil n.\u94c5\u7b14 vt.\u7528\u94c5\u7b14\u5199"

    aput-object v3, v0, v2

    const/16 v2, 0xa3b

    .line 2796
    const-string v3, "2620. council n.\u7406\u4e8b\u4f1a,\u59d4\u5458\u4f1a,\u8bae\u4e8b\u673a\u6784"

    aput-object v3, v0, v2

    const/16 v2, 0xa3c

    .line 2797
    const-string v3, "2621. veil n.\u9762\u7eb1,\u906e\u853d\u7269 v.\u7528\u9762\u7eb1\u63a9\u76d6,\u63a9\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0xa3d

    .line 2798
    const-string v3, "2622. oil n.\u6cb9\uff0c\u77f3\u6cb9 v.\u7ed9\u2026\u52a0\u6da6\u6ed1\u6cb9\uff1b\u6d82\u6cb9\uff0c\u4e0a\u6cb9"

    aput-object v3, v0, v2

    const/16 v2, 0xa3e

    .line 2799
    const-string v3, "2623. boil v.(\u4f7f)\u6cb8\u817e,\u716e(\u6cb8)"

    aput-object v3, v0, v2

    const/16 v2, 0xa3f

    .line 2800
    const-string v3, "2624. coil v.\u5377,\u76d8\u7ed5 n.(\u4e00)\u5377,(\u4e00)\u5708;\u7ebf\u5708,\u7ed5\u7ec4"

    aput-object v3, v0, v2

    const/16 v2, 0xa40

    .line 2801
    const-string v3, "2625. spoil v.\u635f\u574f,\u641e\u9519;\u5ba0\u574f,\u6eba\u7231"

    aput-object v3, v0, v2

    const/16 v2, 0xa41

    .line 2802
    const-string v3, "2626. soil n.\u6ce5\u571f,\u571f\u5730,\u571f\u58e4 v.\u5f04\u810f,(\u4f7f)\u53d8\u810f"

    aput-object v3, v0, v2

    const/16 v2, 0xa42

    .line 2803
    const-string v3, "2627. pupil n.\u5b66\u751f,\u5c0f\u5b66\u751f;\u77b3\u5b54"

    aput-object v3, v0, v2

    const/16 v2, 0xa43

    .line 2804
    const-string v3, "2628. April (\u540d)\u56db\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0xa44

    .line 2805
    const-string v3, "2629. fossil n.\u5316\u77f3"

    aput-object v3, v0, v2

    const/16 v2, 0xa45

    .line 2806
    const-string v3, "2630. until conj.&prep.\u76f4\u5230\u2026\u4e3a\u6b62\uff0c\u5728\u2026\u4ee5\u524d\uff1b\u76f4\u5230\u2026"

    aput-object v3, v0, v2

    const/16 v2, 0xa46

    .line 2807
    const-string v3, "2631. evil a.\u90aa\u6076\u7684,\u7f6a\u6076\u7684 n.\u90aa\u6076,\u7f6a\u6076"

    aput-object v3, v0, v2

    const/16 v2, 0xa47

    .line 2808
    const-string v3, "2632. devil n.\u9b54\u9b3c"

    aput-object v3, v0, v2

    const/16 v2, 0xa48

    .line 2809
    const-string v3, "2633. civil a.\u516c\u6c11\u7684,\u5e02\u6c11\u7684;\u6c11\u95f4\u7684;\u6c11\u7528\u7684;\u6709\u793c\u8c8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa49

    .line 2810
    const-string v3, "2634. all a.\u5168\u90e8\u7684\uff1b\u975e\u5e38\u7684 ad.\u5b8c\u5168\u5730\uff0c\u5f88 pron.\u5168\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0xa4a

    .line 2811
    const-string v3, "2635. ball n.\u7403(\u72b6\u7269);(\u6b63\u5f0f\u7684)\u821e\u4f1avt.\u628a\u2026\u634f\u6210\u7403\u72b6"

    aput-object v3, v0, v2

    const/16 v2, 0xa4b

    .line 2812
    const-string v3, "2636. baseball n.\u68d2\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xa4c

    .line 2813
    const-string v3, "2637. basketball n.\u7bee\u7403\uff0c\u7bee\u7403\u8fd0\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xa4d

    .line 2814
    const-string v3, "2638. football n.\u8db3\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xa4e

    .line 2815
    const-string v3, "2639. volleyball n.\u6392\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xa4f

    .line 2816
    const-string v3, "2640. call vt.\u53eb\uff0c\u558a\uff1b\u6253\u7535\u8bdd vi.\u53eb\uff1b\u8bbf\u95ee n.\u53eb\uff1b\u53f7\u53ec"

    aput-object v3, v0, v2

    const/16 v2, 0xa50

    .line 2817
    const-string v3, "2641. recall v.\u56de\u5fc6,\u56de\u60f3;\u64a4\u6d88,\u6536\u56de"

    aput-object v3, v0, v2

    const/16 v2, 0xa51

    .line 2818
    const-string v3, "2642. fall v.\u8dcc\u5012;\u4e0b\u964d;\u51cf\u5f31;\u5760\u843d;\u53d8\u6210,\u9677\u4e8e n.\u79cb\u5b63"

    aput-object v3, v0, v2

    const/16 v2, 0xa52

    .line 2819
    const-string v3, "2643. waterfall n.\u7011\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0xa53

    .line 2820
    const-string v3, "2644. hall n.\u793c\u5802,\u4f1a\u5802,\u529e\u516c\u5927\u697c,\u95e8\u5385"

    aput-object v3, v0, v2

    const/16 v2, 0xa54

    .line 2821
    const-string v3, "2645. shall aux.v.(\u6211\uff0c\u6211\u4eec)\u5c06\u8981\uff0c\u4f1a\uff1b\u5fc5\u987b\uff0c\u5e94\u8be5"

    aput-object v3, v0, v2

    const/16 v2, 0xa55

    .line 2822
    const-string v3, "2646. small a.\u5c0f\u7684\uff1b\u5e74\u5e7c\u7684\uff1b\u4e0d\u91cd\u8981\u7684\uff1b\u5c0f\u89c4\u6a21(\u7ecf\u8425)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa56

    .line 2823
    const-string v3, "2647. overall a.\u5168\u9762\u7684,\u7efc\u5408\u7684 n.(pl.)(\u5957\u5934)\u5de5\u4f5c\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0xa57

    .line 2824
    const-string v3, "2648. tall a.(\u8eab\u6750)\u9ad8\u7684,\u9ad8\u5927\u7684\uff1b\u5938\u5927\u7684,\u79bb\u8c31\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa58

    .line 2825
    const-string v3, "2649. stall n.\u8d27\u644a;\u755c\u680f,\u53a9 v.(\u4f7f)\u505c\u8f6c,(\u4f7f)\u505c\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0xa59

    .line 2826
    const-string v3, "2650. install vt.(instal)\u5b89\u88c5,\u8bbe\u7f6e,\u5b89\u7f6e\uff1b\u4f7f\u5c31\u804c,\u4efb\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0xa5a

    .line 2827
    const-string v3, "2651. wall n.\u5899\uff0c\u58c1\uff0c\u56f4\u5899vt.\u7b51\u5899\u56f4\u4f4f\uff0c\u7528\u5899\u9694\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0xa5b

    .line 2828
    const-string v3, "2652. bell n.\u949f,\u94c3"

    aput-object v3, v0, v2

    const/16 v2, 0xa5c

    .line 2829
    const-string v3, "2653. cell n.\u7ec6\u80de;\u5c0f\u623f\u95f4;\u8702\u623f;\u7535\u6c60"

    aput-object v3, v0, v2

    const/16 v2, 0xa5d

    .line 2830
    const-string v3, "2654. fell v.\u51fb\u5012;\u6253\u5012(\u75be\u75c5\u7b49);\u780d\u4f10a.\u51f6\u731b\u7684;\u53ef\u6015\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa5e

    .line 2831
    const-string v3, "2655. hell n.\u5730\u72f1,\u9634\u95f4;\u82e6\u5883,\u6781\u5927\u75db\u82e6"

    aput-object v3, v0, v2

    const/16 v2, 0xa5f

    .line 2832
    const-string v3, "2656. shell n.\u58f3,\u8d1d\u58f3;\u70ae\u5f39"

    aput-object v3, v0, v2

    const/16 v2, 0xa60

    .line 2833
    const-string v3, "2657. smell n.\u6c14\u5473;\u55c5\u89c9 v.\u55c5,\u95fb\u5230;\u6563\u53d1(\u2026\u7684)\u6c14\u5473"

    aput-object v3, v0, v2

    const/16 v2, 0xa61

    .line 2834
    const-string v3, "2658. spell v.\u62fc\u5199"

    aput-object v3, v0, v2

    const/16 v2, 0xa62

    .line 2835
    const-string v3, "2659. sell v.\u5356,\u51fa\u552e"

    aput-object v3, v0, v2

    const/16 v2, 0xa63

    .line 2836
    const-string v3, "2660. tell vt.\u544a\u8bc9\uff0c\u8bb2\u8ff0\uff1b\u544a\u8beb\uff1b\u5429\u5490\uff0c\u547d\u4ee4\uff1b\u8fa8/\u533a\u522b"

    aput-object v3, v0, v2

    const/16 v2, 0xa64

    .line 2837
    const-string v3, "2661. well ad.\u597d\uff0c\u4ee4\u4eba\u6ee1\u610f\u5730\uff1b\u5f88 int.\u54ce\u5440\uff0c\u597d\u5566\uff0c\u55ef"

    aput-object v3, v0, v2

    const/16 v2, 0xa65

    .line 2838
    const-string v3, "2662. dwell v.\u4f4f,\u5c45\u7559"

    aput-object v3, v0, v2

    const/16 v2, 0xa66

    .line 2839
    const-string v3, "2663. farewell int.\u518d\u4f1a,\u522b\u4e86 n.\u544a\u522b"

    aput-object v3, v0, v2

    const/16 v2, 0xa67

    .line 2840
    const-string v3, "2664. swell n./v.\u80bf\u80c0;\u81a8\u80c0;\u589e\u5927;\u589e\u52a0;"

    aput-object v3, v0, v2

    const/16 v2, 0xa68

    .line 2841
    const-string v3, "2665. yell vi.\u5927\u53eb;\u547c\u558a vt.\u53eb\u7740\u8bf4 n.\u53eb\u58f0;\u558a\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xa69

    .line 2842
    const-string v3, "2666. ill a.\u6709\u75c5\u7684\uff1b\u574f\u7684\uff1b\u6076\u610f\u7684 ad.\u574f\u5730\uff1b\u4e0d\u5229\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xa6a

    .line 2843
    const-string v3, "2667. bill n.\u8d26\u5355;\u62db\u8d34,\u5e7f\u544a;(\u4eba\u5458,\u804c\u79f0\u7b49\u7684)\u8868;\u949e\u7968"

    aput-object v3, v0, v2

    const/16 v2, 0xa6b

    .line 2844
    const-string v3, "2668. fill v.(with)\u586b\u6ee1,\u5145\u6ee1"

    aput-object v3, v0, v2

    const/16 v2, 0xa6c

    .line 2845
    const-string v3, "2669. fulfill v.(fulfil)\u5b8c\u6210,\u5c65\u884c,\u5b9e\u8df5,\u6ee1\u8db3"

    aput-object v3, v0, v2

    const/16 v2, 0xa6d

    .line 2846
    const-string v3, "2670. hill n.\u5c0f\u5c71\uff0c\u5c71\u5c97\uff0c\u9ad8\u5730\uff1b[pl.]\u4e18\u9675(\u5730\u5e26)"

    aput-object v3, v0, v2

    const/16 v2, 0xa6e

    .line 2847
    const-string v3, "2671. chill n.\u5bd2\u51b7,\u5bd2\u6c14,\u5bd2\u6218 v.\u4f7f\u5bd2\u51b7"

    aput-object v3, v0, v2

    const/16 v2, 0xa6f

    .line 2848
    const-string v3, "2672. kill vt.\u6740\u6b7b\uff0c\u6d88\u706d\uff1b\u7834\u574f\uff0c\u6bc1\u706d\uff1b\u6d88\u78e8(\u65f6\u95f4)"

    aput-object v3, v0, v2

    const/16 v2, 0xa70

    .line 2849
    const-string v3, "2673. skill n.\u6280\u80fd,\u6280\u5de7,\u624b\u827a;\u719f\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0xa71

    .line 2850
    const-string v3, "2674. mill n.\u78e8\u7c89\u673a,\u78e8\u574a;\u4f5c\u574a,\u5de5\u5382"

    aput-object v3, v0, v2

    const/16 v2, 0xa72

    .line 2851
    const-string v3, "2675. pill n.\u836f\u4e38"

    aput-object v3, v0, v2

    const/16 v2, 0xa73

    .line 2852
    const-string v3, "2676. spill v.\u6ea2\u51fa,\u6e85\u51fa n.\u6454\u4e0b,\u8dcc\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0xa74

    .line 2853
    const-string v3, "2677. drill v.\u7ec3\u4e60;\u64cd\u7ec3;\u94bb\u5b54 n.\u64cd\u7ec3;\u7ec3\u4e60;\u94bb\u5b54(\u673a)"

    aput-object v3, v0, v2

    const/16 v2, 0xa75

    .line 2854
    const-string v3, "2678. thrill n.\u4e00\u9635\u6fc0\u52a8(\u6050\u60e7) v.\u6fc0\u52a8\uff1b(\u4f7f)\u6bdb\u9aa8\u609a\u7136"

    aput-object v3, v0, v2

    const/16 v2, 0xa76

    .line 2855
    const-string v3, "2679. till prep.\u76f4\u5230\uff0c\u76f4\u5230\u2026\u4e3a\u6b62\uff0c\u4e0euntil\u610f\u601d\u76f8\u540c"

    aput-object v3, v0, v2

    const/16 v2, 0xa77

    .line 2856
    const-string v3, "2680. still a.\u9759\u6b62\u7684\uff0c\u5bc2\u9759\u7684 ad.\u8fd8\uff0c\u4ecd\u7136\uff1b\u66f4\uff1b\u5b89\u9759\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xa78

    .line 2857
    const-string v3, "2681. distill vt.\u84b8\u998f\uff0c\u7528\u84b8\u998f\u6cd5\u63d0\u53d6\uff1b\u5438\u53d6\uff0c\u63d0\u70bc"

    aput-object v3, v0, v2

    const/16 v2, 0xa79

    .line 2858
    const-string v3, "2682. will aux./v. \u5c06\uff1b\u4f1a\uff1b\u613f\u610f n.\u610f\u5fd7\uff1b\u51b3\u5fc3\uff1b\u613f\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0xa7a

    .line 2859
    const-string v3, "2683. doll n.\u73a9\u5076,\u73a9\u5177\u5a03\u5a03"

    aput-object v3, v0, v2

    const/16 v2, 0xa7b

    .line 2860
    const-string v3, "2684. poll n.\u6c11\u610f\u6d4b\u9a8c;(pl.)\u653f\u6cbb\u9009\u4e3e v.\u83b7\u5f97\u2026\u9009\u7968"

    aput-object v3, v0, v2

    const/16 v2, 0xa7c

    .line 2861
    const-string v3, "2685. roll v.\u6eda\u52a8;\u4f7f\u6447\u6446;\u5377,\u5377\u8d77 n.\u5377,\u5377\u5f62\u7269;\u540d\u5355"

    aput-object v3, v0, v2

    const/16 v2, 0xa7d

    .line 2862
    const-string v3, "2686. enroll v.(enrol)\u62db\u6536;\u767b\u8bb0;\u5165\u5b66;\u53c2\u519b;\u6210\u4e3a\u4f1a\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xa7e

    .line 2863
    const-string v3, "2687. stroll n.&v.\u6f2b\u6b65\uff1b\u6563\u6b65\uff1b\u6e38\u8361"

    aput-object v3, v0, v2

    const/16 v2, 0xa7f

    .line 2864
    const-string v3, "2688. toll n.(\u9053\u8def\u3001\u6865\u7b49\u7684)\u901a\u884c\u8d39\uff1b\u727a\u7272\uff1b\u6b7b\u4f24\u4eba\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0xa80

    .line 2865
    const-string v3, "2689. bull n.\u516c\u725b"

    aput-object v3, v0, v2

    const/16 v2, 0xa81

    .line 2866
    const-string v3, "2690. dull a.\u5355\u8c03\u7684;\u8fdf\u949d\u7684,\u611a\u7b28\u7684;\u4e0d\u950b\u5229\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa82

    .line 2867
    const-string v3, "2691. full a.(of)\u6ee1\u7684,\u5145\u6ee1\u7684 a./ad.\u5b8c\u5168,\u5145\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0xa83

    .line 2868
    const-string v3, "2692. skull n.\u5934\u76d6\u9aa8\uff0c\u9885\u9aa8"

    aput-object v3, v0, v2

    const/16 v2, 0xa84

    .line 2869
    const-string v3, "2693. pull v.\u62c9,\u62d6 n.\u62c9,\u62d6;\u62c9\u529b,\u7275\u5f15\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xa85

    .line 2870
    const-string v3, "2694. gaol n.(jail)\u76d1\u72f1\uff1b(\u4e0d\u52a0\u51a0\u8bcd)\u76d1\u7981 vt.\u4f7f\u2026\u5750\u7262"

    aput-object v3, v0, v2

    const/16 v2, 0xa86

    .line 2871
    const-string v3, "2695. symbol n.\u7b26\u53f7,\u6807\u5fd7;\u8c61\u5f81"

    aput-object v3, v0, v2

    const/16 v2, 0xa87

    .line 2872
    const-string v3, "2696. alcohol n.\u9152\u7cbe\uff0c\u4e59\u9187\uff1b\u542b\u9152\u7cbe\u7684\u996e\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xa88

    .line 2873
    const-string v3, "2697. cool a.\u51c9\u7684\uff1b\u51b7\u9759\u7684 n.\u51c9\u5feb ad.\u51b7\u9759\u5730 v.\u4f7f\u53d8\u51c9"

    aput-object v3, v0, v2

    const/16 v2, 0xa89

    .line 2874
    const-string v3, "2698. fool n.\u50bb\u5b50\uff0c\u7b28\u86cbvt.\u6b3a\u9a97\uff0c\u611a\u5f04vi.\u5e72\u8822\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0xa8a

    .line 2875
    const-string v3, "2699. school n.\u5b66\u6821\uff0c(\u5927\u5b66\u91cc\u7684)\u5b66\u9662\uff1b\u4e0a\u5b66\uff0c\u5b66\u4e1a\uff1b\u5b66\u6d3e"

    aput-object v3, v0, v2

    const/16 v2, 0xa8b

    .line 2876
    const-string v3, "2700. pool n.\u6c34\u6c60,\u6e38\u6cf3\u6c60;\u5408\u8d44\u7ecf\u8425v.\u5408\u4f19\u7ecf\u8425,\u8054\u8425"

    aput-object v3, v0, v2

    const/16 v2, 0xa8c

    .line 2877
    const-string v3, "2701. tool n.\u5de5\u5177\uff0c\u7528\u5177\uff1b\u65b9\u6cd5\uff0c\u624b\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0xa8d

    .line 2878
    const-string v3, "2702. stool n.\u51f3\u5b50\uff1b(pl.)\u5927\u4fbf"

    aput-object v3, v0, v2

    const/16 v2, 0xa8e

    .line 2879
    const-string v3, "2703. wool n.\u7f8a\u6bdb,\u6bdb\u7ebf,\u6bdb\u7ec7\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xa8f

    .line 2880
    const-string v3, "2704. patrol v.\u5de1\u903b\uff0c\u5de1\u67e5 n.\u5de1\u903b\uff0c\u5de1\u67e5\uff1b\u5de1\u903b\u961f"

    aput-object v3, v0, v2

    const/16 v2, 0xa90

    .line 2881
    const-string v3, "2705. petrol n.\u6c7d\u6cb9"

    aput-object v3, v0, v2

    const/16 v2, 0xa91

    .line 2882
    const-string v3, "2706. control n.(over)\u63a7\u5236,\u652f\u914d v.\u63a7\u5236,\u652f\u914d"

    aput-object v3, v0, v2

    const/16 v2, 0xa92

    .line 2883
    const-string v3, "2707. pistol n.\u624b\u67aa"

    aput-object v3, v0, v2

    const/16 v2, 0xa93

    .line 2884
    const-string v3, "2708. pearl n.\u73cd\u73e0"

    aput-object v3, v0, v2

    const/16 v2, 0xa94

    .line 2885
    const-string v3, "2709. girl n.\u5c11\u5973\uff0c\u59d1\u5a18\uff0c\u5973\u5b69\uff1b\u5973\u804c\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xa95

    .line 2886
    const-string v3, "2710. whirl v.(\u4f7f)\u65cb\u8f6c,\u6253\u8f6c n.\u65cb\u8f6c;-\u8fde\u4e32\u5feb\u901f\u7684\u6d3b\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xa96

    .line 2887
    const-string v3, "2711. curl v.(\u4f7f)\u5377\u66f2,\u8737\u7f29 n.\u5377\u53d1;\u5377\u66f2\u72b6;\u5377\u66f2\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xa97

    .line 2888
    const-string v3, "2712. hurl vt.\u731b\u6295\uff0c\u529b\u63b7\uff1b\u5927\u58f0\u53eb\u9a82"

    aput-object v3, v0, v2

    const/16 v2, 0xa98

    .line 2889
    const-string v3, "2713. haul v.\u62d6\u66f3,\u62d6\u8fd0,\u7528\u529b\u62d6"

    aput-object v3, v0, v2

    const/16 v2, 0xa99

    .line 2890
    const-string v3, "2714. handful n.\u4e00\u628a;\u5c11\u6570;\u4e00\u5c0f\u64ae"

    aput-object v3, v0, v2

    const/16 v2, 0xa9a

    .line 2891
    const-string v3, "2715. peaceful a.\u548c\u5e73\u7684,\u5e73\u9759\u7684,\u5b89\u5b81\u7684,\u7231\u597d\u548c\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9b

    .line 2892
    const-string v3, "2716. graceful a.\u4f18\u7f8e\u7684,\u6587\u96c5\u7684,\u5927\u65b9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9c

    .line 2893
    const-string v3, "2717. hopeful a.\u7ed9\u4eba\u5e0c\u671b\u7684\uff0c\u62b1\u6709\u5e0c\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9d

    .line 2894
    const-string v3, "2718. careful a.\u5c0f\u5fc3\u7684,\u4ed4\u7ec6\u7684;\u7ec6\u81f4\u7684,\u7cbe\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9e

    .line 2895
    const-string v3, "2719. useful a.\u6709\u7528\u7684\uff0c\u5b9e\u7528\u7684\uff1b\u6709\u76ca\u7684\uff0c\u6709\u5e2e\u52a9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xa9f

    .line 2896
    const-string v3, "2720. grateful a.(to,for)\u611f\u6fc0\u7684;\u611f\u8c22\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa0

    .line 2897
    const-string v3, "2721. faithful a.\u5b88\u4fe1\u7684,\u5fe0\u5b9e\u7684,\u5982\u5b9e\u7684,\u53ef\u9760\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa1

    .line 2898
    const-string v3, "2722. plentiful a.\u5bcc\u88d5\u7684,\u4e30\u5bcc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa2

    .line 2899
    const-string v3, "2723. beautiful a.\u7f8e\u7684\uff0c\u7f8e\u4e3d\u7684\uff1b\u51fa\u8272\u7684\uff0c\u5b8c\u7f8e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa3

    .line 2900
    const-string v3, "2724. skillful a.(skilful)(in,at)\u7075\u5de7\u7684,\u5a34\u719f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa4

    .line 2901
    const-string v3, "2725. painful a.\u75bc\u75db\u7684,\u4f7f\u75db\u82e6\u7684,\u8d39\u529b[\u5fc3]\u7684,\u68d8\u624b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa5

    .line 2902
    const-string v3, "2726. helpful a.(to)\u6709\u5e2e\u52a9\u7684,\u6709\u76ca\u7684,\u6709\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa6

    .line 2903
    const-string v3, "2727. fearful a.\u53ef\u6015\u7684\uff0c\u5413\u4eba\u7684\uff1b\u5bb3\u6015\uff0c\u62c5\u5fc3\uff0c\u60ca\u6050"

    aput-object v3, v0, v2

    const/16 v2, 0xaa7

    .line 2904
    const-string v3, "2728. wonderful a.\u60ca\u4eba\u7684,\u5947\u5999\u7684;\u6781\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa8

    .line 2905
    const-string v3, "2729. powerful a.\u5f3a\u5927\u7684,\u6709\u529b\u7684,\u6709\u6743\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaa9

    .line 2906
    const-string v3, "2730. successful a.\u5706\u6ee1\u7684\uff1b\u987a\u5229\u7684\uff1b\u6210\u529f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaaa

    .line 2907
    const-string v3, "2731. thoughtful a.\u8ba4\u771f\u601d\u8003\u7684,\u6c89\u601d\u7684;\u4f53\u8d34\u7684,\u5173\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaab

    .line 2908
    const-string v3, "2732. fruitful a.\u591a\u4ea7\u7684;\u679c\u5b9e\u7d2f\u7d2f\u7684,\u5bcc\u6709\u6210\u6548\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaac

    .line 2909
    const-string v3, "2733. awful a.\u6781\u5ea6\u7684\uff0c\u6781\u574f\u7684\uff1b\u5a01\u4e25\u7684\uff0c\u53ef\u6015\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xaad

    .line 2910
    const-string v3, "2734. foul a.\u6c61\u79fd\u7684;\u90aa\u6076\u7684 v.\u5f04\u810f;\u59a8\u5bb3;\u72af\u89c4 n.\u72af\u89c4"

    aput-object v3, v0, v2

    const/16 v2, 0xaae

    .line 2911
    const-string v3, "2735. soul n.\u7075\u9b42,\u5fc3\u7075;\u7cbe\u795e,\u7cbe\u529b;\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xaaf

    .line 2912
    const-string v3, "2736. crawl v./n.\u722c\u884c,\u8815\u52a8;\u7f13\u6162(\u7684)\u884c\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0xab0

    .line 2913
    const-string v3, "2737. owl n.\u732b\u5934\u9e70"

    aput-object v3, v0, v2

    const/16 v2, 0xab1

    .line 2914
    const-string v3, "2738. bowl n.\u7897(\u72b6\u7269),\u94b5"

    aput-object v3, v0, v2

    const/16 v2, 0xab2

    .line 2915
    const-string v3, "2739. howl n.\u6012\u543c\uff0c\u55e5\u53eb vi.(\u98ce\u7b49)\u6012\u543c\uff0c\u5486\u54ee"

    aput-object v3, v0, v2

    const/16 v2, 0xab3

    .line 2916
    const-string v3, "2740. dam n.\u6c34\u575d,\u6c34\u95f8"

    aput-object v3, v0, v2

    const/16 v2, 0xab4

    .line 2917
    const-string v3, "2741. beam n.(\u6a2a)\u6881,\u6841\u6761;(\u5149\u7ebf\u7684)\u675f,\u67f1 v.\u5fae\u7b11"

    aput-object v3, v0, v2

    const/16 v2, 0xab5

    .line 2918
    const-string v3, "2742. cream n.\u4e73\u8102,(\u9c9c)\u5976\u6cb9;\u5976\u6cb9\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0xab6

    .line 2919
    const-string v3, "2743. ice-cream n.\u51b0\u6dc7\u6dcb"

    aput-object v3, v0, v2

    const/16 v2, 0xab7

    .line 2920
    const-string v3, "2744. scream v./n.\u5c16\u58f0\u53eb,\u558a\u53eb\u7740\u8bf4\u51fa,(\u98ce)\u547c\u5578"

    aput-object v3, v0, v2

    const/16 v2, 0xab8

    .line 2921
    const-string v3, "2745. dream n./v.\u68a6,\u68a6\u60f3,\u5e7b\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0xab9

    .line 2922
    const-string v3, "2746. stream n.\u5c0f\u6cb3,\u6eaa\u6d41;\u6d41,\u4e00\u80a1,\u4e00\u4e32 v.\u6d41\u51fa,\u6d8c"

    aput-object v3, v0, v2

    const/16 v2, 0xaba

    .line 2923
    const-string v3, "2747. seam n.\u7f1d,\u63a5\u7f1d"

    aput-object v3, v0, v2

    const/16 v2, 0xabb

    .line 2924
    const-string v3, "2748. team n.\u5c0f\u961f,\u5c0f\u7ec4 v.\u534f\u540c\u5de5\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0xabc

    .line 2925
    const-string v3, "2749. steam n.\u6c34\u6c7d,\u84b8\u6c7d,\u6c34\u84b8\u6c14 v.\u84b8\u53d1;\u84b8;\u7528\u84b8\u6c7d\u5f00\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xabd

    .line 2926
    const-string v3, "2750. ham n.\u706b\u817f"

    aput-object v3, v0, v2

    const/16 v2, 0xabe

    .line 2927
    const-string v3, "2751. sham n./a.\u5047\u5192(\u7684)\uff0c\u865a\u4f2a(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xabf

    .line 2928
    const-string v3, "2752. jam n.\u963b\u585e,\u8f67\u4f4f;\u679c\u9171 v.(\u4f7f)\u963b\u585e,(\u4f7f)\u8f67\u4f4f\u4e0d\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xac0

    .line 2929
    const-string v3, "2753. slam v.(\u95e8\u3001\u7a97\u7b49)\u7830\u5730\u5173\u4e0a n.\u731b\u7136\u5173\u95ed\u7684\u58f0\u97f3"

    aput-object v3, v0, v2

    const/16 v2, 0xac1

    .line 2930
    const-string v3, "2754. foam v./n.\u6ce1\u6cab,\u8d77\u6ce1\u6cab"

    aput-object v3, v0, v2

    const/16 v2, 0xac2

    .line 2931
    const-string v3, "2755. diagram n.\u56fe\u8868;\u56fe\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0xac3

    .line 2932
    const-string v3, "2756. telegram n.\u7535\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0xac4

    .line 2933
    const-string v3, "2757. tram n.\u6709\u8f68\u7535\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0xac5

    .line 2934
    const-string v3, "2758. exam n.(examination)\u8003\u8bd5,\u6d4b\u9a8c"

    aput-object v3, v0, v2

    const/16 v2, 0xac6

    .line 2935
    const-string v3, "2759. deem v.\u8ba4\u4e3a,\u76f8\u4fe1"

    aput-object v3, v0, v2

    const/16 v2, 0xac7

    .line 2936
    const-string v3, "2760. seem v.\u597d\u50cf,\u4f3c\u4e4e"

    aput-object v3, v0, v2

    const/16 v2, 0xac8

    .line 2937
    const-string v3, "2761. esteem n.\u5c0a\u656c\uff0c\u5c0a\u91cd vt.\u5c0a\u91cd\uff0c\u656c\u91cd\uff1b\u628a\u2026\u770b\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0xac9

    .line 2938
    const-string v3, "2762. them pron.\u4ed6\u4eec/\u5979\u4eec/\u5b83\u4eec(they\u7684\u5bbe\u683c\u5f62\u5f0f)"

    aput-object v3, v0, v2

    const/16 v2, 0xaca

    .line 2939
    const-string v3, "2763. problem n.\u95ee\u9898,\u7591\u96be\u95ee\u9898;\u601d\u8003\u9898,\u8ba8\u8bba\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0xacb

    .line 2940
    const-string v3, "2764. poem n.\u8bd7"

    aput-object v3, v0, v2

    const/16 v2, 0xacc

    .line 2941
    const-string v3, "2765. item n.\u6761(\u6b3e)\uff0c\u9879\u76ee\uff1b\u4e00\u5219(\u65b0\u95fb)\uff0c(\u620f\u5267\u7684)\u8282\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0xacd

    .line 2942
    const-string v3, "2766. stem n.\u830e\uff0c\u5e72 vt.\u5835(\u6321)\u4f4f vi.\u8d77\u6e90\u4e8e\uff0c\u7531\u2026\u9020\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0xace

    .line 2943
    const-string v3, "2767. system n.\u7cfb\u7edf\uff0c\u4f53\u7cfb\uff1b\u5236\u5ea6\uff1b\u65b9\u6cd5\uff0c\u65b9\u5f0f\uff0c\u6b65\u805a"

    aput-object v3, v0, v2

    const/16 v2, 0xacf

    .line 2944
    const-string v3, "2768. paradigm n.\u5178\u8303; \u8303\u4f8b; \u793a\u4f8b"

    aput-object v3, v0, v2

    const/16 v2, 0xad0

    .line 2945
    const-string v3, "2769. rhythm n.\u8282\u594f,\u97f5\u5f8b"

    aput-object v3, v0, v2

    const/16 v2, 0xad1

    .line 2946
    const-string v3, "2770. aim n.\u76ee\u7684\uff1b\u7784\u51c6 vi.(at)\u76ee\u7684\u5728\u4e8e vt.\u628a\u2026\u7784\u51c6"

    aput-object v3, v0, v2

    const/16 v2, 0xad2

    .line 2947
    const-string v3, "2771. "

    aput-object v3, v0, v2

    const/16 v2, 0xad3

    .line 2948
    const-string v3, "2772. "

    aput-object v3, v0, v2

    const/16 v2, 0xad4

    .line 2949
    const-string v3, "2773. claim v.\u8981\u6c42;\u58f0\u79f0;\u7d22\u8d54 n.\u8981\u6c42;\u65ad\u8a00;\u7d22\u8d54;\u6743\u5229"

    aput-object v3, v0, v2

    const/16 v2, 0xad5

    .line 2950
    const-string v3, "2774. acclaim v.\u5411\u2026\u6b22\u547c\uff0c\u516c\u8ba4 n.\u6b22\u547c\uff0c\u559d\u5f69\uff0c\u79f0\u8d5e"

    aput-object v3, v0, v2

    const/16 v2, 0xad6

    .line 2951
    const-string v3, "2775. reclaim v.\u8981\u6c42\u5f52\u8fd8,\u6536\u56de;\u5f00\u57a6"

    aput-object v3, v0, v2

    const/16 v2, 0xad7

    .line 2952
    const-string v3, "2776. proclaim v.\u5ba3\u544a,\u58f0\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xad8

    .line 2953
    const-string v3, "2777. exclaim v.\u547c\u558a,\u60ca\u53eb,\u5927\u58f0\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0xad9

    .line 2954
    const-string v3, "2778. dim a.\u6697\u6de1\u7684,\u6a21\u7cca\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xada

    .line 2955
    const-string v3, "2779. him pron.\u4ed6(he\u7684\u5bbe\u683c\u5f62\u5f0f)"

    aput-object v3, v0, v2

    const/16 v2, 0xadb

    .line 2956
    const-string v3, "2780. skim vt.\u6487\u53bb(\u6db2\u4f53\u8868\u9762)\u4e4b\u6f02\u6d6e\u7269 vi.\u8f7b\u8f7b\u63a0\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xadc

    .line 2957
    const-string v3, "2781. slim a.\u82d7\u6761\u7684;(\u673a\u4f1a)\u5c11\u7684 v.\u51cf\u8f7b\u4f53\u91cd,\u53d8\u82d7\u6761"

    aput-object v3, v0, v2

    const/16 v2, 0xadd

    .line 2958
    const-string v3, "2782. rim n.(\u5706\u7269\u7684)\u8fb9,\u8fb9\u7f18;(\u773c\u955c)\u6846"

    aput-object v3, v0, v2

    const/16 v2, 0xade

    .line 2959
    const-string v3, "2783. brim n.\u8fb9\u7f18,\u5e3d\u6cbf"

    aput-object v3, v0, v2

    const/16 v2, 0xadf

    .line 2960
    const-string v3, "2784. interim a.\u4e2d\u95f4\u7684,\u6682\u65f6\u7684,\u4e34\u65f6\u7684 n.\u8fc7\u6e21\u65f6\u671f,\u6682\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xae0

    .line 2961
    const-string v3, "2785. grim a.\u4e25\u9177\u7684\uff0c\u4ee4\u4eba\u5bb3\u6015\u7684\uff1b\u4e0d\u6109\u5feb\u7684\uff0c\u8ba8\u538c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xae1

    .line 2962
    const-string v3, "2786. pilgrim n.(\u5728\u56fd\u5916)\u65c5\u6e38\u8005;\u671d\u5723\u8005,\u6700\u521d\u7684\u79fb\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0xae2

    .line 2963
    const-string v3, "2787. trim a.\u6574\u9f50\u7684,\u6574\u6d01\u7684 v./n.\u6574\u7406,\u4fee\u6574,\u88c5\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0xae3

    .line 2964
    const-string v3, "2788. victim n.\u727a\u7272\u54c1,\u53d7\u5bb3\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xae4

    .line 2965
    const-string v3, "2789. swim vi.\u6e38\u6cf3;\u6e38;\u6f02\u6d6e;\u7729\u6655;\u5145\u6ea2 vt.\u6e38\u8fc7 n.\u6e38\u6cf3"

    aput-object v3, v0, v2

    const/16 v2, 0xae5

    .line 2966
    const-string v3, "2790. calm a.(\u5929\u6c14,\u6d77\u6d0b\u7b49)\u9759\u7684 n.\u5e73\u9759 v.(\u4f7f)\u5e73\u9759"

    aput-object v3, v0, v2

    const/16 v2, 0xae6

    .line 2967
    const-string v3, "2791. realm n.\u738b\u56fd,\u56fd\u571f;\u9886\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0xae7

    .line 2968
    const-string v3, "2792. palm n.\u624b\u638c,\u638c\u72b6\u7269,\u68d5\u6988vt.\u4e0e\u2026\u63e1\u624b,\u85cf\u2026\u4e8e\u638c\u4e2d"

    aput-object v3, v0, v2

    const/16 v2, 0xae8

    .line 2969
    const-string v3, "2793. overwhelm v.\u6df9\u6ca1,\u8986\u6ca1,\u538b\u5012,\u5236\u670d,\u4f7f\u4e0d\u77e5\u6240\u63aa"

    aput-object v3, v0, v2

    const/16 v2, 0xae9

    .line 2970
    const-string v3, "2794. film n.\u7535\u5f71\uff1b\u80f6\u7247\uff1b\u8584\u819c\uff0c\u8584\u5c42 vt.\u628a..\u62cd\u6210\u7535\u5f71"

    aput-object v3, v0, v2

    const/16 v2, 0xaea

    .line 2971
    const-string v3, "2795. freedom n.\u81ea\u7531,\u81ea\u4e3b,\u514d\u9664,\u7279\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0xaeb

    .line 2972
    const-string v3, "2796. kingdom n.\u738b\u56fd,\u9886\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0xaec

    .line 2973
    const-string v3, "2797. seldom ad.\u5f88\u5c11,\u4e0d\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0xaed

    .line 2974
    const-string v3, "2798. random a.\u968f\u673a\u7684,\u968f\u610f\u7684 n.\u968f\u673a,\u968f\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0xaee

    .line 2975
    const-string v3, "2799. wisdom n.\u667a\u6167,\u660e\u667a;\u540d\u8a00,\u683c\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0xaef

    .line 2976
    const-string v3, "2800. whom pron.\u8c01\uff1b\u54ea\u4e2a\u4eba(who\u7684\u5bbe\u683c)"

    aput-object v3, v0, v2

    const/16 v2, 0xaf0

    .line 2977
    const-string v3, "2801. idiom n.\u4e60\u8bed;\u6210\u8bed\u65b9\u8a00;(\u827a\u672f\u7b49\u7684)\u98ce\u683c,\u7279\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0xaf1

    .line 2978
    const-string v3, "2802. boom v.\u8fc5\u901f\u53d1\u5c55,\u5174\u65fa;\u53d1\u51fa\u9686\u9686\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xaf2

    .line 2979
    const-string v3, "2803. doom n.\u5384\u8fd0,\u52ab\u6570 v.\u6ce8\u5b9a,\u547d\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xaf3

    .line 2980
    const-string v3, "2804. loom n.\u7ec7\u5e03\u673a,\u7ec7\u673a v.\u9690\u73b0,(\u5371\u9669\u3001\u5fe7\u8651\u7b49)\u8feb\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0xaf4

    .line 2981
    const-string v3, "2805. bloom n.\u82b1(\u6735);\u5f00\u82b1(\u671f) v.\u5f00\u82b1"

    aput-object v3, v0, v2

    const/16 v2, 0xaf5

    .line 2982
    const-string v3, "2806. room n.\u623f\u95f4\uff0c\u5ba4\uff0c\u7a7a\u95f4\uff0c\u5730\u65b9\uff1b\u4f59\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xaf6

    .line 2983
    const-string v3, "2807. living-room n.\u8d77\u5c45\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xaf7

    .line 2984
    const-string v3, "2808. broom n.\u626b\u5e1a"

    aput-object v3, v0, v2

    const/16 v2, 0xaf8

    .line 2985
    const-string v3, "2809. mushroom n.\u8611\u83c7 vt.\u8fc5\u901f\u751f\u957f,\u8fc5\u901f\u589e\u52a0,\u91c7\u8611\u83c7"

    aput-object v3, v0, v2

    const/16 v2, 0xaf9

    .line 2986
    const-string v3, "2810. bathroom n.\u6d74\u5ba4;\u76e5\u6d17\u5ba4,\u536b\u751f\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0xafa

    .line 2987
    const-string v3, "2811. classroom n.\u6559\u5ba4\uff0c\u8bfe\u5802"

    aput-object v3, v0, v2

    const/16 v2, 0xafb

    .line 2988
    const-string v3, "2812. zoom vi.(\u98de\u673a)\u9661\u5347 n.\u9661\u5347\uff1b\u55e1\u55e1\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xafc

    .line 2989
    const-string v3, "2813. from prep.\u4ece\uff0c\u81ea\u4ece\uff1b\u7531\u4e8e\uff1b\u79bb\uff1b\u6839\u636e\uff0c\u6309\uff1b\u53bb\u9664"

    aput-object v3, v0, v2

    const/16 v2, 0xafd

    .line 2990
    const-string v3, "2814. bosom n.\u80f8\uff0c\u80f8\u90e8\uff1b\u80f8\u6000\uff1b\u5185\u5fc3\uff1ba.\u4eb2\u5bc6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xafe

    .line 2991
    const-string v3, "2815. blossom n.\u82b1(\u7c07)\uff1b\u82b1\u671f\uff1b\u9752\u6625 vi.\u5f00\u82b1\uff1b\u5c55\u5f00\uff1b\u7e41\u8363"

    aput-object v3, v0, v2

    const/16 v2, 0xaff

    .line 2992
    const-string v3, "2816. atom n.\u539f\u5b50\uff1b\u5fae\u7c92\uff0c\u5fae\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xb00

    .line 2993
    const-string v3, "2817. symptom n.(\u75be\u75c5\u7684)\u75c7\u72b6\uff1b(\u4e0d\u597d\u4e8b\u60c5\u7684)\u5f81\u5146,\u8868\u5f81"

    aput-object v3, v0, v2

    const/16 v2, 0xb01

    .line 2994
    const-string v3, "2818. custom n.\u4e60\u60ef,\u98ce\u4fd7,\u60ef\u4f8b;(pl.)\u6d77\u5173,\u5173\u7a0e"

    aput-object v3, v0, v2

    const/16 v2, 0xb02

    .line 2995
    const-string v3, "2819. bottom n.\u5e95(\u90e8);\u57fa\u7840,\u6839\u57fa;\u6d77\u5e95,\u6e56\u5e95,\u6cb3\u5e8a"

    aput-object v3, v0, v2

    const/16 v2, 0xb03

    .line 2996
    const-string v3, "2820. arm n.\u624b\u81c2\uff0c\u6276\u624b\uff0c\u81c2\u72b6\u7269 v.\u6b66\u88c5\uff1b\u914d\u5907 n.\u6b66\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xb04

    .line 2997
    const-string v3, "2821. farm n.\u519c\u573a,\u9972\u517b\u573a v.\u79cd\u7530,\u7ecf\u8425\u519c\u7267\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0xb05

    .line 2998
    const-string v3, "2822. harm n./v.\u4f24\u5bb3,\u635f\u5bb3,\u5371\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0xb06

    .line 2999
    const-string v3, "2823. charm n.\u5438\u5f15\u529b,\u9b45\u529b v.\u8ff7\u4eba,(\u4f7f)\u9676\u9189;\u65bd\u9b54\u6cd5\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xb07

    .line 3000
    const-string v3, "2824. alarm n.\u60ca\u6050\uff1b\u8b66\u62a5(\u5668) vt.\u60ca\u52a8\uff0c\u60ca\u5413\uff1b\u5411\u2026\u62a5\u8b66"

    aput-object v3, v0, v2

    const/16 v2, 0xb08

    .line 3001
    const-string v3, "2825. warm a.\u6e29\u6696\u7684\uff0c\u70ed\u5fc3\u7684\uff0c\u70ed\u60c5\u7684  v.(\u4f7f)\u53d8\u6696"

    aput-object v3, v0, v2

    const/16 v2, 0xb09

    .line 3002
    const-string v3, "2826. swarm n.\u8702\u7fa4;\u4e00\u5927\u7fa4 vi.\u6d8c\u5f80;\u6324\u6ee1;\u4e91\u96c6;\u6210\u7fa4\u79fb\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xb0a

    .line 3003
    const-string v3, "2827. germ n.\u5fae\u751f\u7269,\u7ec6\u83cc"

    aput-object v3, v0, v2

    const/16 v2, 0xb0b

    .line 3004
    const-string v3, "2828. term n.\u5b66\u671f;\u671f\u9650,\u671f\u95f4;(pl.)\u6761\u4ef6,\u6761\u6b3e;\u672f\u8bed"

    aput-object v3, v0, v2

    const/16 v2, 0xb0c

    .line 3005
    const-string v3, "2829. firm a.\u575a\u56fa\u7684;\u575a\u51b3\u7684,\u575a\u5b9a\u7684 n.\u516c\u53f8,\u5546\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0xb0d

    .line 3006
    const-string v3, "2830. affirm vt.\u65ad\u8a00\uff0c\u575a\u6301\u58f0\u79f0\uff1b\u80af\u5b9a\uff1b\u8bc1\u5b9e,\u786e\u8ba4\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0xb0e

    .line 3007
    const-string v3, "2831. confirm v.\u4f7f\u66f4\u575a\u56fa,\u4f7f\u66f4\u575a\u5b9a;(\u8fdb\u4e00\u6b65)\u8bc1\u5b9e;\u786e\u8ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xb0f

    .line 3008
    const-string v3, "2832. dorm n.(dormitory)\uff3b\u7f8e\uff3d\uff3b\u53e3\uff3d\u5bbf\u820d"

    aput-object v3, v0, v2

    const/16 v2, 0xb10

    .line 3009
    const-string v3, "2833. form n.\u5f62\u72b6,\u5f62\u5f0f;\u8868\u683c v.\u7ec4\u6210,\u6784\u6210;\u5f62\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0xb11

    .line 3010
    const-string v3, "2834. reform v./n.\u6539\u9769,\u6539\u9020,\u6539\u826f"

    aput-object v3, v0, v2

    const/16 v2, 0xb12

    .line 3011
    const-string v3, "2835. uniform n.\u5236\u670d,\u519b\u670d a.\u76f8\u540c\u7684,\u4e00\u5f8b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb13

    .line 3012
    const-string v3, "2836. inform v.(of,about)\u901a\u77e5,\u544a\u8bc9,\u62a5\u544a;\u544a\u53d1,\u544a\u5bc6"

    aput-object v3, v0, v2

    const/16 v2, 0xb14

    .line 3013
    const-string v3, "2837. conform vi.(to)\u9075\u5b88\uff0c\u9002\u5e94\uff1b\u76f8\u4f3c\uff0c\u4e00\u81f4\uff0c\u7b26\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0xb15

    .line 3014
    const-string v3, "2838. perform v.\u5c65\u884c,\u6267\u884c;\u8868\u6f14,\u6f14\u51fa;\u5b8c\u6210(\u4e8b\u4e1a)"

    aput-object v3, v0, v2

    const/16 v2, 0xb16

    .line 3015
    const-string v3, "2839. transform vt.\u6539\u53d8,\u53d8\u6362;\u53d8\u538b;\u8f6c\u5316;\u6539\u9020,\u6539\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0xb17

    .line 3016
    const-string v3, "2840. platform n.\u5e73\u53f0,\u53f0;\u7ad9\u53f0,\u6708\u53f0;\u653f\u7eb2,\u515a\u7eb2"

    aput-object v3, v0, v2

    const/16 v2, 0xb18

    .line 3017
    const-string v3, "2841. norm n.\u51c6\u5219,\u89c4\u8303,\u51c6\u5219,\u5e73\u5747\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0xb19

    .line 3018
    const-string v3, "2842. storm n.\u66b4\u98ce\u96e8,\u66b4\u98ce\u96ea;\u6fc0\u52a8,\u7206\u53d1 v.\u731b\u653b,\u76f4\u6363"

    aput-object v3, v0, v2

    const/16 v2, 0xb1a

    .line 3019
    const-string v3, "2843. snowstorm n.\u66b4\u98ce\u96ea"

    aput-object v3, v0, v2

    const/16 v2, 0xb1b

    .line 3020
    const-string v3, "2844. worm n.\u866b,\u8815\u866b"

    aput-object v3, v0, v2

    const/16 v2, 0xb1c

    .line 3021
    const-string v3, "2845. enthusiasm n.\u70ed\u60c5,\u70ed\u5fc3;\u72c2\u70ed;\u79ef\u6781\u6027(for)"

    aput-object v3, v0, v2

    const/16 v2, 0xb1d

    .line 3022
    const-string v3, "2846. criticism n.\u8bc4\u8bba\u6027\u7684\u6587\u7ae0\uff0c\u8bc4\u8bba\uff1b\u6279\u8bc4\uff0c\u6307\u8d23\uff0c\u975e\u96be"

    aput-object v3, v0, v2

    const/16 v2, 0xb1e

    .line 3023
    const-string v3, "2847. socialism n.\u793e\u4f1a\u4e3b\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0xb1f

    .line 3024
    const-string v3, "2848. capitalism n.\u8d44\u672c\u4e3b\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0xb20

    .line 3025
    const-string v3, "2849. organism n.\u751f\u7269\uff0c\u6709\u673a\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xb21

    .line 3026
    const-string v3, "2850. mechanism n.\u673a\u68b0\u88c5\u7f6e,\u673a\u6784;\u673a\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xb22

    .line 3027
    const-string v3, "2851. communism n.\u5171\u4ea7\u4e3b\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0xb23

    .line 3028
    const-string v3, "2852. album n.(\u540c\u4e00\u8868\u6f14\u8005\u7684)\u96c6\u9526\u5bc6\u7eb9\u5531\u7247;\u96c6\u90ae\u518c,\u76f8\u518c"

    aput-object v3, v0, v2

    const/16 v2, 0xb24

    .line 3029
    const-string v3, "2853. petroleum n.\u77f3\u6cb9"

    aput-object v3, v0, v2

    const/16 v2, 0xb25

    .line 3030
    const-string v3, "2854. museum n.\u535a\u7269\u9986,\u5c55\u89c8\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0xb26

    .line 3031
    const-string v3, "2855. gum n.\u6811\u80f6;\u53e3\u9999\u7cd6"

    aput-object v3, v0, v2

    const/16 v2, 0xb27

    .line 3032
    const-string v3, "2856. hum v.\u54fc\u66f2\u5b50\uff1b\u53d1\u55e1\u55e1\u58f0\uff1b\u5fd9\u788cn.\u55e1\u55e1\u58f0\uff0c\u5608\u6742\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xb28

    .line 3033
    const-string v3, "2857. calcium n.\u9499(\u5316\u5b66\u7b26\u53f7Ca)"

    aput-object v3, v0, v2

    const/16 v2, 0xb29

    .line 3034
    const-string v3, "2858. stadium n.\u4f53\u80b2\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0xb2a

    .line 3035
    const-string v3, "2859. medium n.(pl.media)\u5a92\u4f53,\u65b9\u6cd5,\u5a92\u4ecb,\u4ecb\u8d28 a.\u4e2d\u7b49\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb2b

    .line 3036
    const-string v3, "2860. premium n.\u989d\u5916\u8d39\u7528,\u5956\u91d1,\u5956\u8d4f,\u4fdd\u9669\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0xb2c

    .line 3037
    const-string v3, "2861. bacterium n.(pl.)bacteria \u7ec6\u83cc"

    aput-object v3, v0, v2

    const/16 v2, 0xb2d

    .line 3038
    const-string v3, "2862. auditorium n.\u89c2\u4f17\u5e2d\uff0c\u542c\u4f17\u5e2d\uff1b\u4f1a\u5802\uff0c\u793c\u5802"

    aput-object v3, v0, v2

    const/16 v2, 0xb2e

    .line 3039
    const-string v3, "2863. gymnasium n.(gym)\u4f53\u80b2\u9986\uff0c\u5065\u8eab\u623f"

    aput-object v3, v0, v2

    const/16 v2, 0xb2f

    .line 3040
    const-string v3, "2864. symposium n.\u8ba8\u8bba\u4f1a,\u4e13\u9898\u62a5\u544a\u4f1a;\u4e13\u9898\u8bba\u6587\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0xb30

    .line 3041
    const-string v3, "2865. slum n.\u8d2b\u6c11\u7a9f,\u8d2b\u6c11\u533a,\u964b\u5df7"

    aput-object v3, v0, v2

    const/16 v2, 0xb31

    .line 3042
    const-string v3, "2866. curriculum n.(pl.curricula)\u8bfe\u7a0b,(\u5b66\u6821\u7b49\u7684)\u5168\u90e8\u8bfe\u7a0b"

    aput-object v3, v0, v2

    const/16 v2, 0xb32

    .line 3043
    const-string v3, "2867. pendulum n.\u6446,\u949f\u6446"

    aput-object v3, v0, v2

    const/16 v2, 0xb33

    .line 3044
    const-string v3, "2868. minimum n.\u6700\u5c0f\u503c,\u6700\u4f4e\u9650\u5ea6 a.\u6700\u5c0f\u7684,\u6700\u4f4e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb34

    .line 3045
    const-string v3, "2869. optimum a.\u6700\u9002\u5b9c\u7684 n.\u6700\u9002\u5b9c(\u6761\u4ef6)"

    aput-object v3, v0, v2

    const/16 v2, 0xb35

    .line 3046
    const-string v3, "2870. maximum n.\u6700\u5927\u503c,\u6781\u9650 a.\u6700\u5927\u7684,\u6700\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb36

    .line 3047
    const-string v3, "2871. aluminum n.(aluminium)\u94dd"

    aput-object v3, v0, v2

    const/16 v2, 0xb37

    .line 3048
    const-string v3, "2872. drum n.\u9f13;\u5706\u6876"

    aput-object v3, v0, v2

    const/16 v2, 0xb38

    .line 3049
    const-string v3, "2873. forum n.\u8bba\u575b,\u8ba8\u8bba\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xb39

    .line 3050
    const-string v3, "2874. spectrum n.\u8c31\uff0c\u5149\u8c31\uff0c\u9891\u8c31\uff1b\u8303\u56f4\uff0c\u5e45\u5ea6\uff0c\u7cfb\u5217"

    aput-object v3, v0, v2

    const/16 v2, 0xb3a

    .line 3051
    const-string v3, "2875. sum n.\u603b\u6570,\u548c;\u91d1\u989d;\u7b97\u672f\u9898;\u8981\u65e8 v.\u5408\u8ba1,\u603b\u8ba1"

    aput-object v3, v0, v2

    const/16 v2, 0xb3b

    .line 3052
    const-string v3, "2876. momentum n.\u52a8\u529b,\u8981\u7d20"

    aput-object v3, v0, v2

    const/16 v2, 0xb3c

    .line 3053
    const-string v3, "2877. vacuum n.\u771f\u7a7a,\u771f\u7a7a\u5438\u5c18\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xb3d

    .line 3054
    const-string v3, "2878. ban v.\u53d6\u7f14,\u67e5\u7981;(from)\u7981\u6b62 n.\u7981\u6b62,\u7981\u4ee4"

    aput-object v3, v0, v2

    const/16 v2, 0xb3e

    .line 3055
    const-string v3, "2879. urban a.\u57ce\u5e02\u7684, \u5e02\u5185\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb3f

    .line 3056
    const-string v3, "2880. can aux.v.\u80fd\uff1b\u53ef\u4ee5 n.\u7f50\u5934\uff1b\u5bb9\u5668 vt.\u628a\u2026\u88c5\u7f50"

    aput-object v3, v0, v2

    const/16 v2, 0xb40

    .line 3057
    const-string v3, "2881. republican a.\u5171\u548c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb41

    .line 3058
    const-string v3, "2882. scan v.\u7ec6\u770b,\u5ba1\u89c6;\u6d4f\u89c8;\u626b\u63cf n.\u626b\u63cf"

    aput-object v3, v0, v2

    const/16 v2, 0xb42

    .line 3059
    const-string v3, "2883. bean n.\u8c46;\u83dc\u8c46,\u8695\u8c46"

    aput-object v3, v0, v2

    const/16 v2, 0xb43

    .line 3060
    const-string v3, "2884. ocean n.\u6d77\u6d0b"

    aput-object v3, v0, v2

    const/16 v2, 0xb44

    .line 3061
    const-string v3, "2885. dean n.(\u5927\u5b66)\u9662\u957f;\u4e3b\u6301\u7267\u5e08; (\u57fa\u7763\u6559)\u6559\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xb45

    .line 3062
    const-string v3, "2886. lean v.\u503e\u659c,\u5c48\u8eab;\u501a,\u9760,\u4f9d\u8d56 a.\u7626\u7684,\u65e0\u8102\u80aa\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb46

    .line 3063
    const-string v3, "2887. clean a.\u6e05\u6d01\u7684\uff0c\u5e72\u51c0\u7684v.\u9664\u53bb..\u6c61\u57a2,\u628a...\u5f04\u5e72\u51c0"

    aput-object v3, v0, v2

    const/16 v2, 0xb47

    .line 3064
    const-string v3, "2888. mean v.\u8868\u793a\u2026\u7684\u610f\u601d a.\u5351\u9119\u7684;\u5e73\u5747\u7684n.\u5e73\u5747\u503c"

    aput-object v3, v0, v2

    const/16 v2, 0xb48

    .line 3065
    const-string v3, "2889. fan n.\u6247\u5b50,\u98ce\u6247;(\u5f71,\u7403\u7b49)\u8ff7 v.\u6247,\u6247\u52a8,\u6fc0\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xb49

    .line 3066
    const-string v3, "2890. slogan n.\u6807\u8bed,\u53e3\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0xb4a

    .line 3067
    const-string v3, "2891. organ n.\u5668\u5b98;\u673a\u6784,\u673a\u5173;\u98ce\u7434"

    aput-object v3, v0, v2

    const/16 v2, 0xb4b

    .line 3068
    const-string v3, "2892. orphan n.\u5b64\u513f"

    aput-object v3, v0, v2

    const/16 v2, 0xb4c

    .line 3069
    const-string v3, "2893. than conj.(\u7528\u4e8e\u5f62\u5bb9\u8bcd\uff0c\u526f\u8bcd\u7684\u6bd4\u8f83\u7ea7\u4e4b\u540e)\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0xb4d

    .line 3070
    const-string v3, "2894. technician n.\u6280\u672f\u5458,\u6280\u5e08,\u6280\u5de5"

    aput-object v3, v0, v2

    const/16 v2, 0xb4e

    .line 3071
    const-string v3, "2895. electrician n.\u7535\u5b66\u5bb6,\u7535\u5de5"

    aput-object v3, v0, v2

    const/16 v2, 0xb4f

    .line 3072
    const-string v3, "2896. musician n.\u97f3\u4e50\u5bb6,\u4e50\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xb50

    .line 3073
    const-string v3, "2897. physician n.\u5185\u79d1\u533b\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xb51

    .line 3074
    const-string v3, "2898. politician n.\u653f\u6cbb\u5bb6,\u653f\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0xb52

    .line 3075
    const-string v3, "2899. civilian n.\u5e73\u6c11 a.\u5e73\u6c11\u7684;\u6c11\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb53

    .line 3076
    const-string v3, "2900. librarian n.\u56fe\u4e66\u7ba1\u7406\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xb54

    .line 3077
    const-string v3, "2901. vegetarian n.\u7d20\u98df\u4e3b\u4e49\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xb55

    .line 3078
    const-string v3, "2902. historian n.\u5386\u53f2\u5b66\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0xb56

    .line 3079
    const-string v3, "2903. pedestrian n.\u6b65\u884c\u8005 a.\u5f92\u6b65\u7684,\u5446\u677f\u7684,\u901a\u4fd7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb57

    .line 3080
    const-string v3, "2904. Christian n.\u57fa\u7763\u6559\u5f92 a.\u57fa\u7763\u6559\u5f92\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb58

    .line 3081
    const-string v3, "2905. plan n.\u8ba1\u5212,\u89c4\u5212;\u5e73\u9762\u56fe,\u8bbe\u8ba1\u56fe v.\u8ba1\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0xb59

    .line 3082
    const-string v3, "2906. man n.(pl.men)\u4eba\uff1b\u4eba\u7c7b(\u5355\u6570\uff0c\u4e0d\u52a0\u51a0\u8bcd)\uff1b\u7537\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xb5a

    .line 3083
    const-string v3, "2907. policeman n.\u8b66\u5bdf"

    aput-object v3, v0, v2

    const/16 v2, 0xb5b

    .line 3084
    const-string v3, "2908. gentleman n.\u7ec5\u58eb,\u5148\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xb5c

    .line 3085
    const-string v3, "2909. fireman n.\u6d88\u9632\u961f\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xb5d

    .line 3086
    const-string v3, "2910. woman n.(pl.\uff09women\u5987\u5973\uff0c\u6210\u5e74\u5973\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xb5e

    .line 3087
    const-string v3, "2911. fisherman n.\u6e14\u592b\uff0c\u6355\u9c7c\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xb5f

    .line 3088
    const-string v3, "2912. chairman n.\u4e3b\u5e2d,\u8bae\u957f,\u4f1a\u957f,\u8463\u4e8b\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xb60

    .line 3089
    const-string v3, "2913. spokesman n.\u53d1\u8a00\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xb61

    .line 3090
    const-string v3, "2914. salesman n.\u552e\u8d27\u5458,\u63a8\u9500\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xb62

    .line 3091
    const-string v3, "2915. statesman n.\u653f\u6cbb\u5bb6,\u56fd\u52a1\u6d3b\u52a8\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0xb63

    .line 3092
    const-string v3, "2916. sportsman n.\u7231\u597d\u8fd0\u52a8\u7684\u4eba\uff1b\u8fd0\u52a8\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xb64

    .line 3093
    const-string v3, "2917. postman n.\u90ae\u9012\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xb65

    .line 3094
    const-string v3, "2918. human a.\u4eba\u7684,\u4eba\u7c7b\u7684 n.\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xb66

    .line 3095
    const-string v3, "2919. layman n.\u5916\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xb67

    .line 3096
    const-string v3, "2920. loan n.\u8d37\u6b3e;\u51fa\u501f,\u501f\u51fa v.\u501f\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0xb68

    .line 3097
    const-string v3, "2921. moan n.\u547b\u541f\u58f0,\u60b2\u53f9\u58f0 v.\u547b\u541f,\u62b1\u6028,\u60b2\u53f9"

    aput-object v3, v0, v2

    const/16 v2, 0xb69

    .line 3098
    const-string v3, "2922. groan v./n.\u547b\u541f"

    aput-object v3, v0, v2

    const/16 v2, 0xb6a

    .line 3099
    const-string v3, "2923. pan n.\u5e73\u5e95\u9505,\u76d8\u5b50,\u9762\u677f"

    aput-object v3, v0, v2

    const/16 v2, 0xb6b

    .line 3100
    const-string v3, "2924. span n.\u8de8\u5ea6,\u8de8\u8ddd"

    aput-object v3, v0, v2

    const/16 v2, 0xb6c

    .line 3101
    const-string v3, "2925. veteran n.\u8001\u624b,\u8001\u5175"

    aput-object v3, v0, v2

    const/16 v2, 0xb6d

    .line 3102
    const-string v3, "2926. tan n./a.(\u76ae\u80a4\u56e0\u65e5\u6652\u800c\u6210)\u68d5\u8910\u8272(\u7684) vt.\u6652\u9ed1"

    aput-object v3, v0, v2

    const/16 v2, 0xb6e

    .line 3103
    const-string v3, "2927. metropolitan a.\u9996\u90fd\u7684,\u4e3b\u8981\u90fd\u5e02\u7684,\u5927\u57ce\u5e02"

    aput-object v3, v0, v2

    const/16 v2, 0xb6f

    .line 3104
    const-string v3, "2928. van n.\u6709\u7bf7\u6c7d\u8f66;\u6709\u7bf7\u8d27\u8fd0\u8f66\u53a2"

    aput-object v3, v0, v2

    const/16 v2, 0xb70

    .line 3105
    const-string v3, "2929. swan n.\u5929\u9e45 vi.\u95f2\u8361\uff0c\u6e38\u8361"

    aput-object v3, v0, v2

    const/16 v2, 0xb71

    .line 3106
    const-string v3, "2930. sudden a.\u51fa\u4e4e\u610f\u6599\u7684\uff0c\u7a81\u7136\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb72

    .line 3107
    const-string v3, "2931. maiden n.\u5c11\u5973,\u5904\u5973 a.\u672a\u5a5a\u7684,\u7eaf\u6d01\u7684,\u65e0\u7ecf\u9a8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb73

    .line 3108
    const-string v3, "2932. golden a.\u91d1\u9ec4\u8272\u7684;\u8d35\u91cd\u7684,\u6781\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb74

    .line 3109
    const-string v3, "2933. wooden a.\u6728\u5236\u7684;\u5446\u7b28\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb75

    .line 3110
    const-string v3, "2934. garden n.(\u83dc,\u82b1)\u56ed;\u516c\u56ed"

    aput-object v3, v0, v2

    const/16 v2, 0xb76

    .line 3111
    const-string v3, "2935. harden v.(\u4f7f)\u53d8\u786c"

    aput-object v3, v0, v2

    const/16 v2, 0xb77

    .line 3112
    const-string v3, "2936. burden n.\u62c5\u5b50\uff0c\u91cd\u62c5\uff0c\u8d1f\u62c5 vt.\u7ed9\u4e88\u8d1f\u62c5\u6216\u9ebb\u70e6"

    aput-object v3, v0, v2

    const/16 v2, 0xb78

    .line 3113
    const-string v3, "2937. keen a.\u950b\u5229\u7684;\u654f\u9510\u7684;\u654f\u6377\u7684;(on)\u70ed\u5fc3\u7684,\u6e34\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb79

    .line 3114
    const-string v3, "2938. screen n.\u5c4f\u5e55,\u5c4f\u98ce;\u5e18 v.\u63a9\u853d,\u5305\u5e87;\u7b5b\u9009"

    aput-object v3, v0, v2

    const/16 v2, 0xb7a

    .line 3115
    const-string v3, "2939. green a.\u7eff\u8272\u7684;\u751f\u7684;\u672a\u6210\u719f\u7684 n.\u7eff\u8272;\u852c\u83dc;\u690d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xb7b

    .line 3116
    const-string v3, "2940. nineteen num./a.\u5341\u4e5d pron.\u5341\u4e5d(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xb7c

    .line 3117
    const-string v3, "2941. fifteen num.\u5341\u4e94 pron./a.\u5341\u4e94(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xb7d

    .line 3118
    const-string v3, "2942. eighteen num.\u5341\u516b\uff0c\u5341\u516b\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xb7e

    .line 3119
    const-string v3, "2943. canteen n.(\u5de5\u5382\u3001\u529e\u516c\u5ba4\u7b49)\u98df\u5802\u6216\u5c0f\u5356\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0xb7f

    .line 3120
    const-string v3, "2944. thirteen num./a.\u5341\u4e09 pron.\u5341\u4e09(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xb80

    .line 3121
    const-string v3, "2945. fourteen num.\u5341\u56db\uff0c\u5341\u56db\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xb81

    .line 3122
    const-string v3, "2946. queen n.\u5973\u738b,\u7687\u540e,\u738b\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0xb82

    .line 3123
    const-string v3, "2947. between prep.\u5728\u2026\u4e4b\u95f4\uff0c\u5728(\u4e24\u8005)\u4e4b\u95f4 ad.\u5728\u4e2d\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0xb83

    .line 3124
    const-string v3, "2948. hydrogen n.\u6c22"

    aput-object v3, v0, v2

    const/16 v2, 0xb84

    .line 3125
    const-string v3, "2949. nitrogen n.[\u5316]\u6c2e"

    aput-object v3, v0, v2

    const/16 v2, 0xb85

    .line 3126
    const-string v3, "2950. oxygen n.\u6c27,\u6c27\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0xb86

    .line 3127
    const-string v3, "2951. hen n.\u6bcd\u9e21"

    aput-object v3, v0, v2

    const/16 v2, 0xb87

    .line 3128
    const-string v3, "2952. kitchen n.\u53a8\u623f"

    aput-object v3, v0, v2

    const/16 v2, 0xb88

    .line 3129
    const-string v3, "2953. then ad.\u5f53\u65f6\uff0c\u5728\u90a3\u65f6\uff1b\u7136\u540e\uff0c\u4e8e\u662f\uff1b\u90a3\u4e48\uff0c\u56e0\u800c"

    aput-object v3, v0, v2

    const/16 v2, 0xb89

    .line 3130
    const-string v3, "2954. strengthen v.\u52a0\u5f3a,\u5de9\u56fa"

    aput-object v3, v0, v2

    const/16 v2, 0xb8a

    .line 3131
    const-string v3, "2955. when ad./pron.\u4f55\u65f6\uff1b\u5f53\u65f6 conj.\u90a3\u65f6\uff1b\u7136\u540e\uff1b\u800c"

    aput-object v3, v0, v2

    const/16 v2, 0xb8b

    .line 3132
    const-string v3, "2956. alien n.\u5916\u4fa8\uff0c\u5916\u56fd\u4eba\uff1b\u5916\u661f\u4eba a.\u5916\u56fd\u7684\uff1b\u76f8\u5f02\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb8c

    .line 3133
    const-string v3, "2957. waken v.\u9192,\u5f04\u9192,\u5524\u9192"

    aput-object v3, v0, v2

    const/16 v2, 0xb8d

    .line 3134
    const-string v3, "2958. chicken n.\u9e21\u8089\uff1b\u9e21\uff0c\u5c0f\u9e21\uff0c\u5c0f\u9e1f"

    aput-object v3, v0, v2

    const/16 v2, 0xb8e

    .line 3135
    const-string v3, "2959. token n.\u8868\u793a;\u6807\u5fd7;\u8bb0\u53f7;\u4ee3\u7528\u786c\u5e01 a.\u8c61\u5f81\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb8f

    .line 3136
    const-string v3, "2960. specimen n.\u6807\u672c,\u6837\u672c"

    aput-object v3, v0, v2

    const/16 v2, 0xb90

    .line 3137
    const-string v3, "2961. abdomen n.\u8179\uff0c\u4e0b\u8179(\u80f8\u90e8\u5230\u817f\u90e8\u7684\u90e8\u5206)"

    aput-object v3, v0, v2

    const/16 v2, 0xb91

    .line 3138
    const-string v3, "2962. linen n.\u4e9a\u9ebb\u5e03,\u4e9a\u9ebb\u5e03\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xb92

    .line 3139
    const-string v3, "2963. pen n.\u94a2\u7b14,\u5706\u73e0\u7b14,\u4f5c\u5bb6,\u56f4\u680f vt.\u5199,\u5173\u5165\u680f\u4e2d"

    aput-object v3, v0, v2

    const/16 v2, 0xb93

    .line 3140
    const-string v3, "2964. open n.\u516c\u5f00,\u6237\u5916 a.\u5f00\u7684,\u5f00\u653e\u7684 v.\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0xb94

    .line 3141
    const-string v3, "2965. happen v.(\u5076\u7136)\u53d1\u751f\uff1b\u78b0\u5de7\uff0c\u6070\u597d"

    aput-object v3, v0, v2

    const/16 v2, 0xb95

    .line 3142
    const-string v3, "2966. siren n.\u8b66\u62a5\u58f0,\u8b66\u62a5\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xb96

    .line 3143
    const-string v3, "2967. barren a.\u8d2b\u7620\u7684\uff1b\u4e0d\u80b2\u7684\uff1b(\u690d\u7269)\u4e0d\u7ed3\u679c\u7684\uff1b\u65e0\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xb97

    .line 3144
    const-string v3, "2968. loosen v.\u89e3\u5f00,\u653e\u677e"

    aput-object v3, v0, v2

    const/16 v2, 0xb98

    .line 3145
    const-string v3, "2969. ten num.\u5341 pron./a.\u5341(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xb99

    .line 3146
    const-string v3, "2970. threaten v.\u6050\u5413,\u5a01\u80c1;\u6709\u2026\u5371\u9669,\u5feb\u8981\u6765\u4e34"

    aput-object v3, v0, v2

    const/16 v2, 0xb9a

    .line 3147
    const-string v3, "2971. often ad.\u5e38\u5e38\uff0c\u7ecf\u5e38\uff0c\u901a\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0xb9b

    .line 3148
    const-string v3, "2972. heighten v.\u63d0\u9ad8,\u5347\u9ad8"

    aput-object v3, v0, v2

    const/16 v2, 0xb9c

    .line 3149
    const-string v3, "2973. enlighten v.\u542f\u53d1,\u542f\u8499,\u6559\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0xb9d

    .line 3150
    const-string v3, "2974. frighten v.\u4f7f\u60ca\u6050"

    aput-object v3, v0, v2

    const/16 v2, 0xb9e

    .line 3151
    const-string v3, "2975. kindergarten n.\u5e7c\u513f\u56ed"

    aput-object v3, v0, v2

    const/16 v2, 0xb9f

    .line 3152
    const-string v3, "2976. fasten v.\u624e\u7262,\u4f7f\u56fa\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xba0

    .line 3153
    const-string v3, "2977. listen vi.\u503e\u542c(\u4e0e\u4ecb\u8bcdto\u5e76\u7528\uff0c\u65b9\u53ef\u7f6e\u5bbe\u8bed)"

    aput-object v3, v0, v2

    const/16 v2, 0xba1

    .line 3154
    const-string v3, "2978. rotten a.\u8150\u70c2\u7684,\u8150\u673d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xba2

    .line 3155
    const-string v3, "2979. heaven n.\u5929,\u5929\u7a7a,\u5929\u5802;(Heaven)\u4e0a\u5e1d,\u795e"

    aput-object v3, v0, v2

    const/16 v2, 0xba3

    .line 3156
    const-string v3, "2980. even ad.\u751a\u81f3(\u66f4) a.\u5747\u5300\u7684;\u5e73\u7684;\u76f8\u7b49\u7684\uff1b\u5076\u6570\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xba4

    .line 3157
    const-string v3, "2981. eleven num.\u5341\u4e00 pron./a.\u5341\u4e00(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xba5

    .line 3158
    const-string v3, "2982. seven num.\u4e03\uff0c\u4e03\u4e2a(\u4eba\u6216\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xba6

    .line 3159
    const-string v3, "2983. oven n.\u7089,\u7076,\u7076\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0xba7

    .line 3160
    const-string v3, "2984. citizen n.\u516c\u6c11;\u5e02\u6c11,\u5c45\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0xba8

    .line 3161
    const-string v3, "2985. dozen n.\u4e00\u6253,\u5341\u4e8c\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xba9

    .line 3162
    const-string v3, "2986. campaign n.\u6218\u5f79;\u8fd0\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xbaa

    .line 3163
    const-string v3, "2987. reign n./v.\u7edf\u6cbb,\u652f\u914d,\u76db\u884c n.\u7edf\u6cbb\u65f6\u671f v.\u5360\u4f18\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0xbab

    .line 3164
    const-string v3, "2988. sovereign a.\u72ec\u7acb\u7684\uff0c\u6709\u4e3b\u6743\u7684 n.\u541b\u4e3b\uff0c\u56fd\u738b\uff0c\u7edf\u6cbb\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xbac

    .line 3165
    const-string v3, "2989. foreign a.\u5916\u56fd\u7684,(to)\u65e0\u5173\u7684;\u5916\u6765\u7684;\u5f02\u8d28\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbad

    .line 3166
    const-string v3, "2990. benign a.(\u75c5)\u826f\u6027\u7684,(\u6c14\u5019)\u826f\u597d\u7684,\u4ec1\u6148\u7684,\u548c\u853c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbae

    .line 3167
    const-string v3, "2991. sign n.\u6807\u8bb0,\u62db\u724c;\u5f81\u5146,\u8ff9\u8c61v.\u7b7e\u540d(\u4e8e),\u7f72\u540d(\u4e8e)"

    aput-object v3, v0, v2

    const/16 v2, 0xbaf

    .line 3168
    const-string v3, "2992. design v.\u8bbe\u8ba1;\u6784\u601d;\u7ed8\u5236;\u56fe\u6848;\u4f01\u56fe n.\u8bbe\u8ba1,\u56fe\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0xbb0

    .line 3169
    const-string v3, "2993. resign v.\u8f9e\u53bb,\u8f9e\u804c,\u4f7f\u542c\u4ece(\u4e8e),\u4f7f\u987a\u4ece"

    aput-object v3, v0, v2

    const/16 v2, 0xbb1

    .line 3170
    const-string v3, "2994. assign vt.\u6d3e\u7ed9\uff0c\u5206\u914d\uff1b\u9009\u5b9a\uff0c\u6307\u5b9a(\u65f6\u95f4\u3001\u5730\u70b9\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0xbb2

    .line 3171
    const-string v3, "2995. in prep.\u5728\u2026\u91cc(\u5185\uff0c\u4e0a)\uff1b\u7528\u2026(\u8868\u793a)ad.\u8fdb\uff0c\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0xbb3

    .line 3172
    const-string v3, "2996. gain v.\u83b7\u5f97\uff1b\u589e\u52a0\uff1b\u8868\u7b49\u8d70\u5feb n.\u589e\u8fdb,\u589e\u52a0\uff1b\u6536\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0xbb4

    .line 3173
    const-string v3, "2997. again ad.\u518d\u6b21\uff0c\u53e6\u4e00\u6b21\uff1b\u91cd\u65b0\uff1b\u9664\u6b64\uff0c\u518d\uff0c\u66f4\uff0c\u8fd8"

    aput-object v3, v0, v2

    const/16 v2, 0xbb5

    .line 3174
    const-string v3, "2998. bargain n.\u5ec9\u4ef7\u8d27;\u4ea4\u6613,\u5951\u7ea6,\u5408\u540c v.\u8bae\u4ef7,\u6210\u4ea4"

    aput-object v3, v0, v2

    const/16 v2, 0xbb6

    .line 3175
    const-string v3, "2999. chain n.\u94fe(\u6761);(pl.)\u9563\u94d0;\u4e00\u8fde\u4e32 v.\u7528\u94fe\u6761\u62f4\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0xbb7

    .line 3176
    const-string v3, "3000. porcelain n.\u74f7\u5668 a.\u7cbe\u5236\u7684,\u74f7\u5668\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbb8

    .line 3177
    const-string v3, "3001. plain a.\u660e\u767d\u7684;\u6734\u7d20\u7684;\u5766\u7387;\u5e73\u51e1 n.\u5e73\u539f,\u65f7\u91ce"

    aput-object v3, v0, v2

    const/16 v2, 0xbb9

    .line 3178
    const-string v3, "3002. complain v.(about,of)\u62b1\u6028;\u7533\u8bc9"

    aput-object v3, v0, v2

    const/16 v2, 0xbba

    .line 3179
    const-string v3, "3003. explain v.\u89e3\u91ca,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xbbb

    .line 3180
    const-string v3, "3004. main a.\u4e3b\u8981\u7684,\u603b\u7684 n.\u603b\u7ba1\u9053;\u5e72\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0xbbc

    .line 3181
    const-string v3, "3005. remain v.\u5269\u4e0b,\u4f59\u7559;\u7559\u5f85,\u5c1a\u987b;\u4ecd\u7136\u662f,\u4f9d\u65e7\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0xbbd

    .line 3182
    const-string v3, "3006. domain n.(\u6d3b\u52a8,\u601d\u60f3\u7b49)\u9886\u57df,\u8303\u56f4;\u9886\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xbbe

    .line 3183
    const-string v3, "3007. pain n.\u75db,\u75db\u82e6;(pl.)\u52aa\u529b,\u52b3\u82e6 vt.\u4f7f\u75db\u82e6"

    aput-object v3, v0, v2

    const/16 v2, 0xbbf

    .line 3184
    const-string v3, "3008. rain n.\u96e8\uff1b\u96e8\u5929\uff1b\u4e0b\u96e8 vi.\u4e0b\u96e8 vt.\u4f7f\u5927\u91cf\u843d\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0xbc0

    .line 3185
    const-string v3, "3009. brain n.(\u5927)\u8111,\u9aa8\u9ad3;(pl.)\u8111\u529b,\u667a\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0xbc1

    .line 3186
    const-string v3, "3010. drain n.\u6392\u6c34\u6c9f,\u9634\u6c9f;\u6d88\u8017,\u8d1f\u62c5 v.\u6392\u53bb,\u653e\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0xbc2

    .line 3187
    const-string v3, "3011. refrain v.\u8282\u5236,\u907f\u514d,\u5236\u6b62 n.(\u8bd7\u7684)\u53e0\u53e5"

    aput-object v3, v0, v2

    const/16 v2, 0xbc3

    .line 3188
    const-string v3, "3012. grain n.\u8c37\u7269,\u8c37\u7c7b;\u9897\u7c92,\u7ec6\u7c92"

    aput-object v3, v0, v2

    const/16 v2, 0xbc4

    .line 3189
    const-string v3, "3013. train n.\u5217\u8f66;\u884c\u5217,\u7cfb\u5217,\u4e00\u4e32 v.\u8bad\u7ec3,\u57f9\u517b"

    aput-object v3, v0, v2

    const/16 v2, 0xbc5

    .line 3190
    const-string v3, "3014. strain v.\u62c9\u7d27;\u7d27\u5f20;\u626d\u4f24;\u7aed\u5c3d\u5168\u529b n.\u62c9\u7d27;\u8d1f\u62c5"

    aput-object v3, v0, v2

    const/16 v2, 0xbc6

    .line 3191
    const-string v3, "3015. restrain v.(from)\u6291\u5236,\u5236\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0xbc7

    .line 3192
    const-string v3, "3016. constrain vt.\u9650\u5236\uff0c\u7ea6\u675f\uff1b\u514b\u5236\uff0c\u6291\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xbc8

    .line 3193
    const-string v3, "3017. obtain v.\u83b7\u5f97,\u5f97\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0xbc9

    .line 3194
    const-string v3, "3018. detain v.\u803d\u6401;\u6263\u62bc,\u62d8\u7559"

    aput-object v3, v0, v2

    const/16 v2, 0xbca

    .line 3195
    const-string v3, "3019. retain v.\u4fdd\u6301,\u4fdd\u7559"

    aput-object v3, v0, v2

    const/16 v2, 0xbcb

    .line 3196
    const-string v3, "3020. maintain v.\u7ef4\u4fee,\u4fdd\u517b,\u7ef4\u6301,\u4f9b\u517b,\u575a\u6301,\u4e3b\u5f20,\u652f\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0xbcc

    .line 3197
    const-string v3, "3021. contain v.\u5305\u542b\uff0c\u5bb9\u7eb3\uff1b\u5bb9\u5fcd\uff0c\u6291\u5236\uff1b\u53ef\u88ab...\u9664\u5c3d"

    aput-object v3, v0, v2

    const/16 v2, 0xbcd

    .line 3198
    const-string v3, "3022. fountain n.\u6cc9\u6c34,\u55b7\u6cc9,\u6e90\u6cc9"

    aput-object v3, v0, v2

    const/16 v2, 0xbce

    .line 3199
    const-string v3, "3023. "

    aput-object v3, v0, v2

    const/16 v2, 0xbcf

    .line 3200
    const-string v3, "3024. "

    aput-object v3, v0, v2

    const/16 v2, 0xbd0

    .line 3201
    const-string v3, "3025. mountain n.\u5c71"

    aput-object v3, v0, v2

    const/16 v2, 0xbd1

    .line 3202
    const-string v3, "3026. captain n.\u9996\u9886,\u961f\u957f;\u8239\u957f;\u4e0a\u5c09 v.\u505a\u2026\u7684\u9996\u9886,\u6307\u6325"

    aput-object v3, v0, v2

    const/16 v2, 0xbd2

    .line 3203
    const-string v3, "3027. certain a.\u67d0,\u67d0\u4e00,\u67d0\u4e9b;(of)\u4e00\u5b9a\u7684,\u786e\u4fe1\u7684,\u53ef\u9760\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbd3

    .line 3204
    const-string v3, "3028. ascertain vt.\u786e\u5b9a\uff0c\u67e5\u660e\uff0c\u5f04\u6e05"

    aput-object v3, v0, v2

    const/16 v2, 0xbd4

    .line 3205
    const-string v3, "3029. entertain v.\u62db\u5f85,\u6b3e\u5f85;\u4f7f\u5a31\u4e50;\u4f7f\u6b22\u4e50;\u5bb9\u7eb3,\u63a5\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0xbd5

    .line 3206
    const-string v3, "3030. curtain n.\u7a97\u5e18,\u95e8\u5e18;\u5e55(\u5e03);\u7ed3\u675f\uff1b vt\u906e\u63a9"

    aput-object v3, v0, v2

    const/16 v2, 0xbd6

    .line 3207
    const-string v3, "3031. stain n.\u6c61\u70b9,\u7455\u75b5 v.\u6cbe\u6c61;\u67d3\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0xbd7

    .line 3208
    const-string v3, "3032. sustain vt.\u652f\u6491,\u6491\u4f4f;\u7ef4\u6301,\u6301\u7eed,\u7ecf\u53d7,\u5fcd\u8010"

    aput-object v3, v0, v2

    const/16 v2, 0xbd8

    .line 3209
    const-string v3, "3033. attain vt.\u8fbe\u5230\uff1b\u5b8c\u6210\uff1b\u83b7\u5f97 vi.\u8fbe\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0xbd9

    .line 3210
    const-string v3, "3034. vain a.\u5f92\u52b3\u7684,\u5f92\u7136\u7684;\u81ea\u8d1f\u7684,\u7231\u865a\u8363\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbda

    .line 3211
    const-string v3, "3035. bin n.(\u8d2e\u85cf\u98df\u7269\u7b49\u7528\u7684)\u7bb1\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xbdb

    .line 3212
    const-string v3, "3036. cabin n.\u5ba2\u8231,\u673a\u8231;\u5c0f(\u6728)\u5c4b"

    aput-object v3, v0, v2

    const/16 v2, 0xbdc

    .line 3213
    const-string v3, "3037. rein n.\u7f30\u7ef3,\u7edf\u6cbb,\u652f\u914d v.\u9a7e\u9a6d,\u63a7\u5236,\u7edf\u6cbb"

    aput-object v3, v0, v2

    const/16 v2, 0xbdd

    .line 3214
    const-string v3, "3038. protein n.\u86cb\u767d\u8d28"

    aput-object v3, v0, v2

    const/16 v2, 0xbde

    .line 3215
    const-string v3, "3039. vein n.\u8840\u7ba1;\u9759\u8109;\u53f6\u8109;\u7eb9\u7406;\u60c5\u7eea vt.\u4f7f\u6210\u8109\u7edc"

    aput-object v3, v0, v2

    const/16 v2, 0xbdf

    .line 3216
    const-string v3, "3040. begin v.(began,begun)\u5f00\u59cb\uff0c\u7740\u624b"

    aput-object v3, v0, v2

    const/16 v2, 0xbe0

    .line 3217
    const-string v3, "3041. origin n.\u8d77\u6e90,\u7531\u6765;\u51fa\u8eab,\u6765\u5386"

    aput-object v3, v0, v2

    const/16 v2, 0xbe1

    .line 3218
    const-string v3, "3042. margin n.\u9875\u8fb9\u7a7a\u767d;\u8fb9\u7f18;\u4f59\u5730;\u5e45\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0xbe2

    .line 3219
    const-string v3, "3043. virgin n.\u5904\u5973 a.\u5904\u5973\u7684;\u7eaf\u6d01\u7684;\u539f\u59cb\u7684;\u672a\u4f7f\u7528\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbe3

    .line 3220
    const-string v3, "3044. chin n.\u4e0b\u5df4,\u988f"

    aput-object v3, v0, v2

    const/16 v2, 0xbe4

    .line 3221
    const-string v3, "3045. thin a.\u8584\u7684,\u7ec6\u7684;\u7a00\u8584\u7684,\u6de1\u7684;\u7626\u7684 v.\u53d8\u8584;\u53d8\u7a00"

    aput-object v3, v0, v2

    const/16 v2, 0xbe5

    .line 3222
    const-string v3, "3046. within prep.\u5728\u2026\u91cc\u9762,\u5728\u2026\u4ee5\u5185 ad.\u5728\u5185"

    aput-object v3, v0, v2

    const/16 v2, 0xbe6

    .line 3223
    const-string v3, "3047. kin n.\u5bb6\u65cf,\u4eb2\u5c5e,\u8840\u7f18\u5173\u7cfb a.\u4eb2\u5c5e\u5173\u7cfb\u7684,\u540c\u7c7b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbe7

    .line 3224
    const-string v3, "3048. napkin n.\u9910\u5dfe,\u9910\u5dfe\u7eb8,<\u82f1>\u5c3f\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0xbe8

    .line 3225
    const-string v3, "3049. skin n.\u76ae,\u76ae\u80a4;\u517d\u76ae,\u76ae\u6bdb;\u5916\u76ae,\u5916\u58f3 v.\u5265\u76ae"

    aput-object v3, v0, v2

    const/16 v2, 0xbe9

    .line 3226
    const-string v3, "3050. violin n.\u5c0f\u63d0\u7434"

    aput-object v3, v0, v2

    const/16 v2, 0xbea

    .line 3227
    const-string v3, "3051. vitamin n.\u7ef4\u751f\u7d20"

    aput-object v3, v0, v2

    const/16 v2, 0xbeb

    .line 3228
    const-string v3, "3052. coin n.\u786c\u5e01,\u8d27\u5e01 v.\u94f8\u9020(\u786c\u5e01),\u521b\u9020(\u65b0\u8bcd)"

    aput-object v3, v0, v2

    const/16 v2, 0xbec

    .line 3229
    const-string v3, "3053. join v.\u53c2\u52a0\uff0c\u52a0\u5165\uff1b\u8054\u5408\uff0c\u8fde\u63a5\uff1b\u548c\u2026\u5728\u4e00\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xbed

    .line 3230
    const-string v3, "3054. adjoin v.\u4e34\u8fd1\uff0c\u9760\u8fd1\uff1b\u8d34\u8fd1\uff0c\u6bd7\u8fde"

    aput-object v3, v0, v2

    const/16 v2, 0xbee

    .line 3231
    const-string v3, "3055. heroin n.\u6d77\u6d1b\u56e0"

    aput-object v3, v0, v2

    const/16 v2, 0xbef

    .line 3232
    const-string v3, "3056. pin n.\u9489;\u5927\u5934\u9488,\u522b\u9488,\u5fbd\u7ae0 v.(up)\u9489\u4f4f,\u522b\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0xbf0

    .line 3233
    const-string v3, "3057. spin v.\u65cb\u8f6c;\u7eba\u7eb1;\u7ec7\u7f51,\u5410\u4e1d n.\u65cb\u8f6c;\u81ea\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0xbf1

    .line 3234
    const-string v3, "3058. grin n./vi.\u9732\u9f7f\u800c\u7b11\uff0c\u54a7\u5634\u4e00\u7b11"

    aput-object v3, v0, v2

    const/16 v2, 0xbf2

    .line 3235
    const-string v3, "3059. sin n.\u7f6a,\u7f6a\u6076 v.\u72af\u7f6a"

    aput-object v3, v0, v2

    const/16 v2, 0xbf3

    .line 3236
    const-string v3, "3060. basin n.\u76c6,\u8138\u76c6;\u5185\u6d77,\u76c6\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xbf4

    .line 3237
    const-string v3, "3061. cousin n.\u5802(\u6216\u8868)\u5144\u5f1f,\u5802(\u6216\u8868)\u59d0\u59b9"

    aput-object v3, v0, v2

    const/16 v2, 0xbf5

    .line 3238
    const-string v3, "3062. tin n.\u7f50\u5934\uff1b\u9521 a.\u9521\u5236\u7684 vt.\u9540\u9521\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xbf6

    .line 3239
    const-string v3, "3063. Latin a.\u62c9\u4e01\u7684,\u62c9\u4e01\u6587\u7684 n.\u62c9\u4e01\u8bed"

    aput-object v3, v0, v2

    const/16 v2, 0xbf7

    .line 3240
    const-string v3, "3064. bulletin n.\u516c\u62a5,\u516c\u544a,\u544a\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0xbf8

    .line 3241
    const-string v3, "3065. ruin v.\u6bc1\u706d;(\u4f7f)\u7834\u4ea7 n.\u6bc1\u706d,\u5d29\u6e83;(pl.)\u5e9f\u589f"

    aput-object v3, v0, v2

    const/16 v2, 0xbf9

    .line 3242
    const-string v3, "3066. win vi.\u83b7\u80dc\uff0c\u8d62 vt.\u8d62\u5f97\uff1b\u5728\u2026\u4e2d\u83b7\u80dc n.\u80dc\u5229"

    aput-object v3, v0, v2

    const/16 v2, 0xbfa

    .line 3243
    const-string v3, "3067. twin a.\u53cc\u7684,\u6210\u5bf9\u7684,\u5b6a\u751f\u7684 n.\u5b6a\u751f\u5b50,\u53cc\u751f\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xbfb

    .line 3244
    const-string v3, "3068. damn int.\u8be5\u6b7b vt.\u9063\u8d23\uff1b\u4f7f\u5931\u8d25 a.\u5341\u8db3\u7684 ad.\u6781"

    aput-object v3, v0, v2

    const/16 v2, 0xbfc

    .line 3245
    const-string v3, "3069. condemn v.\u8c34\u8d23,\u6307\u8d23;\u5224\u5211,\u5ba3\u544a\u6709\u7f6a"

    aput-object v3, v0, v2

    const/16 v2, 0xbfd

    .line 3246
    const-string v3, "3070. solemn a.\u5e84\u4e25\u7684,\u9686\u91cd\u7684;\u4e25\u8083\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xbfe

    .line 3247
    const-string v3, "3071. column n.\u5706\u67f1,\u67f1\u72b6\u7269;\u5217;(\u62a5\u520a\u4e2d\u7684)\u4e13\u680f"

    aput-object v3, v0, v2

    const/16 v2, 0xbff

    .line 3248
    const-string v3, "3072. autumn n.\u79cb\uff0c\u79cb\u5b63\uff1b\u6210\u719f\u671f\uff0c\u6e10\u8870\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0xc00

    .line 3249
    const-string v3, "3073. inn n.\u5c0f\u65c5\u9986,\u5ba2\u6808"

    aput-object v3, v0, v2

    const/16 v2, 0xc01

    .line 3250
    const-string v3, "3074. on a.\u8fde\u63a5\u4e0a prep.\u5728\u2026\u4e0a\uff1b\u9760\u8fd1 ad.\u5411\u524d\uff0c\u7ee7\u7eed"

    aput-object v3, v0, v2

    const/16 v2, 0xc02

    .line 3251
    const-string v3, "3075. ribbon n.\u7f0e\u5e26,\u4e1d\u5e26,\u5e26,\u5e26\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xc03

    .line 3252
    const-string v3, "3076. carbon n.\u78b3"

    aput-object v3, v0, v2

    const/16 v2, 0xc04

    .line 3253
    const-string v3, "3077. bacon n.\u54b8\u732a\u8089,\u718f\u732a\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0xc05

    .line 3254
    const-string v3, "3078. silicon n.\u7845"

    aput-object v3, v0, v2

    const/16 v2, 0xc06

    .line 3255
    const-string v3, "3079. abandon vt.\u79bb\u5f03\uff0c\u4e22\u5f03\uff1b\u9057\u5f03\uff0c\u629b\u5f03\uff1b\u653e\u5f03"

    aput-object v3, v0, v2

    const/16 v2, 0xc07

    .line 3256
    const-string v3, "3080. pardon n.\u539f\u8c05,\u5bbd\u6055;\u8bf7\u518d\u8bf4\u4e00\u904d v.\u539f\u8c05,\u9976\u6055,\u8d66\u514d"

    aput-object v3, v0, v2

    const/16 v2, 0xc08

    .line 3257
    const-string v3, "3081. pigeon n.\u9e3d"

    aput-object v3, v0, v2

    const/16 v2, 0xc09

    .line 3258
    const-string v3, "3082. surgeon n.\u5916\u79d1\u533b\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xc0a

    .line 3259
    const-string v3, "3083. dragon n.\u9f99"

    aput-object v3, v0, v2

    const/16 v2, 0xc0b

    .line 3260
    const-string v3, "3084. wagon n.\u8fd0\u8d27\u9a6c\u8f66,\u8fd0\u8d27\u8f66;\u655e\u84ec\u8f66\u53a2"

    aput-object v3, v0, v2

    const/16 v2, 0xc0c

    .line 3261
    const-string v3, "3085. jargon n.\u884c\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0xc0d

    .line 3262
    const-string v3, "3086. suspicion n.\u6000\u7591\uff0c\u731c\u7591\uff1b\u4e00\u70b9\u513f\uff0c\u5c11\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xc0e

    .line 3263
    const-string v3, "3087. region n.\u5730\u533a,\u5730\u5e26,\u884c\u653f\u533a,(\u79d1\u5b66\u7b49)\u9886\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0xc0f

    .line 3264
    const-string v3, "3088. religion n.\u5b97\u6559,\u4fe1\u4ef0"

    aput-object v3, v0, v2

    const/16 v2, 0xc10

    .line 3265
    const-string v3, "3089. fashion n.\u6d41\u884c\u5f0f\u6837(\u6216\u8d27\u54c1),\u98ce\u5c1a,\u98ce\u6c14;\u6837\u5b50,\u65b9\u5f0f"

    aput-object v3, v0, v2

    const/16 v2, 0xc11

    .line 3266
    const-string v3, "3090. cushion n.\u57ab\u5b50,\u8f6f\u57ab vt.\u88c5\u57ab\u5b50;\u7f13\u548c,\u51cf\u8f7b;"

    aput-object v3, v0, v2

    const/16 v2, 0xc12

    .line 3267
    const-string v3, "3091. lion n.\u72ee\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xc13

    .line 3268
    const-string v3, "3092. rebellion n.\u53db\u4e71,\u53cd\u6297,\u8d77\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0xc14

    .line 3269
    const-string v3, "3093. billion num./n.(\u7f8e)\u5341\u4ebf,(\u82f1)\u4e07\u4ebf"

    aput-object v3, v0, v2

    const/16 v2, 0xc15

    .line 3270
    const-string v3, "3094. million num./n.\u767e\u4e07,\u767e\u4e07\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xc16

    .line 3271
    const-string v3, "3095. companion n.\u540c\u4f34,\u5171\u4e8b\u8005;\u4f34\u4fa3"

    aput-object v3, v0, v2

    const/16 v2, 0xc17

    .line 3272
    const-string v3, "3096. opinion n.\u610f\u89c1,\u770b\u6cd5,\u4e3b\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0xc18

    .line 3273
    const-string v3, "3097. onion n.\u6d0b\u8471"

    aput-object v3, v0, v2

    const/16 v2, 0xc19

    .line 3274
    const-string v3, "3098. union n.\u8054\u5408,\u56e2\u7ed3;\u8054\u76df,\u8054\u90a6;\u534f\u4f1a,\u793e\u56e2;\u548c\u8c10"

    aput-object v3, v0, v2

    const/16 v2, 0xc1a

    .line 3275
    const-string v3, "3099. champion n.\u51a0\u519b,\u5f97\u80dc\u8005;\u62e5\u62a4\u8005,\u6597\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0xc1b

    .line 3276
    const-string v3, "3100. criterion n.(pl.criteria\u6216criterions)\u6807\u51c6\uff0c\u5c3a\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0xc1c

    .line 3277
    const-string v3, "3101. occasion n.\u573a\u5408,\u65f6\u8282,\u65f6\u523b;\u65f6\u673a,\u673a\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xc1d

    .line 3278
    const-string v3, "3102. persuasion n.\u8bf4\u670d,\u8bf4\u670d\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xc1e

    .line 3279
    const-string v3, "3103. invasion n.\u5165\u4fb5,\u4fb5\u7565,\u4fb5\u72af"

    aput-object v3, v0, v2

    const/16 v2, 0xc1f

    .line 3280
    const-string v3, "3104. decision n.\u51b3\u5b9a,\u51b3\u5fc3;\u51b3\u8bae;\u51b3\u7b56"

    aput-object v3, v0, v2

    const/16 v2, 0xc20

    .line 3281
    const-string v3, "3105. precision n.\u7cbe\u786e,\u7cbe\u786e\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0xc21

    .line 3282
    const-string v3, "3106. collision n.\u78b0\u649e\uff1b(\u5229\u76ca\uff0c\u610f\u89c1\u7b49\u7684)\u51b2\u7a81\uff0c\u62b5\u89e6"

    aput-object v3, v0, v2

    const/16 v2, 0xc22

    .line 3283
    const-string v3, "3107. vision n.\u89c6\u529b,\u89c6\u89c9;\u8fdc\u89c1;\u6d1e\u5bdf\u529b;\u5e7b\u60f3,\u5e7b\u5f71;\u60f3\u8c61\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xc23

    .line 3284
    const-string v3, "3108. division n.\u5206,\u5206\u5272;\u90e8\u95e8,\u79d1,\u5904;\u9664\u6cd5;\u5206\u754c\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0xc24

    .line 3285
    const-string v3, "3109. provision n.\u4f9b\u5e94,(\u4e00\u6279)\u4f9b\u5e94\u54c1;\u9884\u5907;\u6761\u6b3e;(pl.)\u7ed9\u517b"

    aput-object v3, v0, v2

    const/16 v2, 0xc25

    .line 3286
    const-string v3, "3110. expansion n.\u6269\u5f20,\u81a8\u80c0;\u5f20\u5f00,\u4f38\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0xc26

    .line 3287
    const-string v3, "3111. comprehension a.\u7406\u89e3(\u529b),\u9886\u609f\uff1b\u5305\u542b\uff0c\u5305\u542b\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xc27

    .line 3288
    const-string v3, "3112. dimension n.\u5c3a\u5bf8,\u5c3a\u5ea6;\u7ef4(\u6570),\u5ea6(\u6570)"

    aput-object v3, v0, v2

    const/16 v2, 0xc28

    .line 3289
    const-string v3, "3113. pension n.\u517b\u8001\u91d1,\u5e74\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0xc29

    .line 3290
    const-string v3, "3114. tension n.(\u7d27\u5f20)\u72b6\u6001\uff1b\u62c9(\u7ef7)\u7d27\uff1b\u5f20\u529b\uff0c\u62c9\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xc2a

    .line 3291
    const-string v3, "3115. extension n.\u5ef6\u957f;\u6269\u5927;\u8303\u56f4;\u5927\u5c0f;\u5c3a\u5bf8;\u7535\u8bdd\u5206\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xc2b

    .line 3292
    const-string v3, "3116. explosion n.\u7206\u70b8,\u7206\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0xc2c

    .line 3293
    const-string v3, "3117. erosion n.\u8150\u8680,\u78e8\u635f;\u524a\u5f31,\u51cf\u5c11"

    aput-object v3, v0, v2

    const/16 v2, 0xc2d

    .line 3294
    const-string v3, "3118. version n.\u7248\u672c;\u8bd1\u672c,\u8bd1\u6587;\u8bf4\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0xc2e

    .line 3295
    const-string v3, "3119. diversion n.\u8f6c\u5411,\u8f6c\u79fb;\u7275\u5236;\u89e3\u95f7;\u5a31\u4e50"

    aput-object v3, v0, v2

    const/16 v2, 0xc2f

    .line 3296
    const-string v3, "3120. conversion n.\u8f6c\u53d8\uff0c\u8f6c\u6362\uff1b\u4fe1\u4ef0\u7684\u6539\u53d8\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0xc30

    .line 3297
    const-string v3, "3121. excursion n.\u77ed\u9014\u65c5\u884c,\u6e38\u89c8;\u79bb\u9898;[\u7269\u7406]\u504f\u79fb,\u6f02\u79fb"

    aput-object v3, v0, v2

    const/16 v2, 0xc31

    .line 3298
    const-string v3, "3122. passion n.\u70ed\u60c5,\u6fc0\u60c5,\u7231\u597d;\u6fc0\u6012;\u5f3a\u70c8\u611f\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0xc32

    .line 3299
    const-string v3, "3123. compassion n.\u540c\u60c5\uff1b\u601c\u60af(for)"

    aput-object v3, v0, v2

    const/16 v2, 0xc33

    .line 3300
    const-string v3, "3124. succession n.\u8fde\u7eed,\u7cfb\u5217;\u7ee7\u4efb,\u7ee7\u627f"

    aput-object v3, v0, v2

    const/16 v2, 0xc34

    .line 3301
    const-string v3, "3125. concession n.\u8ba9\u6b65\uff0c\u59a5\u534f\uff1b\u7279\u8bb8(\u6743)\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0xc35

    .line 3302
    const-string v3, "3126. procession n.\u961f\u4f0d,\u884c\u5217"

    aput-object v3, v0, v2

    const/16 v2, 0xc36

    .line 3303
    const-string v3, "3127. profession n.\u804c\u4e1a,\u4e13\u4e1a,\u8868\u767d,\u5ba3\u5e03"

    aput-object v3, v0, v2

    const/16 v2, 0xc37

    .line 3304
    const-string v3, "3128. repression n.\u538b\u6291\uff0c\u538b\u5236\uff0c\u9547\u538b"

    aput-object v3, v0, v2

    const/16 v2, 0xc38

    .line 3305
    const-string v3, "3129. impression n.\u5370\u8c61,\u611f\u60f3;\u76d6\u5370,\u538b\u75d5"

    aput-object v3, v0, v2

    const/16 v2, 0xc39

    .line 3306
    const-string v3, "3130. expression n.\u8868\u8fbe;\u8868\u60c5;\u58f0\u8c03;\u8154\u8c03;\u69a8\u51fa;\u63aa\u8bcd;\u5f0f;\u7b26\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0xc3a

    .line 3307
    const-string v3, "3131. session n.(\u4e00\u5c4a)\u4f1a\u8bae,\u4e00\u6bb5\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0xc3b

    .line 3308
    const-string v3, "3132. obsession n.\u8ff7\u4f4f, \u56f0\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0xc3c

    .line 3309
    const-string v3, "3133. possession n.\u6301\u6709,\u62e5\u6709;\u6240\u6709\u6743;\u6240\u6709\u7269;(pl.)\u8d22\u4ea7,\u8d22\u5bcc"

    aput-object v3, v0, v2

    const/16 v2, 0xc3d

    .line 3310
    const-string v3, "3134. mission n.\u4f7f\u547d,\u4efb\u52a1;\u4f7f\u56e2,\u4ee3\u8868\u56e2"

    aput-object v3, v0, v2

    const/16 v2, 0xc3e

    .line 3311
    const-string v3, "3135. admission n.\u5141\u8bb8\u8fdb\u5165\uff1b\u627f\u8ba4\uff1b\u5165\u573a\u8d39\uff0c\u5165\u4f1a\u8d39\uff0c\u5165\u573a\u5238"

    aput-object v3, v0, v2

    const/16 v2, 0xc3f

    .line 3312
    const-string v3, "3136. commission n.\u59d4\u5458\u4f1a;\u59d4\u4efb,\u59d4\u6258(\u4e66),\u4ee3\u529e;\u4f63\u91d1,\u624b\u7eed\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0xc40

    .line 3313
    const-string v3, "3137. permission n.\u5141\u8bb8,\u540c\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0xc41

    .line 3314
    const-string v3, "3138. transmission n.\u64ad\u9001,\u53d1\u5c04;\u4f20\u52a8,\u4f20\u9001"

    aput-object v3, v0, v2

    const/16 v2, 0xc42

    .line 3315
    const-string v3, "3139. confusion n.\u56f0\u60d1\uff0c\u7cca\u6d82\uff1b\u6df7\u6dc6\uff1b\u6df7\u4e71\uff0c\u9a9a\u4e71"

    aput-object v3, v0, v2

    const/16 v2, 0xc43

    .line 3316
    const-string v3, "3140. conclusion n.\u7ed3\u8bba\uff0c\u63a8\u8bba\uff1b\u7ed3\u5c3e\uff1b\u7f14\u7ed3\uff0c\u8bae\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xc44

    .line 3317
    const-string v3, "3141. illusion n.\u5e7b\u60f3\uff0c\u9519\u8bef\u7684\u89c2\u5ff5\uff1b\u9519\u89c9\uff0c\u5e7b\u89c9\uff0c\u5047\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0xc45

    .line 3318
    const-string v3, "3142. vacation n.\u4f11\u5047,\u5047\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0xc46

    .line 3319
    const-string v3, "3143. indication n.\u6307\u51fa,\u6307\u793a;\u8868\u660e,\u6697\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0xc47

    .line 3320
    const-string v3, "3144. specification n.\u8be6\u8ff0;(\u5e38pl.)\u89c4\u683c,\u8bf4\u660e\u4e66,\u89c4\u8303"

    aput-object v3, v0, v2

    const/16 v2, 0xc48

    .line 3321
    const-string v3, "3145. qualification n.\u8d44\u683c,\u5408\u683c;\u9650\u5b9a,\u6761\u4ef6;\u5408\u683c\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0xc49

    .line 3322
    const-string v3, "3146. classification n.\u5206\u7c7b,\u5206\u7ea7"

    aput-object v3, v0, v2

    const/16 v2, 0xc4a

    .line 3323
    const-string v3, "3147. identification n.\u8bc6\u522b,\u9274\u522b;\u8bc1\u4ef6;\u8ba4\u540c"

    aput-object v3, v0, v2

    const/16 v2, 0xc4b

    .line 3324
    const-string v3, "3148. publication n.\u51fa\u7248\u7269;\u51fa\u7248,\u53d1\u884c;\u516c\u5e03,\u53d1\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0xc4c

    .line 3325
    const-string v3, "3149. implication n.\u542b\u610f\uff0c\u6697\u793a\uff0c\u6697\u6307\uff1b\u7275\u8fde"

    aput-object v3, v0, v2

    const/16 v2, 0xc4d

    .line 3326
    const-string v3, "3150. complication n.\u590d\u6742,\u7ea0\u7eb7;\u5e76\u53d1\u75c7"

    aput-object v3, v0, v2

    const/16 v2, 0xc4e

    .line 3327
    const-string v3, "3151. application n.\u7533\u8bf7\uff0c\u8bf7\u6c42\uff0c\u7533\u8bf7\u4e66\uff1b\u5e94\u7528\uff0c\u5b9e\u65bd\uff0c\u5b9e\u7528\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0xc4f

    .line 3328
    const-string v3, "3152. communication n.\u901a\u8baf,\u4f20\u8fbe;(pl.)\u901a\u8baf\u7cfb\u7edf;\u4ea4\u901a(\u5de5\u5177)"

    aput-object v3, v0, v2

    const/16 v2, 0xc50

    .line 3329
    const-string v3, "3153. location n.\u4f4d\u7f6e,\u573a\u6240,\u5b9a\u4f4d,\u6d4b\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0xc51

    .line 3330
    const-string v3, "3154. vocation n.\u804c\u4e1a;\u53ec\u5524;\u5929\u547d;\u5929\u804c;\u624d\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0xc52

    .line 3331
    const-string v3, "3155. education n.\u6559\u80b2,\u57f9\u517b,\u8bad\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0xc53

    .line 3332
    const-string v3, "3156. foundation n.\u57fa\u7840,\u6839\u672c,\u5efa\u7acb,\u521b\u7acb;\u5730\u57fa,\u57fa\u91d1,\u57fa\u91d1\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xc54

    .line 3333
    const-string v3, "3157. accommodation n.(accommodations)\u4f4f\u5bbf\uff0c\u7559\u5bbf\uff1b\u81b3\u5bbf\u4f9b\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0xc55

    .line 3334
    const-string v3, "3158. recreation n.\u5a31\u4e50,\u6d88\u9063"

    aput-object v3, v0, v2

    const/16 v2, 0xc56

    .line 3335
    const-string v3, "3159. obligation n.\u4e49\u52a1,\u8d23\u4efb"

    aput-object v3, v0, v2

    const/16 v2, 0xc57

    .line 3336
    const-string v3, "3160. navigation n.\u822a\u6d77,\u822a\u7a7a;\u5bfc\u822a,\u9886\u822a"

    aput-object v3, v0, v2

    const/16 v2, 0xc58

    .line 3337
    const-string v3, "3161. pronunciation n.\u53d1\u97f3,\u53d1\u97f3\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0xc59

    .line 3338
    const-string v3, "3162. association n.\u8054\u76df\uff0c\u534f\u4f1a\uff0c\u793e\u56e2\uff1b\u4ea4\u5f80\uff0c\u8054\u5408\uff1b\u8054\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0xc5a

    .line 3339
    const-string v3, "3163. variation n.\u53d8\u5316,\u53d8\u52a8;\u53d8\u79cd,\u53d8\u5f02"

    aput-object v3, v0, v2

    const/16 v2, 0xc5b

    .line 3340
    const-string v3, "3164. aviation n.\u822a\u7a7a\uff0c\u822a\u7a7a\u5b66\uff1b\u98de\u673a\u5236\u9020\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0xc5c

    .line 3341
    const-string v3, "3165. relation n.\u5173\u7cfb,\u8054\u7cfb;\u4eb2\u5c5e,\u4eb2\u621a"

    aput-object v3, v0, v2

    const/16 v2, 0xc5d

    .line 3342
    const-string v3, "3166. revelation n.\u63ed\u793a,\u63ed\u9732,\u663e\u793a,\u542f\u793a,\u65b0\u53d1\u73b0,\u88ab\u63ed\u9732\u7684\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0xc5e

    .line 3343
    const-string v3, "3167. inflation n.\u901a\u8d27\u81a8\u80c0"

    aput-object v3, v0, v2

    const/16 v2, 0xc5f

    .line 3344
    const-string v3, "3168. installation n.\u5b89\u88c5,\u8bbe\u7f6e;\u88c5\u7f6e,\u8bbe\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0xc60

    .line 3345
    const-string v3, "3169. legislation n.\u6cd5\u5f8b(\u89c4)\uff1b\u7acb\u6cd5\uff0c\u6cd5\u5f8b\u7684\u5236\u5b9a(\u6216\u901a\u8fc7)"

    aput-object v3, v0, v2

    const/16 v2, 0xc61

    .line 3346
    const-string v3, "3170. translation n.\u7ffb\u8bd1;\u8bd1\u6587,\u8bd1\u672c"

    aput-object v3, v0, v2

    const/16 v2, 0xc62

    .line 3347
    const-string v3, "3171. regulation n.\u89c4\u5219,\u89c4\u7ae0;\u8c03\u8282,\u6821\u51c6;\u8c03\u6574"

    aput-object v3, v0, v2

    const/16 v2, 0xc63

    .line 3348
    const-string v3, "3172. population n.\u4eba\u53e3,(\u5168\u4f53)\u5c45\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0xc64

    .line 3349
    const-string v3, "3173. congratulation n.(on)\u795d\u8d3a,(pl.)\u795d\u8d3a\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xc65

    .line 3350
    const-string v3, "3174. automation n.\u81ea\u52a8\uff0c\u81ea\u52a8\u5316\uff0c\u81ea\u52a8\u64cd\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0xc66

    .line 3351
    const-string v3, "3175. formation n.\u5f62\u6210;\u6784\u6210;\u7ec4\u7ec7;\u6784\u9020;\u7f16\u5236;\u5851\u9020"

    aput-object v3, v0, v2

    const/16 v2, 0xc67

    .line 3352
    const-string v3, "3176. information n.\u901a\u77e5,\u62a5\u544a;\u60c5\u62a5,\u8d44\u6599,\u6d88\u606f;\u4fe1\u606f"

    aput-object v3, v0, v2

    const/16 v2, 0xc68

    .line 3353
    const-string v3, "3177. nation n.\u6c11\u65cf,\u56fd\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0xc69

    .line 3354
    const-string v3, "3178. explanation n.\u89e3\u91ca,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xc6a

    .line 3355
    const-string v3, "3179. indignation n.\u6124\u6012,\u6124\u6168"

    aput-object v3, v0, v2

    const/16 v2, 0xc6b

    .line 3356
    const-string v3, "3180. combination n.\u7ed3\u5408\uff0c\u8054\u5408\uff1b\u5316\u5408\uff1b\u56e2\u4f53\uff1b\u7ec4\u5408\u6570\u7801"

    aput-object v3, v0, v2

    const/16 v2, 0xc6c

    .line 3357
    const-string v3, "3181. imagination n.\u60f3\u8c61(\u529b)\uff1b\u7a7a\u60f3\uff0c\u5e7b\u89c9\uff1b\u60f3\u8c61\u51fa\u6765\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xc6d

    .line 3358
    const-string v3, "3182. destination n.\u76ee\u7684\u5730,\u7ec8\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0xc6e

    .line 3359
    const-string v3, "3183. occupation n.\u5360\u9886,\u5360\u636e;\u5360\u7528;\u804c\u4e1a,\u5de5\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0xc6f

    .line 3360
    const-string v3, "3184. declaration n.\u5ba3\u8a00,\u5ba3\u5e03,\u58f0\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xc70

    .line 3361
    const-string v3, "3185. preparation n.\u51c6\u5907,\u9884\u5907;\u5236\u5242,\u5236\u5907\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xc71

    .line 3362
    const-string v3, "3186. federation n.\u540c\u76df;\u8054\u90a6;\u8054\u5408;\u8054\u76df;\u8054\u5408\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xc72

    .line 3363
    const-string v3, "3187. consideration n.\u9700\u8981\u8003\u8651\u7684\u4e8b,\u7406\u7531;\u8003\u8651,\u601d\u8003;\u4f53\u8c05,\u7167\u987e"

    aput-object v3, v0, v2

    const/16 v2, 0xc73

    .line 3364
    const-string v3, "3188. generation n.\u4ea7\u751f,\u53d1\u751f;\u4e00\u4ee3(\u4eba)"

    aput-object v3, v0, v2

    const/16 v2, 0xc74

    .line 3365
    const-string v3, "3189. operation n.\u8fd0\u8f6c,\u5f00\u52a8,\u64cd\u4f5c,\u624b\u672f,\u8fd0\u7b97,\u7ecf\u8425"

    aput-object v3, v0, v2

    const/16 v2, 0xc75

    .line 3366
    const-string v3, "3190. inspiration n.\u7075\u611f;\u9f13\u821e,\u6fc0\u52b1"

    aput-object v3, v0, v2

    const/16 v2, 0xc76

    .line 3367
    const-string v3, "3191. corporation n.\u5e02\u9547\u81ea\u6cbb\u673a\u5173\uff1b\u6cd5\u4eba\uff1b\u516c\u53f8\uff0c\u4f01\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0xc77

    .line 3368
    const-string v3, "3192. concentration n.\u4e13\u5fc3\uff0c\u4e13\u6ce8\uff1b\u96c6\u4e2d\uff0c\u96c6\u7ed3\uff1b\u6d53\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0xc78

    .line 3369
    const-string v3, "3193. administration n.\u7ecf\u8425\uff0c\u7ba1\u7406\uff1b\u884c\u653f\uff0c\u884c\u653f\u673a\u5173\uff0c\u7ba1\u7406\u90e8\u95e8"

    aput-object v3, v0, v2

    const/16 v2, 0xc79

    .line 3370
    const-string v3, "3194. illustration n.\u8bf4\u660e\uff1b\u4f8b\u8bc1\uff0c\u63d2\u56fe\uff1b\u4e3e\u4f8b\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xc7a

    .line 3371
    const-string v3, "3195. duration n.\u6301\u4e45;\u671f\u95f4;\u6301\u7eed\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0xc7b

    .line 3372
    const-string v3, "3196. compensation n.\u8865\u507f(\u6216\u8d54\u507f)\u7684\u6b3e\u7269\uff1b\u8865\u507f\uff0c\u8d54\u507f"

    aput-object v3, v0, v2

    const/16 v2, 0xc7c

    .line 3373
    const-string v3, "3197. sensation n.\u611f\u89c9,\u77e5\u89c9;\u6fc0\u52a8,\u8f70\u52a8,\u8f70\u52a8\u4e00\u65f6\u7684\u4e8b\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0xc7d

    .line 3374
    const-string v3, "3198. conversation n.\u4f1a\u8bdd,\u8c08\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0xc7e

    .line 3375
    const-string v3, "3199. expectation n.\u9884\u671f,\u671f\u671b,\u6307\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0xc7f

    .line 3376
    const-string v3, "3200. dictation n.\u542c\u5199,\u53e3\u8ff0;\u547d\u4ee4"

    aput-object v3, v0, v2

    const/16 v2, 0xc80

    .line 3377
    const-string v3, "3201. vegetation n.\u690d\u7269,\u8349\u6728"

    aput-object v3, v0, v2

    const/16 v2, 0xc81

    .line 3378
    const-string v3, "3202. meditation n.\u719f\u8651;(\u5c24\u6307\u5b97\u6559\u7684)\u9ed8\u60f3,\u6c89\u601d;(pl.)\u51a5\u60f3\u5f55"

    aput-object v3, v0, v2

    const/16 v2, 0xc82

    .line 3379
    const-string v3, "3203. imitation n.\u6a21\u4eff,\u4eff\u6548;\u4eff\u5236;\u4eff\u9020\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xc83

    .line 3380
    const-string v3, "3204. limitation n.\u9650\u5236,\u5c40\u9650\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0xc84

    .line 3381
    const-string v3, "3205. invitation n.\u9080\u8bf7,\u62db\u5f85;\u8bf7\u67ec"

    aput-object v3, v0, v2

    const/16 v2, 0xc85

    .line 3382
    const-string v3, "3206. plantation n.\u79cd\u690d\u56ed"

    aput-object v3, v0, v2

    const/16 v2, 0xc86

    .line 3383
    const-string v3, "3207. orientation n.\u65b9\u5411,\u65b9\u4f4d,\u5b9a\u4f4d,\u503e\u5411\u6027,\u5411\u4e1c\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0xc87

    .line 3384
    const-string v3, "3208. temptation n.\u5f15\u8bf1\uff0c\u8bf1\u60d1\uff1b\u8bf1\u60d1\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xc88

    .line 3385
    const-string v3, "3209. station n.\u8f66\u7ad9;\u6240,\u7ad9,\u5c40;\u8eab\u4efd,\u5730\u4f4d v.\u5b89\u7f6e,\u9a7b\u624e"

    aput-object v3, v0, v2

    const/16 v2, 0xc89

    .line 3386
    const-string v3, "3210. reputation n.\u540d\u8a89,\u540d\u58f0,\u58f0\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0xc8a

    .line 3387
    const-string v3, "3211. equation n.(\u6570\u5b66)\u7b49\u5f0f,\u65b9\u7a0b\u5f0f;(with)\u76f8\u7b49;\u5747\u8861"

    aput-object v3, v0, v2

    const/16 v2, 0xc8b

    .line 3388
    const-string v3, "3212. situation n.\u5f62\u52bf,\u5904\u5883,\u72b6\u51b5;\u4f4d\u7f6e,\u573a\u6240;\u804c\u4f4d,\u804c\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0xc8c

    .line 3389
    const-string v3, "3213. salvation n.\u62ef\u6551,\u6551\u52a9;\u6551\u6d4e(\u8005,\u54c1),\u6551\u52a9\u5de5\u5177;\u6551\u4e16\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0xc8d

    .line 3390
    const-string v3, "3214. innovation n.\u6539\u9769\uff0c\u9769\u65b0\uff1b\u65b0\u89c2\u5ff5\uff0c\u65b0\u65b9\u6cd5\uff0c\u65b0\u53d1\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xc8e

    .line 3391
    const-string v3, "3215. observation n.\u89c2\u5bdf,\u89c2\u6d4b,\u76d1\u89c6;(pl.)\u89c2\u5bdf\u8d44\u6599;\u89c2\u5bdf\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xc8f

    .line 3392
    const-string v3, "3216. reservation n.\u4fdd\u7559,\u4fdd\u7559\u610f\u89c1;\u9884\u5b9a,\u9884\u8ba2"

    aput-object v3, v0, v2

    const/16 v2, 0xc90

    .line 3393
    const-string v3, "3217. conservation n.\u4fdd\u5b58,\u4fdd\u62a4,\u4fdd\u5b88;\u5b88\u6052,\u4e0d\u706d"

    aput-object v3, v0, v2

    const/16 v2, 0xc91

    .line 3394
    const-string v3, "3218. normalization n.(normalisation)\u6b63\u5e38\u5316,\u6807\u51c6\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0xc92

    .line 3395
    const-string v3, "3219. civilization n.(=civilisation)\u6587\u660e,\u6587\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0xc93

    .line 3396
    const-string v3, "3220. organization n.(organization)\u7ec4\u7ec7,\u56e2\u4f53,\u673a\u6784"

    aput-object v3, v0, v2

    const/16 v2, 0xc94

    .line 3397
    const-string v3, "3221. modernization n.(modernisation)\u73b0\u4ee3\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0xc95

    .line 3398
    const-string v3, "3222. action n.\u884c\u52a8\uff0c\u52a8\u4f5c\uff1b\u4f5c\u7528\uff1b\u8fd0\u8f6c\uff1b\u884c\u4e3a\uff1b\u6218\u6597"

    aput-object v3, v0, v2

    const/16 v2, 0xc96

    .line 3399
    const-string v3, "3223. satisfaction n.\u6ee1\u8db3,\u6ee1\u610f;\u4e50\u4e8b,\u6109\u5feb"

    aput-object v3, v0, v2

    const/16 v2, 0xc97

    .line 3400
    const-string v3, "3224. fraction n.\u788e\u7247,\u5c0f\u90e8\u5206,\u4e00\u70b9\u513f;\u5206\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0xc98

    .line 3401
    const-string v3, "3225. transaction n.\u529e\u7406,\u5904\u7406;\u4ea4\u6613,\u4e8b\u52a1;(pl.)\u4f1a\u62a5,\u5b66\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0xc99

    .line 3402
    const-string v3, "3226. affection n.\u7231\uff0c\u559c\u7231\uff1b\u7231\u6155\u4e4b\u60c5\uff1b\u611f\u60c5\uff1b\u75be\u75c5\uff0c\u4e0d\u9002"

    aput-object v3, v0, v2

    const/16 v2, 0xc9a

    .line 3403
    const-string v3, "3227. perfection n.\u5c3d\u5584\u5c3d\u7f8e,\u5b8c\u7f8e"

    aput-object v3, v0, v2

    const/16 v2, 0xc9b

    .line 3404
    const-string v3, "3228. objection n.(to)\u53cd\u5bf9,\u5f02\u8bae,\u4e0d\u559c\u6b22,\u53cd\u5bf9\u7684\u7406\u7531"

    aput-object v3, v0, v2

    const/16 v2, 0xc9c

    .line 3405
    const-string v3, "3229. selection n.\u9009\u62e9,\u6311\u9009;\u9009\u96c6,\u7cbe\u9009\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xc9d

    .line 3406
    const-string v3, "3230. reflection n.(reflexion)\u6620\u50cf,\u5012\u5f71;\u53cd\u7701,\u6c89\u601d"

    aput-object v3, v0, v2

    const/16 v2, 0xc9e

    .line 3407
    const-string v3, "3231. collection n.\u6536\u85cf(\u54c1),\u6536\u96c6(\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xc9f

    .line 3408
    const-string v3, "3232. connection n.(connexion)\u8054\u7cfb,\u8fde\u63a5\uff1b\u4eb2\u621a\uff0c\u793e\u4f1a\u5173\u7cfb"

    aput-object v3, v0, v2

    const/16 v2, 0xca0

    .line 3409
    const-string v3, "3233. direction n.\u65b9\u5411,\u65b9\u4f4d;\u6307\u4ee4,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0xca1

    .line 3410
    const-string v3, "3234. section n.\u7ae0\u8282,\u90e8\u5206;\u5730\u533a,\u90e8\u95e8,\u79d1;\u622a\u9762,\u5256\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0xca2

    .line 3411
    const-string v3, "3235. intersection n.\u76f8\u4ea4\uff0c\u4ea4\u53c9\uff1b\u9053\u8def\u4ea4\u53c9\u53e3\uff0c\u5341\u5b57\u8def\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0xca3

    .line 3412
    const-string v3, "3236. contradiction n.\u53cd\u9a73\uff0c\u5426\u8ba4\uff1b\u77db\u76fe\uff0c\u4e0d\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0xca4

    .line 3413
    const-string v3, "3237. fiction n.\u865a\u6784,\u7f16\u9020;\u5c0f\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0xca5

    .line 3414
    const-string v3, "3238. friction n.\u78e8\u64e6,\u6469\u64e6\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xca6

    .line 3415
    const-string v3, "3239. conviction n.\u6df1\u4fe1,\u786e\u4fe1\uff1b\u5b9a\u7f6a\uff0c\u5224\u7f6a\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0xca7

    .line 3416
    const-string v3, "3240. sanction n./v.\u6279\u51c6,\u540c\u610f,\u652f\u6301,\u8ba4\u53ef n.\u5904\u7f5a,\u5236\u88c1"

    aput-object v3, v0, v2

    const/16 v2, 0xca8

    .line 3417
    const-string v3, "3241. distinction n.\u533a\u522b,\u5dee\u522b;\u7ea7\u522b;\u7279\u6027;\u58f0\u671b;\u663e\u8d6b"

    aput-object v3, v0, v2

    const/16 v2, 0xca9

    .line 3418
    const-string v3, "3242. function n.\u529f\u80fd,\u4f5c\u7528;(pl.)\u804c\u52a1;\u51fd\u6570 v.\u8d77\u4f5c\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0xcaa

    .line 3419
    const-string v3, "3243. junction n.\u8fde\u63a5,\u63a5\u5408,\u4ea4\u53c9\u70b9,\u67a2\u7ebd\u7ad9,\u63a5\u5934,\u4e2d\u7ee7\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0xcab

    .line 3420
    const-string v3, "3244. conjunction n.\u63a5\u5408\uff0c\u8fde\u63a5\uff0c\u8054\u5408\uff1b\u8fde(\u63a5)\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xcac

    .line 3421
    const-string v3, "3245. auction n.\uff0fvt.\u62cd\u5356"

    aput-object v3, v0, v2

    const/16 v2, 0xcad

    .line 3422
    const-string v3, "3246. reduction n.\u51cf\u5c0f,\u51cf\u5c11,\u7f29\u5c0f"

    aput-object v3, v0, v2

    const/16 v2, 0xcae

    .line 3423
    const-string v3, "3247. production n.\u751f\u4ea7,\u4ea7\u54c1,\u4f5c\u54c1,(\u7814\u7a76)\u6210\u679c,\u603b\u4ea7\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xcaf

    .line 3424
    const-string v3, "3248. introduction n.(to)\u4ecb\u7ecd;\u4f20\u5165,\u5f15\u8fdb;\u5bfc\u8a00,\u5bfc\u8bba,\u7eea\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0xcb0

    .line 3425
    const-string v3, "3249. obstruction n.\u59a8\u788d,\u969c\u788d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xcb1

    .line 3426
    const-string v3, "3250. destruction n.\u6bc1\u574f\uff0c\u6bc1\u706d(\u7684\u539f\u56e0)"

    aput-object v3, v0, v2

    const/16 v2, 0xcb2

    .line 3427
    const-string v3, "3251. instruction n.\u6559\u6388;\u6307\u5bfc;(pl.)\u7528\u6cd5\u8bf4\u660e(\u4e66),\u64cd\u4f5c\u6307\u5357"

    aput-object v3, v0, v2

    const/16 v2, 0xcb3

    .line 3428
    const-string v3, "3252. construction n.\u5efa\u9020\uff0c\u6784\u9020\uff1b\u5efa\u7b51\u7269\uff0c\u7ed3\u6784\uff1b\u91ca\u4e49\uff0c\u89e3\u91ca"

    aput-object v3, v0, v2

    const/16 v2, 0xcb4

    .line 3429
    const-string v3, "3253. exhibition n.\u5c55\u89c8\u4f1a;\u9648\u5217,\u5c55\u89c8"

    aput-object v3, v0, v2

    const/16 v2, 0xcb5

    .line 3430
    const-string v3, "3254. ambition n.\u5bf9(\u6210\u529f\u3001\u6743\u529b\u7b49)\u7684\u5f3a\u70c8\u6b32\u671b\uff0c\u91ce\u5fc3\uff1b\u96c4\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0xcb6

    .line 3431
    const-string v3, "3255. tradition n.\u4f20\u7edf\uff1b \u60ef\u4f8b\uff1b \u4f20\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0xcb7

    .line 3432
    const-string v3, "3256. addition n.\u52a0\uff0c\u52a0\u6cd5\uff1b\u9644\u52a0\u90e8\u5206\uff0c\u589e\u52a0(\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xcb8

    .line 3433
    const-string v3, "3257. edition n.\u7248,\u7248\u672c,\u7248\u6b21"

    aput-object v3, v0, v2

    const/16 v2, 0xcb9

    .line 3434
    const-string v3, "3258. expedition n.\u8fdc\u5f81(\u961f),\u63a2\u9669(\u961f)"

    aput-object v3, v0, v2

    const/16 v2, 0xcba

    .line 3435
    const-string v3, "3259. condition n.\u6761\u4ef6\uff0c\u72b6\u51b5\uff0c\u73af\u5883 vt.\u51b3\u5b9a\uff1b\u652f\u914d\uff1b\u8bad\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0xcbb

    .line 3436
    const-string v3, "3260. coalition n.\u7ed3\u5408\u4f53\uff0c\u540c\u76df\uff1b\u7ed3\u5408\uff0c\u8054\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0xcbc

    .line 3437
    const-string v3, "3261. recognition n.\u8ba4\u51fa,\u8fa8\u8ba4;\u627f\u8ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xcbd

    .line 3438
    const-string v3, "3262. definition n.\u5b9a\u4e49,\u89e3\u91ca;(\u8f6e\u5ed3\u5f71\u50cf\u7b49\u7684)\u6e05\u6670\u5ea6;\u9610\u660e;"

    aput-object v3, v0, v2

    const/16 v2, 0xcbe

    .line 3439
    const-string v3, "3263. nutrition n.\u8425\u517b,\u8425\u517b\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0xcbf

    .line 3440
    const-string v3, "3264. acquisition n.\u53d6\u5f97\uff0c\u5b66\u5230\uff0c\u517b\u6210(\u4e60\u60ef)\uff1b\u83b7\u5f97\u7684\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0xcc0

    .line 3441
    const-string v3, "3265. transition n.\u8f6c\u53d8\uff0c\u53d8\u8fc1\uff0c\u8fc7\u6e21(\u65f6\u671f)"

    aput-object v3, v0, v2

    const/16 v2, 0xcc1

    .line 3442
    const-string v3, "3266. position n.\u4f4d\u7f6e;\u804c\u4f4d;\u59ff\u52bf,\u59ff\u6001;\u89c1\u89e3,\u7acb\u573a,\u5f62\u52bf"

    aput-object v3, v0, v2

    const/16 v2, 0xcc2

    .line 3443
    const-string v3, "3267. preposition n.\u4ecb\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xcc3

    .line 3444
    const-string v3, "3268. composition n.\u4f5c\u54c1,\u4f5c\u6587,\u4e50\u66f2;\u4f5c\u66f2;\u7ed3\u6784,\u7ec4\u6210,\u6210\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0xcc4

    .line 3445
    const-string v3, "3269. proposition n.\u4e3b\u5f20,\u5efa\u8bae;\u9648\u8ff0,\u547d\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0xcc5

    .line 3446
    const-string v3, "3270. disposition n.\u6392\u5217,\u90e8\u7f72;\u6027\u683c\u503e\u5411;\u503e\u5411,\u610f\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0xcc6

    .line 3447
    const-string v3, "3271. petition n.\u8bf7\u613f\u4e66,\u7533\u8bf7\u4e66 v.(\u5411\u2026)\u8bf7\u613f,\u6b63\u5f0f\u8bf7\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0xcc7

    .line 3448
    const-string v3, "3272. repetition n.\u91cd\u590d,\u53cd\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0xcc8

    .line 3449
    const-string v3, "3273. competition n.\u7ade\u4e89\uff0c\u6bd4\u8d5b\uff1b\u89d2\u9010\uff0c\u8f83\u91cf\uff1b[\u603b\u79f0]\u7ade\u4e89\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xcc9

    .line 3450
    const-string v3, "3274. superstition n.\u8ff7\u4fe1\uff0c\u8ff7\u4fe1\u7684\u89c2\u5ff5\u4e60\u4fd7"

    aput-object v3, v0, v2

    const/16 v2, 0xcca

    .line 3451
    const-string v3, "3275. "

    aput-object v3, v0, v2

    const/16 v2, 0xccb

    .line 3452
    const-string v3, "3276. "

    aput-object v3, v0, v2

    const/16 v2, 0xccc

    .line 3453
    const-string v3, "3277. tuition n.\u5b66\u8d39\uff1b(\u67d0\u4e00\u5b66\u79d1\u7684)\u6559\u5b66\uff0c\u8bb2\u6388\uff0c\u6307\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0xccd

    .line 3454
    const-string v3, "3278. intuition n.\u76f4\u89c9\uff0c\u76f4\u89c2\uff1b\u51ed\u76f4\u89c9\u800c\u77e5\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xcce

    .line 3455
    const-string v3, "3279. mention v./n.\u63d0\u53ca,\u8bf4\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xccf

    .line 3456
    const-string v3, "3280. retention n.\u4fdd\u7559,\u4fdd\u6301,\u4fdd\u6301\u529b,\u8bb0\u5fc6\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xcd0

    .line 3457
    const-string v3, "3281. intention n.\u610f\u56fe,\u610f\u5411,\u76ee\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xcd1

    .line 3458
    const-string v3, "3282. attention n.\u6ce8\u610f\uff0c\u6ce8\u610f\u529b\uff1b\u7acb\u6b63\uff1b\u7279\u522b\u7167\u987e\uff1b\u7167\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xcd2

    .line 3459
    const-string v3, "3283. invention n.\u53d1\u660e,\u521b\u9020,\u53d1\u660e\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xcd3

    .line 3460
    const-string v3, "3284. convention n.\u5927\u4f1a,\u4f1a\u8bae;\u60ef\u4f8b,\u5e38\u89c4,\u4e60\u4fd7;\u516c\u7ea6,\u534f\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0xcd4

    .line 3461
    const-string v3, "3285. motion n.\u8fd0\u52a8,\u52a8;\u63d0\u8bae,\u52a8\u8bae v.\u63d0\u8bae,\u52a8\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0xcd5

    .line 3462
    const-string v3, "3286. emotion n.\u60c5\u7eea,\u60c5\u611f,\u611f\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0xcd6

    .line 3463
    const-string v3, "3287. notion n.\u6982\u5ff5,\u60f3\u6cd5,\u610f\u5ff5,\u770b\u6cd5,\u89c2\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0xcd7

    .line 3464
    const-string v3, "3288. reception n.\u63a5\u5f85,\u62db\u5f85\u4f1a;\u63a5\u6536,\u63a5\u53d7,\u63a5\u6536\u6548\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0xcd8

    .line 3465
    const-string v3, "3289. exception n.\u4f8b\u5916,\u9664\u5916;\u53cd\u5bf9;\u5f02\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0xcd9

    .line 3466
    const-string v3, "3290. description n.\u63cf\u5199,\u5f62\u5bb9;\u79cd\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0xcda

    .line 3467
    const-string v3, "3291. prescription n.\u836f\u65b9,\u5904\u65b9"

    aput-object v3, v0, v2

    const/16 v2, 0xcdb

    .line 3468
    const-string v3, "3292. consumption n.\u6d88\u8d39(\u91cf),\u6d88\u8017"

    aput-object v3, v0, v2

    const/16 v2, 0xcdc

    .line 3469
    const-string v3, "3293. assumption n.\u5047\u5b9a\uff0c\u8bbe\u60f3\uff1b\u91c7\u53d6\uff1b\u627f\u62c5\uff1b\u63a8\u6d4b\uff1b\u5047\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0xcdd

    .line 3470
    const-string v3, "3294. option n.\u9009\u62e9(\u6743),[\u5546]\u9009\u62e9\u4e70\u5356\u7684\u7279\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0xcde

    .line 3471
    const-string v3, "3295. portion n.\u4e00\u90e8\u5206,\u4e00\u4efd"

    aput-object v3, v0, v2

    const/16 v2, 0xcdf

    .line 3472
    const-string v3, "3296. proportion n.\u6bd4\u4f8b;\u90e8\u5206;\u5747\u8861,\u76f8\u79f0"

    aput-object v3, v0, v2

    const/16 v2, 0xce0

    .line 3473
    const-string v3, "3297. suggestion n.\u5efa\u8bae\uff0c\u610f\u89c1\uff1b\u7ec6\u5fae\u7684\u8ff9\u8c61\uff1b\u6697\u793a\uff0c\u8054\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0xce1

    .line 3474
    const-string v3, "3298. question n.\u95ee\u9898;\u8be2\u95ee v.\u8be2\u95ee;\u6000\u7591,\u5bf9\u2026\u8868\u793a\u7591\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0xce2

    .line 3475
    const-string v3, "3299. caution n.\u8c28\u614e\uff1b\u6ce8\u610f(\u4e8b\u9879)\uff0c\u8b66\u544avt.\u529d\u2026\u5c0f\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0xce3

    .line 3476
    const-string v3, "3300. precaution n.\u9884\u9632,\u8c28\u614e,\u8b66\u60d5"

    aput-object v3, v0, v2

    const/16 v2, 0xce4

    .line 3477
    const-string v3, "3301. contribution n.\u8d21\u732e\uff1b\u6350\u6b3e\uff0c\u6350\u732e\u7269\uff1b\u6295\u7a3f"

    aput-object v3, v0, v2

    const/16 v2, 0xce5

    .line 3478
    const-string v3, "3302. pollution n.\u6c61\u67d3"

    aput-object v3, v0, v2

    const/16 v2, 0xce6

    .line 3479
    const-string v3, "3303. solution n.\u89e3\u7b54,\u89e3\u51b3\u529e\u6cd5;\u6eb6\u89e3,\u6eb6\u6db2"

    aput-object v3, v0, v2

    const/16 v2, 0xce7

    .line 3480
    const-string v3, "3304. resolution n.\u575a\u51b3,\u51b3\u5fc3;\u51b3\u5b9a,\u51b3\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0xce8

    .line 3481
    const-string v3, "3305. evolution n.\u8fdb\u5316,\u6f14\u53d8,\u53d1\u5c55,\u8fdb\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0xce9

    .line 3482
    const-string v3, "3306. revolution n.\u9769\u547d;\u65cb\u8f6c,\u8f6c\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0xcea

    .line 3483
    const-string v3, "3307. institution n.\u516c\u5171\u673a\u6784;\u534f\u4f1a;\u5b66\u6821;\u7814\u7a76\u6240;\u5236\u5ea6;\u60ef\u4f8b"

    aput-object v3, v0, v2

    const/16 v2, 0xceb

    .line 3484
    const-string v3, "3308. constitution n.\u6784\u6210,\u6784\u9020,\u7ec4\u6210(\u65b9\u5f0f),\u6210\u5206;\u4f53\u683c;\u5baa\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0xcec

    .line 3485
    const-string v3, "3309. reckon v.\u8ba1\u7b97,\u603b\u8ba1,\u4f30\u8ba1,\u731c\u60f3,\u4f9d\u8d56"

    aput-object v3, v0, v2

    const/16 v2, 0xced

    .line 3486
    const-string v3, "3310. melon n.\u751c\u74dc"

    aput-object v3, v0, v2

    const/16 v2, 0xcee

    .line 3487
    const-string v3, "3311. gallon n.\u52a0\u4ed1"

    aput-object v3, v0, v2

    const/16 v2, 0xcef

    .line 3488
    const-string v3, "3312. nylon n.\u5c3c\u9f99"

    aput-object v3, v0, v2

    const/16 v2, 0xcf0

    .line 3489
    const-string v3, "3313. lemon n.\u67e0\u6aac"

    aput-object v3, v0, v2

    const/16 v2, 0xcf1

    .line 3490
    const-string v3, "3314. common a.\u666e\u901a\u7684\uff1b\u5171\u540c\u7684\uff1b\u4e00\u822c\u7684\uff1bn.\u516c\u6709\u5730\ue072"

    aput-object v3, v0, v2

    const/16 v2, 0xcf2

    .line 3491
    const-string v3, "3315. summon v.\u53ec\u5524;\u4f20\u8baf,\u4f20\u5524;\u9f13\u8d77(\u52c7\u6c14),\u632f\u4f5c(\u7cbe\u795e)"

    aput-object v3, v0, v2

    const/16 v2, 0xcf3

    .line 3492
    const-string v3, "3316. phenomenon n.\u73b0\u8c61,\u7a00\u6709\u73b0\u8c61,\u73cd\u54c1,\u5947\u8ff9,\u6770\u51fa\u4eba\u624d"

    aput-object v3, v0, v2

    const/16 v2, 0xcf4

    .line 3493
    const-string v3, "3317. cannon n.\u5927\u70ae,\u706b\u70ae"

    aput-object v3, v0, v2

    const/16 v2, 0xcf5

    .line 3494
    const-string v3, "3318. typhoon n.\u53f0\u98ce"

    aput-object v3, v0, v2

    const/16 v2, 0xcf6

    .line 3495
    const-string v3, "3319. balloon n.\u6c14\u7403,\u98de\u8239\uff1ba.\u6c14\u7403\u72b6\u7684 v.\u4e58\u5750\u6c14\u7403\uff1b\u81a8\u80c0"

    aput-object v3, v0, v2

    const/16 v2, 0xcf7

    .line 3496
    const-string v3, "3320. moon n.(\u52a0the)\u6708\u7403\uff0c\u6708\u4eae\uff1b\u536b\u661f"

    aput-object v3, v0, v2

    const/16 v2, 0xcf8

    .line 3497
    const-string v3, "3321. noon n.\u4e2d\u5348\uff0c\u6b63\u5348"

    aput-object v3, v0, v2

    const/16 v2, 0xcf9

    .line 3498
    const-string v3, "3322. afternoon n.\u4e0b\u5348\uff0c\u5348\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0xcfa

    .line 3499
    const-string v3, "3323. spoon n.\u5319,\u8c03\u7fb9"

    aput-object v3, v0, v2

    const/16 v2, 0xcfb

    .line 3500
    const-string v3, "3324. soon ad.\u4e0d\u4e45\uff0c\u5373\u523b\uff1b\u5feb\uff0c\u65e9"

    aput-object v3, v0, v2

    const/16 v2, 0xcfc

    .line 3501
    const-string v3, "3325. cartoon n.\u6f2b\u753b,\u5e7d\u9ed8\u753b;\u52a8\u753b\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0xcfd

    .line 3502
    const-string v3, "3326. weapon n.\u6b66\u5668,\u5175\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xcfe

    .line 3503
    const-string v3, "3327. upon prep.\u5728\u2026\u4e0a\uff1b\u5728\u2026\u65c1 [=on]"

    aput-object v3, v0, v2

    const/16 v2, 0xcff

    .line 3504
    const-string v3, "3328. coupon n.\u8bc1\u660e\u6301\u5238\u4eba\u6709\u67d0\u79cd\u6743\u5229\u7684\u5361\u7247\uff0c\u7968\u8bc1\uff0c\u8d60\u5238"

    aput-object v3, v0, v2

    const/16 v2, 0xd00

    .line 3505
    const-string v3, "3329. iron n.\u94c1,\u94c1\u5236\u54c1,\u70d9\u94c1,\u71a8\u6597 v.\u71a8(\u8863),\u71a8\u5e73"

    aput-object v3, v0, v2

    const/16 v2, 0xd01

    .line 3506
    const-string v3, "3330. patron n.\u8d5e\u52a9\u4eba\uff1b\u8d44\u52a9\u4eba\uff1b\u8001\u987e\u5ba2\uff0c\u8001\u4e3b\u987e"

    aput-object v3, v0, v2

    const/16 v2, 0xd02

    .line 3507
    const-string v3, "3331. electron n.\u7535\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xd03

    .line 3508
    const-string v3, "3332. son n.\u513f\u5b50\uff1b\u5b69\u5b50(\u957f\u8005\u5bf9\u5e74\u9752\u6216\u5e74\u5e7c\u7537\u5b50\u7684\u79f0\u547c)"

    aput-object v3, v0, v2

    const/16 v2, 0xd04

    .line 3509
    const-string v3, "3333. reason n.\u539f\u56e0,\u7406\u6027,\u7406\u667a v.\u63a8\u7406,\u8bf4\u670d,\u8fa9\u8bba,\u8ba8\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0xd05

    .line 3510
    const-string v3, "3334. treason n.\u8c0b\u53cd,\u901a\u654c,\u53db\u56fd"

    aput-object v3, v0, v2

    const/16 v2, 0xd06

    .line 3511
    const-string v3, "3335. season n.\u5b63,\u5b63\u8282,\u65f6\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0xd07

    .line 3512
    const-string v3, "3336. poison n.\u6bd2\u7269,\u6bd2\u836f v.\u653e\u6bd2,\u6bd2\u5bb3,\u6c61\u67d3"

    aput-object v3, v0, v2

    const/16 v2, 0xd08

    .line 3513
    const-string v3, "3337. comparison n.\u6bd4\u8f83,\u5bf9\u6bd4,\u6bd4\u55bb,\u6bd4\u62df"

    aput-object v3, v0, v2

    const/16 v2, 0xd09

    .line 3514
    const-string v3, "3338. prison n.\u76d1\u72f1"

    aput-object v3, v0, v2

    const/16 v2, 0xd0a

    .line 3515
    const-string v3, "3339. person n.\u4eba\uff0c\u559c\u6b22(\u6216\u9002\u5e94)..\u7684\u4eba\uff1b\u4eba\u7269\uff1b\u4eba\u79f0"

    aput-object v3, v0, v2

    const/16 v2, 0xd0b

    .line 3516
    const-string v3, "3340. lesson n.(\u529f)\u8bfe\uff1b[pl.]\u8bfe\u7a0b\uff1b\u6559\u8bad"

    aput-object v3, v0, v2

    const/16 v2, 0xd0c

    .line 3517
    const-string v3, "3341. ton n.\u5428;(pl.)\u5927\u91cf,\u8bb8\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0xd0d

    .line 3518
    const-string v3, "3342. skeleton n.\u9aa8\u9abc;\u9aa8\u67b6,\u6846\u67b6;\u6897\u6982,\u63d0\u8981"

    aput-object v3, v0, v2

    const/16 v2, 0xd0e

    .line 3519
    const-string v3, "3343. badminton n.\u7fbd\u6bdb\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xd0f

    .line 3520
    const-string v3, "3344. piston n.\u6d3b\u585e"

    aput-object v3, v0, v2

    const/16 v2, 0xd10

    .line 3521
    const-string v3, "3345. cotton n.\u68c9\u82b1;\u68c9\u7ebf,\u68c9\u7eb1;\u68c9\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xd11

    .line 3522
    const-string v3, "3346. button n.\u7ebd\u6263,\u6309\u94ae(\u5f00\u5173) v.\u6263\u7d27;\u6263\u4e0a\u7ebd\u6263"

    aput-object v3, v0, v2

    const/16 v2, 0xd12

    .line 3523
    const-string v3, "3347. mutton n.\u7f8a\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0xd13

    .line 3524
    const-string v3, "3348. horizon n.\u5730\u5e73\u7ebf;\u773c\u754c,\u89c1\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0xd14

    .line 3525
    const-string v3, "3349. barn n.\u8c37\u4ed3,\u4ed3\u5e93"

    aput-object v3, v0, v2

    const/16 v2, 0xd15

    .line 3526
    const-string v3, "3350. earn v.\u8d5a\u5f97,\u6323\u5f97,\u83b7\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0xd16

    .line 3527
    const-string v3, "3351. learn v.\u5b66\u4e60\uff0c\u5b66\uff0c\u5b66\u4f1a\uff1b(of\uff0cabout)\u542c\u5230\uff0c\u83b7\u6089"

    aput-object v3, v0, v2

    const/16 v2, 0xd17

    .line 3528
    const-string v3, "3352. warn vt.\u8b66\u544a vi.\u53d1\u51fa\u8b66\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0xd18

    .line 3529
    const-string v3, "3353. concern v.\u6d89\u53ca,\u5173\u7cfb\u5230 v./n.\u5173\u5fc3 n.(\u5229\u5bb3)\u5173\u7cfb"

    aput-object v3, v0, v2

    const/16 v2, 0xd19

    .line 3530
    const-string v3, "3354. discern v.\u8ba4\u51fa,\u53d1\u73b0;\u8fa8\u522b,\u8bc6\u522b"

    aput-object v3, v0, v2

    const/16 v2, 0xd1a

    .line 3531
    const-string v3, "3355. modern a.\u73b0\u4ee3\u7684,\u8fd1\u4ee3\u7684,\u65b0\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd1b

    .line 3532
    const-string v3, "3356. northern a.\u5317\u65b9\u7684,\u5317\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd1c

    .line 3533
    const-string v3, "3357. southern a.\u5357\u65b9\u7684,\u5357\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd1d

    .line 3534
    const-string v3, "3358. lantern n.\u706f,\u706f\u7b3c"

    aput-object v3, v0, v2

    const/16 v2, 0xd1e

    .line 3535
    const-string v3, "3359. stern a.\u4e25\u5389\u7684;\u575a\u51b3\u7684,\u575a\u5b9a\u7684 n.\u8239\u5c3e,\u821f\u5c3e"

    aput-object v3, v0, v2

    const/16 v2, 0xd1f

    .line 3536
    const-string v3, "3360. eastern a.\u4e1c\u65b9\u7684,\u4e1c\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd20

    .line 3537
    const-string v3, "3361. western a.\u897f\u65b9\u7684,\u897f\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd21

    .line 3538
    const-string v3, "3362. pattern n.\u6a21\u5f0f,\u5f0f\u6837;\u56fe\u6848,\u56fe\u6837 v.\u4eff\u5236,\u6a21\u4eff"

    aput-object v3, v0, v2

    const/16 v2, 0xd22

    .line 3539
    const-string v3, "3363. govern v.\u7edf\u6cbb,\u7ba1\u7406;\u51b3\u5b9a,\u652f\u914d"

    aput-object v3, v0, v2

    const/16 v2, 0xd23

    .line 3540
    const-string v3, "3364. born a.\u51fa\u751f\u7684\uff0c\u4ea7\u751f\u7684\uff1b\u5929\u751f\u7684\uff0c\u5341\u8db3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd24

    .line 3541
    const-string v3, "3365. stubborn a.\u987d\u56fa\u7684,\u5014\u5f3a\u7684;\u96be\u5bf9\u4ed8\u7684,\u96be\u4ee5\u514b\u670d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd25

    .line 3542
    const-string v3, "3366. corn n.\u8c37\u7269,\u5e84\u7a3c,\u7389\u7c73"

    aput-object v3, v0, v2

    const/16 v2, 0xd26

    .line 3543
    const-string v3, "3367. scorn v./n.\u8f7b\u8511,\u85d0\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0xd27

    .line 3544
    const-string v3, "3368. horn n.(\u725b\u7f8a\u7b49\u7684)\u89d2;\u53f7,\u5587\u53ed;\u89d2\u72b6\u7269;\u89d2\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xd28

    .line 3545
    const-string v3, "3369. thorn n.\u523a,\u8346\u68d8"

    aput-object v3, v0, v2

    const/16 v2, 0xd29

    .line 3546
    const-string v3, "3370. burn v.\u71c3\u70e7\uff0c\u70e7\u7740\uff1b\u70e7\u6bc1\uff1b\u707c\u4f24 n.\u70e7\u4f24\uff0c\u707c\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0xd2a

    .line 3547
    const-string v3, "3371. mourn v.\u54c0\u60bc,\u5fe7\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0xd2b

    .line 3548
    const-string v3, "3372. turn v./n.(\u4f7f)\u8f6c\u52a8;(\u4f7f)\u65cb\u8f6c;(\u4f7f)\u8f6c\u53d8 n.\u673a\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xd2c

    .line 3549
    const-string v3, "3373. return v./n.\u8fd4\u56de,\u56de\u6765;\u5f52\u8fd8,\u9001\u8fd8;\u56de\u7b54"

    aput-object v3, v0, v2

    const/16 v2, 0xd2d

    .line 3550
    const-string v3, "3374. overturn n.\u503e\u8986,\u7834\u706d,\u9769\u547d v.\u6253\u7ffb,\u63a8\u7ffb,\u98a0\u5012,\u7ffb\u5012"

    aput-object v3, v0, v2

    const/16 v2, 0xd2e

    .line 3551
    const-string v3, "3375. fun n.\u73a9\u7b11,\u5a31\u4e50;\u6709\u8da3\u7684\u4eba(\u6216\u4e8b\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xd2f

    .line 3552
    const-string v3, "3376. gun n.\u67aa\uff0c\u70ae\uff0c\u624b\u67aa"

    aput-object v3, v0, v2

    const/16 v2, 0xd30

    .line 3553
    const-string v3, "3377. noun n.\u540d\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xd31

    .line 3554
    const-string v3, "3378. pronoun n.\u4ee3\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xd32

    .line 3555
    const-string v3, "3379. run v.\u5954\uff0c\u8dd1\uff1b\u6d41\uff0c\u6dcc\uff1b\u8513\u5ef6\uff0c\u4f38\u5c55\uff1b\u7ecf\u8425\uff1b\u8fd0\u8f6c"

    aput-object v3, v0, v2

    const/16 v2, 0xd33

    .line 3556
    const-string v3, "3380. sun n.\u592a\u9633\uff1b\u6052\u661f\uff1b\u7f8e\u56fdSun\u516c\u53f8"

    aput-object v3, v0, v2

    const/16 v2, 0xd34

    .line 3557
    const-string v3, "3381. stun vt.\u4f7f\u2026\u5931\u53bb\u77e5\u89c9\uff1b\u4f7f\u76ee\u77aa\u53e3\u5446\uff0c\u4f7f\u5403\u60ca"

    aput-object v3, v0, v2

    const/16 v2, 0xd35

    .line 3558
    const-string v3, "3382. dawn n.\u9ece\u660e,\u62c2\u6653 v.\u7834\u6653;\u5f00\u59cb\u73b0\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0xd36

    .line 3559
    const-string v3, "3383. lawn n.\u8349\u5730,\u8349\u576a"

    aput-object v3, v0, v2

    const/16 v2, 0xd37

    .line 3560
    const-string v3, "3384. yawn v.\u6253\u5475\u6b20 n.\u5475\u6b20"

    aput-object v3, v0, v2

    const/16 v2, 0xd38

    .line 3561
    const-string v3, "3385. own a.(\u7528\u5728\u6240\u6709\u683c\u540e\u9762\uff0c\u52a0\u5f3a\u8bed\u6c14)\u81ea\u5df1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd39

    .line 3562
    const-string v3, "3386. down ad.\u4e0b\uff1b\u7531\u5927\u5230\u5c0f prep.\u6cbf\u7740\u2026\u800c\u4e0b a.\u5411\u4e0b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd3a

    .line 3563
    const-string v3, "3387. breakdown n.\u5d29\u6e83\uff1b\u8870\u7aed\uff1b(\u5173\u7cfb\u3001\u8ba1\u5212\u6216\u8ba8\u8bba\u7b49\u7684)\u4e2d\u65ad"

    aput-object v3, v0, v2

    const/16 v2, 0xd3b

    .line 3564
    const-string v3, "3388. gown n.\u957f\u888d\uff0c\u7279\u6b8a\u573a\u5408\u7a7f\u7684\u957f\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0xd3c

    .line 3565
    const-string v3, "3389. well-known a.\u6709\u540d\u7684,\u8457\u540d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd3d

    .line 3566
    const-string v3, "3390. brown n./a.\u8910\u8272(\u7684),\u68d5\u8272(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xd3e

    .line 3567
    const-string v3, "3391. crown n.\u738b\u51a0,\u5195;\u541b\u6743,\u541b\u738b v.\u4e3a\u2026\u52a0\u5195"

    aput-object v3, v0, v2

    const/16 v2, 0xd3f

    .line 3568
    const-string v3, "3392. drown v.\u6eba\u6b7b,\u6df9\u6ca1"

    aput-object v3, v0, v2

    const/16 v2, 0xd40

    .line 3569
    const-string v3, "3393. frown v.\u76b1\u7709"

    aput-object v3, v0, v2

    const/16 v2, 0xd41

    .line 3570
    const-string v3, "3394. town n.\u5e02\u9547\uff1b\u5e02\u6c11\uff1b\u57ce\u5e02\u5546\u4e1a\u533a\uff0c\u95f9\u5e02\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0xd42

    .line 3571
    const-string v3, "3395. downtown ad.\u5728\u57ce\u5e02\u7684\u5546\u4e1a\u533a n./a.\u57ce\u5e02\u5546\u4e1a\u533a(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xd43

    .line 3572
    const-string v3, "3396. tobacco n.\u70df\u8349,\u70df\u53f6"

    aput-object v3, v0, v2

    const/16 v2, 0xd44

    .line 3573
    const-string v3, "3397. do aux.v. vt.\u505a\uff0c\u5e72\uff0c\u529e\uff0c\u4ece\u4e8b\uff1b\u5f15\u8d77 vi.\u884c\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xd45

    .line 3574
    const-string v3, "3398. undo v.\u677e\u5f00,\u89e3\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0xd46

    .line 3575
    const-string v3, "3399. video n.\u7535\u89c6,\u89c6\u9891;\u5f55\u50cf a.\u7535\u89c6\u7684,\u89c6\u9891\u7684;\u5f55\u50cf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd47

    .line 3576
    const-string v3, "3400. stereo n.\u7acb\u4f53\u58f0\u97f3\u54cd\uff1b\u7acb\u4f53\u58f0\u88c5\u7f6e n./a.\u7acb\u4f53\u58f0(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xd48

    .line 3577
    const-string v3, "3401. go v.\u53bb\uff0c\u79bb\u5f00\uff1b\u8d70\uff1b\u653e\u7f6e\uff1b\u53d8\u6210\uff1b\u8fd0\u8f6c n.\u56f4\u68cb"

    aput-object v3, v0, v2

    const/16 v2, 0xd49

    .line 3578
    const-string v3, "3402. ago ad.(\u5e38\u548c\u4e00\u822c\u8fc7\u53bb\u65f6\u7684\u52a8\u8bcd\u8fde\u7528)\u4ee5\u524d\uff0c\u2026\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0xd4a

    .line 3579
    const-string v3, "3403. ego n.\u81ea\u6211\uff0c\u81ea\u8d1f\uff0c\u5229\u5df2\u4e3b\u4e49\uff1b(\u5fc3\u7406\u5b66)\u81ea\u6211\u610f\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0xd4b

    .line 3580
    const-string v3, "3404. cargo n.\u8239\u8d27,\u8d27\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xd4c

    .line 3581
    const-string v3, "3405. undergo vt.\u906d\u53d7,\u7ecf\u5386,\u627f\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0xd4d

    .line 3582
    const-string v3, "3406. echo v./n.\u56de\u58f0,\u53cd\u54cd,\u5171\u9e23"

    aput-object v3, v0, v2

    const/16 v2, 0xd4e

    .line 3583
    const-string v3, "3407. who pron.\u8c01\uff0c\u4ec0\u4e48\u4eba\uff1b\u2026\u7684\u4eba\uff1b\u4ed6\uff0c\u5979\uff0c\u4ed6\u4eec"

    aput-object v3, v0, v2

    const/16 v2, 0xd4f

    .line 3584
    const-string v3, "3408. radio n.\u6536\u97f3\u673a\uff1b\u65e0\u7ebf\u7535\u62a5\uff0c\u65e0\u7ebf\u7535\u8bddv.\u65e0\u7ebf\u7535\u901a\u8baf"

    aput-object v3, v0, v2

    const/16 v2, 0xd50

    .line 3585
    const-string v3, "3409. audio n./a.\u97f3\u9891(\u54cd)(\u7684)\uff1b\u58f0\u97f3(\u7684)\uff0c\u542c\u89c9(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xd51

    .line 3586
    const-string v3, "3410. studio n.\u753b\u5ba4;\u64ad\u97f3\u5ba4;(\u7535\u5f71)\u5236\u7247\u5382"

    aput-object v3, v0, v2

    const/16 v2, 0xd52

    .line 3587
    const-string v3, "3411. ratio n.\u6bd4,\u6bd4\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0xd53

    .line 3588
    const-string v3, "3412. kilo n.(kilogram/kilogramme)\u5343\u514b"

    aput-object v3, v0, v2

    const/16 v2, 0xd54

    .line 3589
    const-string v3, "3413. hello int.\u82f1(\u7f8e)\u5582,\u4f60\u597d(\u7528\u6765\u6253\u62db\u547c\u6216\u5f15\u8d77\u6ce8\u610f)"

    aput-object v3, v0, v2

    const/16 v2, 0xd55

    .line 3590
    const-string v3, "3414. solo n.\u72ec\u594f a.&ad.\u5355\u72ec\u7684(\u5730)\uff1b\u72ec\u5531\u7684(\u5730)"

    aput-object v3, v0, v2

    const/16 v2, 0xd56

    .line 3591
    const-string v3, "3415. memo n.(memorandum)\u5907\u5fd8\u5f55"

    aput-object v3, v0, v2

    const/16 v2, 0xd57

    .line 3592
    const-string v3, "3416. no ad.\u4e0d\u662f\uff0c\u4e0d a.\u6ca1\u6709\u7684\uff1b\u4e0d\u5141\u8bb8 n.\u4e0d\uff0c\u62d2\u7edd"

    aput-object v3, v0, v2

    const/16 v2, 0xd58

    .line 3593
    const-string v3, "3417. volcano n.\u706b\u5c71"

    aput-object v3, v0, v2

    const/16 v2, 0xd59

    .line 3594
    const-string v3, "3418. piano n.\u94a2\u7434"

    aput-object v3, v0, v2

    const/16 v2, 0xd5a

    .line 3595
    const-string v3, "3419. shampoo n.\u6d17\u53d1\u818f,\u9999\u6ce2;\u6d17\u53d1,\u6d17\u5934 v.\u6d17\u53d1,\u6d17\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0xd5b

    .line 3596
    const-string v3, "3420. too ad.\u4e5f\uff0c\u8fd8\uff1b\u592a\uff0c\u8fc7\u4e8e\uff1b\u5f88\uff0c\u975e\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0xd5c

    .line 3597
    const-string v3, "3421. zoo n.\u52a8\u7269\u56ed"

    aput-object v3, v0, v2

    const/16 v2, 0xd5d

    .line 3598
    const-string v3, "3422. tempo n.\u8282\u594f,\u884c\u8fdb\u901f\u5ea6;(\u97f3\u4e50\u7684)\u901f\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0xd5e

    .line 3599
    const-string v3, "3423. hero n.\u82f1\u96c4\uff0c\u52c7\u58eb\uff1b\u7537\u4e3b\u89d2\uff0c\u7537\u4e3b\u4eba\u516c"

    aput-object v3, v0, v2

    const/16 v2, 0xd5f

    .line 3600
    const-string v3, "3424. zero n.\u96f6,\u96f6\u5ea6 num.\u96f6"

    aput-object v3, v0, v2

    const/16 v2, 0xd60

    .line 3601
    const-string v3, "3425. Negro n.\u9ed1\u4eba a.\u9ed1\u4eba\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd61

    .line 3602
    const-string v3, "3426. so ad.\u90a3\u4e48\uff1b\u975e\u5e38\uff1b\u4e5f\uff1b\u4e0d\u9519 conj.\u56e0\u6b64\uff1b\u4ee5\u4fbf"

    aput-object v3, v0, v2

    const/16 v2, 0xd62

    .line 3603
    const-string v3, "3427. also ad.\u800c\u4e14(\u4e5f)\uff0c\u6b64\u5916(\u8fd8)\uff1b\u540c\u6837\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xd63

    .line 3604
    const-string v3, "3428. to prep.(\u8868\u793a\u65b9\u5411)\u5230\uff1b\u5411\uff1b(\u8868\u793a\u95f4\u63a5\u5173\u7cfb)\u7ed9."

    aput-object v3, v0, v2

    const/16 v2, 0xd64

    .line 3605
    const-string v3, "3429. according to prep.\u636e/\u7167\u2026(\u6240\u8bf4\u3001\u6240\u5199)\uff1b\u6309\u2026\uff0c\u89c6\u2026"

    aput-object v3, v0, v2

    const/16 v2, 0xd65

    .line 3606
    const-string v3, "3430. tomato n.\u897f\u7ea2\u67ff"

    aput-object v3, v0, v2

    const/16 v2, 0xd66

    .line 3607
    const-string v3, "3431. potato n.\u9a6c\u94c3\u85af,\u571f\u8c46"

    aput-object v3, v0, v2

    const/16 v2, 0xd67

    .line 3608
    const-string v3, "3432. veto n./v.\u5426\u51b3"

    aput-object v3, v0, v2

    const/16 v2, 0xd68

    .line 3609
    const-string v3, "3433. mosquito n.\u868a\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xd69

    .line 3610
    const-string v3, "3434. into prep.\u5230...\u91cc\u9762\uff0c\u8fdb\u5165\uff1b\u6210\u4e3a(\u8868\u793a\u53d8\u5316)"

    aput-object v3, v0, v2

    const/16 v2, 0xd6a

    .line 3611
    const-string v3, "3435. onto prep.\u5728...\u4e0a\u9762\uff1b\u5230...\u4e0a\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0xd6b

    .line 3612
    const-string v3, "3436. photo n.(photograph)\u7167\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0xd6c

    .line 3613
    const-string v3, "3437. hitherto ad.\u5230\u76ee\u524d\u4e3a\u6b62,\u8fc4\u4eca"

    aput-object v3, v0, v2

    const/16 v2, 0xd6d

    .line 3614
    const-string v3, "3438. auto n.(automobile)(\u53e3\u8bed)\u6c7d\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0xd6e

    .line 3615
    const-string v3, "3439. two num.\u4e8c\uff0c\u4e24\u4e2an.\u4e24\u4e2a(\u4eba\u6216\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xd6f

    .line 3616
    const-string v3, "3440. cap n.\u4fbf\u5e3d,\u519b\u5e3d;\u76d6,\u7f69,\u5957 v.\u8986\u76d6\u4e8e\u2026\u9876\u7aef"

    aput-object v3, v0, v2

    const/16 v2, 0xd70

    .line 3617
    const-string v3, "3441. handicap v.\u59a8\u788d n.(\u8eab\u4f53\u6216\u667a\u529b\u65b9\u9762\u7684)\u7f3a\u9677;\u4e0d\u5229\u6761\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0xd71

    .line 3618
    const-string v3, "3442. heap n.(\u4e00)\u5806,\u5927\u91cf,\u8bb8\u591a v.(up)\u5806,\u5806\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xd72

    .line 3619
    const-string v3, "3443. cheap a.\u4fbf\u5b9c\u7684;\u4f4e\u52a3\u7684,\u4e0d\u503c\u94b1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xd73

    .line 3620
    const-string v3, "3444. leap v.\u8df3,\u8df3\u8dc3 n.\u8df3\u8dc3,\u98de\u8dc3"

    aput-object v3, v0, v2

    const/16 v2, 0xd74

    .line 3621
    const-string v3, "3445. reap v.\u6536\u5272,\u6536\u83b7"

    aput-object v3, v0, v2

    const/16 v2, 0xd75

    .line 3622
    const-string v3, "3446. gap n.\u7f3a\u53e3;\u5dee\u8ddd;\u7a7a\u767d;\u7f3a\u4e4f"

    aput-object v3, v0, v2

    const/16 v2, 0xd76

    .line 3623
    const-string v3, "3447. chap n./v.(\u76ae\u80a4)\u53d8\u7c97\u7cd9\uff1b\u53d1\u75db\uff1bn.\u5c0f\u4f19\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xd77

    .line 3624
    const-string v3, "3448. lap n.\u5927\u817f,(\u8dd1\u9053\u7684)\u4e00\u5708,\u4e00\u6bb5\u8def\u7a0b,\u5de5\u4f5c\u9636\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0xd78

    .line 3625
    const-string v3, "3449. clap v.\u62cd\u624b,\u62cd,\u8f7b\u62cd n.\u62cd(\u624b),\u638c\u58f0,\u9739\u96f3\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xd79

    .line 3626
    const-string v3, "3450. flap n.\u5782\u4e0b\u7269,\u5e3d\u6cbf,\u888b\u76d6 n./v.\u62cd\u6253,\u62cd\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xd7a

    .line 3627
    const-string v3, "3451. overlap v.\u91cd\u53e0,\u4e0e\u2026\u4ea4\u53e0 n.\u91cd\u53e0"

    aput-object v3, v0, v2

    const/16 v2, 0xd7b

    .line 3628
    const-string v3, "3452. slap n./v.\u62cd,\u638c\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0xd7c

    .line 3629
    const-string v3, "3453. map n.\u5730\u56fe,\u56fe vt.\u5728\u5730\u56fe\u4e0a\u6807\u793a\u51fa,\u7ed8\u5236\u5730\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0xd7d

    .line 3630
    const-string v3, "3454. nap n.\u5c0f\u7761,\u6253\u76f9"

    aput-object v3, v0, v2

    const/16 v2, 0xd7e

    .line 3631
    const-string v3, "3455. kidnap vt.\u8bf1\u62d0\uff1b\u7ed1\u67b6\uff0c\u52ab\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0xd7f

    .line 3632
    const-string v3, "3456. snap v.\u556a\u5730\u79fb\u52a8\uff1b(\u4f7f\uff09\u7a81\u7136\u65ad\u5f00\uff0c\u65ad\u5f00\uff08\u6210\u4e24\u622a)"

    aput-object v3, v0, v2

    const/16 v2, 0xd80

    .line 3633
    const-string v3, "3457. soap n.\u80a5\u7682"

    aput-object v3, v0, v2

    const/16 v2, 0xd81

    .line 3634
    const-string v3, "3458. rap n.\u53e9\u51fb,\u8f7b\u62cd,\u65a5\u8d23 v.\u6572,\u62cd,\u6253,\u65a5\u8d23,\u4f7f\u7740\u8ff7"

    aput-object v3, v0, v2

    const/16 v2, 0xd82

    .line 3635
    const-string v3, "3459. scrap n.\u788e\u7247;\u5e9f\u6599 v.\u5e9f\u5f03,\u62a5\u5e9f"

    aput-object v3, v0, v2

    const/16 v2, 0xd83

    .line 3636
    const-string v3, "3460. trap n.\u9677\u9631\uff0c\u5708\u5957 vt.\u8bf1\u6355\uff1b\u4f7f\u4e2d\u5708\u5957 vi.\u8bbe\u5708\u5957"

    aput-object v3, v0, v2

    const/16 v2, 0xd84

    .line 3637
    const-string v3, "3461. strap n.\u76ae\u5e26\uff0c\u5e26\u5b50v.\u7528\u5e26\u6263\u4f4f\uff0c\u675f\u7262\uff1b\u7528\u7ef7\u5e26\u5305\u624e"

    aput-object v3, v0, v2

    const/16 v2, 0xd85

    .line 3638
    const-string v3, "3462. wrap v.\u88f9,\u7f20,\u5377,\u5305 n.\u62ab\u80a9,\u56f4\u5dfe"

    aput-object v3, v0, v2

    const/16 v2, 0xd86

    .line 3639
    const-string v3, "3463. tap n.\u585e\u5b50;\u6c34\u9f99\u5934; n./v.\u8f7b\u6253,\u8f7b\u6572; vt.\u5f00\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0xd87

    .line 3640
    const-string v3, "3464. deep a.\u6df1\u7684,\u6df1\u957f\u7684;\u6df1\u5965\u7684;\u5f3a\u70c8\u7684 ad.\u6df1\u5165\u7684,\u8fdf"

    aput-object v3, v0, v2

    const/16 v2, 0xd88

    .line 3641
    const-string v3, "3465. sheep n.(\u7ef5)\u7f8a\uff1b\u6613\u53d7\u4eba\u6446\u5e03\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xd89

    .line 3642
    const-string v3, "3466. keep v.\u4fdd\u6301,\u4fdd\u5b58,\u9075\u5b88,\u7ecf\u8425,\u770b\u5b88,\u62d8\u7559,\u7ef4\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0xd8a

    .line 3643
    const-string v3, "3467. sleep v.(slept,slept)\u7761 n.\u7761\u7720"

    aput-object v3, v0, v2

    const/16 v2, 0xd8b

    .line 3644
    const-string v3, "3468. asleep a.\u7761\u89c9\uff0c\u7761\u7740(\u7528\u4f5c\u8868\u8bed)"

    aput-object v3, v0, v2

    const/16 v2, 0xd8c

    .line 3645
    const-string v3, "3469. peep v.\u5077\u770b,\u7aa5\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0xd8d

    .line 3646
    const-string v3, "3470. creep v.\u722c,\u722c\u884c;(\u690d\u7269)\u8513\u5ef6"

    aput-object v3, v0, v2

    const/16 v2, 0xd8e

    .line 3647
    const-string v3, "3471. steep a.\u9661\u5ced\u7684\uff1b\u9669\u5cfb\u7684\uff1b\u6025\u5267\u5347\u964d\u7684vt.\u6d78\u6ce1,\u6c89\u6d78"

    aput-object v3, v0, v2

    const/16 v2, 0xd8f

    .line 3648
    const-string v3, "3472. weep v.\u54ed\u6ce3,\u6d41\u6cea;\u6ef4\u4e0b n.\u54ed\u6ce3"

    aput-object v3, v0, v2

    const/16 v2, 0xd90

    .line 3649
    const-string v3, "3473. sweep v.\u626b,\u6253\u626b;\u5e2d\u5377,\u51b2\u5149;\u626b\u8fc7,\u63a0\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xd91

    .line 3650
    const-string v3, "3474. step n.\u6b65;\u53f0\u9636,\u68af\u7ea7;\u6b65\u9aa4,\u63aa\u65bd v.\u8e0f,\u8d70,\u4e3e\u6b65"

    aput-object v3, v0, v2

    const/16 v2, 0xd92

    .line 3651
    const-string v3, "3475. footstep n.\u811a\u6b65(\u58f0),\u8db3\u8ff9"

    aput-object v3, v0, v2

    const/16 v2, 0xd93

    .line 3652
    const-string v3, "3476. dip v./n.\u6d78,\u8638"

    aput-object v3, v0, v2

    const/16 v2, 0xd94

    .line 3653
    const-string v3, "3477. hip n.\u81c0\u90e8\uff0c\u9acb\uff1b\u5c4b\u810a"

    aput-object v3, v0, v2

    const/16 v2, 0xd95

    .line 3654
    const-string v3, "3478. chip n.\u5207\u5c51,\u788e\u7247;(\u571f\u8c46\u7b49\u7684)\u8584\u7247;\u96c6\u6210\u7535\u8def\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0xd96

    .line 3655
    const-string v3, "3479. ship n.\u8239\u8236\uff0c\u8230\u8247 v.\u88c5\u8fd0\uff0c\u822a\u8fd0\uff0c\u8fd0\u9001\uff1b\u53d1\u8d27"

    aput-object v3, v0, v2

    const/16 v2, 0xd97

    .line 3656
    const-string v3, "3480. friendship n.\u53cb\u8c0a,\u53cb\u597d"

    aput-object v3, v0, v2

    const/16 v2, 0xd98

    .line 3657
    const-string v3, "3481. hardship n.\u8270\u96be,\u56f0\u82e6"

    aput-object v3, v0, v2

    const/16 v2, 0xd99

    .line 3658
    const-string v3, "3482. spaceship n.\u5b87\u5b99\u98de\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0xd9a

    .line 3659
    const-string v3, "3483. relationship n.\u5173\u7cfb,\u8054\u7cfb"

    aput-object v3, v0, v2

    const/16 v2, 0xd9b

    .line 3660
    const-string v3, "3484. scholarship n.\u5956\u5b66\u91d1;\u5b66\u95ee,\u5b66\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0xd9c

    .line 3661
    const-string v3, "3485. membership n.\u4f1a\u5458\u8d44\u683c,\u6210\u5458\u8d44\u683c"

    aput-object v3, v0, v2

    const/16 v2, 0xd9d

    .line 3662
    const-string v3, "3486. leadership n.\u9886\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0xd9e

    .line 3663
    const-string v3, "3487. ownership n.\u6240\u6709(\u6743),\u6240\u6709\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xd9f

    .line 3664
    const-string v3, "3488. worship n.\u793c\u62dc,\u793c\u62dc\u4eea\u5f0f;\u5d07\u62dc v.\u5d07\u62dc,\u656c\u4ef0;\u505a\u793c\u62dc"

    aput-object v3, v0, v2

    const/16 v2, 0xda0

    .line 3665
    const-string v3, "3489. fellowship n.\u4f19\u4f34\u5173\u7cfb;\u8054\u8c0a\u4f1a,\u56e2\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xda1

    .line 3666
    const-string v3, "3490. whip n.\u97ad\u5b50;\u8f66\u592b v.\u97ad\u6253,\u62bd\u6253;\u7a81\u7136\u79fb\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xda2

    .line 3667
    const-string v3, "3491. skip vi.\u7565\u8fc7\uff0c\u8df3\u8fc7 n.\u8df3\u8dc3 vt.\u6545\u610f\u5ffd\u7565\uff1b\u7565\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xda3

    .line 3668
    const-string v3, "3492. lip n.\u5634\u5507"

    aput-object v3, v0, v2

    const/16 v2, 0xda4

    .line 3669
    const-string v3, "3493. clip v.\u526a,\u4fee\u526a;\u94b3,\u5939\u4f4f n.\u5939,\u94b3;\u56de\u5f62\u9488"

    aput-object v3, v0, v2

    const/16 v2, 0xda5

    .line 3670
    const-string v3, "3494. slip v.\u6ed1,\u6ed1\u5012;\u6ed1\u6389;\u6e9c\u8d70n.\u758f\u5ffd,\u5c0f\u9519,\u53e3\u8bef,\u7b14\u8bef"

    aput-object v3, v0, v2

    const/16 v2, 0xda6

    .line 3671
    const-string v3, "3495. rip v.\u6495,\u5265,\u5288,\u952f,\u88c2\u5f00,\u6495\u88c2 n.\u88c2\u53e3,\u88c2\u7f1d"

    aput-object v3, v0, v2

    const/16 v2, 0xda7

    .line 3672
    const-string v3, "3496. drip v.\u6ef4\u4e0b,\u6f0f\u6c34 n.\u6ef4,\u6c34\u6ef4,\u70b9\u6ef4"

    aput-object v3, v0, v2

    const/16 v2, 0xda8

    .line 3673
    const-string v3, "3497. grip v./n.\u7d27\u63e1,\u6293\u7d27;\u638c\u63e1"

    aput-object v3, v0, v2

    const/16 v2, 0xda9

    .line 3674
    const-string v3, "3498. trip n.\u65c5\u884c,\u8fdc\u8db3 v.\u7eca\u5012\uff1b\u5931\u8db3\uff1b\u72af\u9519"

    aput-object v3, v0, v2

    const/16 v2, 0xdaa

    .line 3675
    const-string v3, "3499. strip v.\u5265,\u5265\u53bb n.\u7a84\u6761,\u6761\u7eb9"

    aput-object v3, v0, v2

    const/16 v2, 0xdab

    .line 3676
    const-string v3, "3500. sip v.\u5c0f\u53e3\u5730\u559d\uff0c\u62bf\uff0c\u5477n.\u4e00\u5c0f\u53e3\u7684\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xdac

    .line 3677
    const-string v3, "3501. gossip n./v.(\u8bf4)\u95f2\u8bdd,\u95f2\u804a"

    aput-object v3, v0, v2

    const/16 v2, 0xdad

    .line 3678
    const-string v3, "3502. tip n.\u5c16\u7aef;\u672b\u7aef;\u5c0f\u8d39 n./v.\u8f7b\u51fb;\u503e\u659c;\u7ed9\u5c0f\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0xdae

    .line 3679
    const-string v3, "3503. equip v.(with)\u88c5\u5907,\u914d\u5907;\u8bad\u7ec3"

    aput-object v3, v0, v2

    const/16 v2, 0xdaf

    .line 3680
    const-string v3, "3504. zip v.(\u7528\u62c9\u94fe\u6216\u50cf\u62c9\u94fe\u90a3\u6837)\u5408\u4e0a\u6216\u6253\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0xdb0

    .line 3681
    const-string v3, "3505. help v.\u5e2e(\u63f4)\u52a9\uff1b\u6709\u52a9\u4e8e\uff1b[\u547c\u6551]\u6551\u547dn.\u5e2e\u52a9(\u624b)"

    aput-object v3, v0, v2

    const/16 v2, 0xdb1

    .line 3682
    const-string v3, "3506. camp n.\u91ce\u8425,\u8425\u5730;\u5e10\u7bf7,\u9635\u8425 v.\u8bbe\u8425,\u5bbf\u8425"

    aput-object v3, v0, v2

    const/16 v2, 0xdb2

    .line 3683
    const-string v3, "3507. damp n.\u6f6e\u6e7f a.\u6f6e\u6e7f\u7684 vt.\u4f7f\u6f6e\u6e7f;\u4f7f\u8870\u51cf"

    aput-object v3, v0, v2

    const/16 v2, 0xdb3

    .line 3684
    const-string v3, "3508. lamp n.\u706f"

    aput-object v3, v0, v2

    const/16 v2, 0xdb4

    .line 3685
    const-string v3, "3509. tramp n./v\u6b65\u884c;\u6c89\u91cd\u7684\u811a\u6b65\u58f0(\u8d70)v.\u8df5\u8e0fn.\u6d41\u6d6a\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xdb5

    .line 3686
    const-string v3, "3510. stamp n.\u90ae\u7968;\u5370;\u8dfa\u811a;\u6807\u5fd7v.\u8dfa\u811a,\u987f\u8db3;\u76d6\u7ae0"

    aput-object v3, v0, v2

    const/16 v2, 0xdb6

    .line 3687
    const-string v3, "3511. swamp n.\u6cbc\u6cfd\uff1b\u6e7f\u5730 vt.\u6d78\u6ca1\uff1b\u4f7f\u2026\u5e94\u63a5\u4e0d\u6687"

    aput-object v3, v0, v2

    const/16 v2, 0xdb7

    .line 3688
    const-string v3, "3512. limp a.\u67d4\u8f6f\u7684,\u6613\u66f2\u7684 v./n.\u8e52\u8dda,\u8ddb\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xdb8

    .line 3689
    const-string v3, "3513. bump v.(against,into)\u78b0;\u98a0\u7c38\u7740\u524d\u8fdb n.\u78b0\u649e"

    aput-object v3, v0, v2

    const/16 v2, 0xdb9

    .line 3690
    const-string v3, "3514. dump v.\u503e\u5012,\u503e\u5378 n.\u5783\u573e\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0xdba

    .line 3691
    const-string v3, "3515. jump v./n.\u8df3\u8dc3,\u8df3\u52a8,\u8df3\u8fc7;\u66b4\u6da8,\u731b\u589e"

    aput-object v3, v0, v2

    const/16 v2, 0xdbb

    .line 3692
    const-string v3, "3516. lump n.\u56e2,\u5757 v.(\u4f7f)\u6210\u56e2,(\u4f7f)\u6210\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0xdbc

    .line 3693
    const-string v3, "3517. pump n.\u6cf5 v.\u7528(\u6cf5)\u62bd(\u6c34);\u6253\u6c14,\u6cf5\u9001"

    aput-object v3, v0, v2

    const/16 v2, 0xdbd

    .line 3694
    const-string v3, "3518. cop n.\u8b66\u5bdf(slang \u4fda\u8bed)"

    aput-object v3, v0, v2

    const/16 v2, 0xdbe

    .line 3695
    const-string v3, "3519. hop v.\u4eba\u5355\u8db3\u8df3;\u8df3\u4e0a(\u8f66\u7b49) n.\u8e66\u8df3;\u77ed\u7a0b\u98de\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xdbf

    .line 3696
    const-string v3, "3520. chop v.\u780d,\u5288,\u65a9 n.\u6392\u9aa8,\u8089\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0xdc0

    .line 3697
    const-string v3, "3521. shop n.\u5546\u5e97\uff0c\u5e97\u94fa\uff1b\u5de5\u5382\uff0c\u8f66\u95f4  v.\u4e70\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0xdc1

    .line 3698
    const-string v3, "3522. workshop n.\u8f66\u95f4\uff0c\u5de5\u573a\uff0c\u4fee\u7406\u5382\uff1b\u7814\u8ba8\u4f1a\uff0c\u8bb2\u4e60\u73ed"

    aput-object v3, v0, v2

    const/16 v2, 0xdc2

    .line 3699
    const-string v3, "3523. develop v.\u53d1\u5c55,\u5f00\u53d1,\u7814\u5236;\u663e\u73b0,\u663e\u5f71;\u53d1\u80b2,\u751f\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xdc3

    .line 3700
    const-string v3, "3524. gallop v./n.\u5954\u9a70,\u98de\u5954"

    aput-object v3, v0, v2

    const/16 v2, 0xdc4

    .line 3701
    const-string v3, "3525. loop n.\u5708,\u73af"

    aput-object v3, v0, v2

    const/16 v2, 0xdc5

    .line 3702
    const-string v3, "3526. troop n.(pl.)\u90e8\u961f,\u519b\u961f;(\u4e00)\u7fa4/\u961f v.\u7fa4\u96c6,\u96c6\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0xdc6

    .line 3703
    const-string v3, "3527. "

    aput-object v3, v0, v2

    const/16 v2, 0xdc7

    .line 3704
    const-string v3, "3528. "

    aput-object v3, v0, v2

    const/16 v2, 0xdc8

    .line 3705
    const-string v3, "3529. stoop v.\u5f2f\u8170,\u4fef\u8eab n.\u5f2f\u8170,\u66f2\u80cc"

    aput-object v3, v0, v2

    const/16 v2, 0xdc9

    .line 3706
    const-string v3, "3530. pop a.\u6d41\u884c\u7684n.(\u53d1\u51fa)\u7830\u7684\u4e00\u58f0 v.\u7a81\u7136\u51fa\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0xdca

    .line 3707
    const-string v3, "3531. crop n.\u4f5c\u7269,\u5e84\u7a3c;(\u8c37\u7c7b\u7b49\u7684)\u4e00\u719f\u6536\u6210;\u4e00\u6279,\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xdcb

    .line 3708
    const-string v3, "3532. drop n.\u6ef4;\u843d\u4e0b;\u5fae\u91cf v.\u843d\u4e0b;\u4e0b\u964d;\u5931\u843d"

    aput-object v3, v0, v2

    const/16 v2, 0xdcc

    .line 3709
    const-string v3, "3533. top n.\u9876\uff0c\u9876\u7aef\uff1b\u9996\u4f4d\uff1b\u9876\u70b9 a.\u6700\u9ad8\u7684\uff1b\u9876\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdcd

    .line 3710
    const-string v3, "3534. laptop n.\u819d\u4e0a\u578b\u7535\u8111"

    aput-object v3, v0, v2

    const/16 v2, 0xdce

    .line 3711
    const-string v3, "3535. stop v.\u505c\u6b62;\u585e\u4f4f;\u963b\u6b62,\u963b\u6320;\u9017\u7559 n.\u505c\u8f66\u7ad9;\u505c\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0xdcf

    .line 3712
    const-string v3, "3536. sharp a.\u950b\u5229\u7684;\u8f6e\u5ed3\u5206\u660e\u7684;\u6025\u8f6c\u7684ad.(\u6307\u65f6\u523b)\u6b63"

    aput-object v3, v0, v2

    const/16 v2, 0xdd0

    .line 3713
    const-string v3, "3537. gasp n.\u5598\u606f,\u6c14\u5598 v.\u5598\u606f;\u6c14\u5401\u5401\u5730\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0xdd1

    .line 3714
    const-string v3, "3538. clasp n.\u6263\u5b50,\u94a9\u5b50;\u63e1\u624b v.\u6263\u4f4f,\u94a9\u4f4f;\u7d27\u63e1,\u7d27\u62b1"

    aput-object v3, v0, v2

    const/16 v2, 0xdd2

    .line 3715
    const-string v3, "3539. grasp v./n.\u6293\u4f4f,\u6293\u7d27;\u638c\u63e1,\u9886\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xdd3

    .line 3716
    const-string v3, "3540. crisp a.\u8106\u7684,\u6613\u788e\u7684;\u7b80\u660e\u627c\u8981\u7684\uff1b\uff08\u7a7a\u6c14\uff09\u6e05\u723d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdd4

    .line 3717
    const-string v3, "3541. up ad.\u5411\u4e0a\uff0c...\u8d77\u6765\uff1b...\u5b8c\uff1b\u8d77\u5e8a prep.\u5411\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0xdd5

    .line 3718
    const-string v3, "3542. grown-up a.\u6210\u957f\u7684,\u6210\u719f\u7684,\u6210\u4eba\u7684 n.\u6210\u5e74\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xdd6

    .line 3719
    const-string v3, "3543. cup n.\u676f\u5b50\uff1b\u5956\u676f\uff0c\u4f18\u80dc\u676f\uff1b(\u4e00)\u676f\uff0c\u4e00\u676f\u7684\u5bb9\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xdd7

    .line 3720
    const-string v3, "3544. pickup n.\u62fe\u8d77,\u83b7\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0xdd8

    .line 3721
    const-string v3, "3545. group n.\u7fa4,\u7ec4 v.\u5206\u7ec4"

    aput-object v3, v0, v2

    const/16 v2, 0xdd9

    .line 3722
    const-string v3, "3546. soup n.\u6c64"

    aput-object v3, v0, v2

    const/16 v2, 0xdda

    .line 3723
    const-string v3, "3547. bar n.\u6761,\u6746,\u95e9;\u9152\u5427;\u6805,\u969c\u788d(\u7269) v.\u95e9\u4e0a,\u963b\u62e6"

    aput-object v3, v0, v2

    const/16 v2, 0xddb

    .line 3724
    const-string v3, "3548. car n.\u6c7d\u8f66\uff0c\u8f66\u8f86\uff0c\u8f66\uff1b(\u706b\u8f66)\u8f66\u53a2"

    aput-object v3, v0, v2

    const/16 v2, 0xddc

    .line 3725
    const-string v3, "3549. scar n.\u75a4,\u75a4\u75d5;\u521b\u4f24 v.\u4f7f\u7559\u4e0b\u4f24\u75d5,\u521b\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0xddd

    .line 3726
    const-string v3, "3550. radar n.\u96f7\u8fbe"

    aput-object v3, v0, v2

    const/16 v2, 0xdde

    .line 3727
    const-string v3, "3551. calendar n.\u65e5\u5386,\u6708\u5386"

    aput-object v3, v0, v2

    const/16 v2, 0xddf

    .line 3728
    const-string v3, "3552. ear n.\u8033\uff0c\u8033\u6735\uff1b\u542c\u529b\uff0c\u542c\u89c9\uff1b\u7a57"

    aput-object v3, v0, v2

    const/16 v2, 0xde0

    .line 3729
    const-string v3, "3553. bear n.\u718a v.\u5fcd\u53d7,\u5bb9\u5fcd;\u8d1f\u62c5;\u7ed3\u679c\u5b9e,\u751f\u5b50\u5973"

    aput-object v3, v0, v2

    const/16 v2, 0xde1

    .line 3730
    const-string v3, "3554. dear a.\u6602\u8d35\u7684\uff1b\u4eb2\u7231\u7684\uff1b\u73cd\u8d35\u7684  int.\u5475\uff01\u54ce\u5440\uff01"

    aput-object v3, v0, v2

    const/16 v2, 0xde2

    .line 3731
    const-string v3, "3555. fear n.\u5bb3\u6015\uff0c\u6050\u60e7\uff1b\u5371\u9669vt.\u754f\u60e7\uff0c\u5bb3\u6015\uff0c\u62c5\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0xde3

    .line 3732
    const-string v3, "3556. gear n.\u9f7f\u8f6e,\u4f20\u52a8\u88c5\u7f6e v.(to)\u8c03\u6574,\u4f7f\u9002\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0xde4

    .line 3733
    const-string v3, "3557. hear v.\u542c\u89c1\uff1b\u5ba1\u8baf\uff1b(from)\u6536\u5230..\u7684\u4fe1/\u7535\u8bdd;\u542c\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0xde5

    .line 3734
    const-string v3, "3558. overhear v.\u5076\u7136\u542c\u5230,\u4ece\u65c1\u542c\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0xde6

    .line 3735
    const-string v3, "3559. shear v.\u526a,\u4fee\u526a"

    aput-object v3, v0, v2

    const/16 v2, 0xde7

    .line 3736
    const-string v3, "3560. clear a./ad.\u6e05\u6670\u7684(\u5730)vt.\u6e05\u9664\uff1b\u4f7f\u6e05\u695avi.\u53d8\u6e05\u6f88"

    aput-object v3, v0, v2

    const/16 v2, 0xde8

    .line 3737
    const-string v3, "3561. nuclear a.\u6838\u5fc3\u7684,\u4e2d\u5fc3\u7684;\u539f\u5b50\u6838\u7684,\u6838\u80fd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xde9

    .line 3738
    const-string v3, "3562. near a.\u8fd1\u7684\uff0c\u63a5\u8fd1\u7684\uff1b\u4eb2\u8fd1\u7684 prep.\u9760\u8fd1 ad.\u63a5\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0xdea

    .line 3739
    const-string v3, "3563. linear a.\u7ebf\u7684\uff0c\u76f4\u7ebf\u7684\uff0c\u7ebf\u72b6\u7684\uff1b\u957f\u5ea6\u7684\uff1b\u7ebf\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdeb

    .line 3740
    const-string v3, "3564. pear n.\u68a8\u5b50,\u68a8\u6811"

    aput-object v3, v0, v2

    const/16 v2, 0xdec

    .line 3741
    const-string v3, "3565. appear vi.\u51fa\u73b0\uff1b\u51fa\u573a\uff1b\u95ee\u4e16\uff1b\u4eff\u4f5b\uff1b\u51fa\u7248\uff0c\u53d1\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0xded

    .line 3742
    const-string v3, "3566. disappear v.\u4e0d\u89c1,\u6d88\u5931"

    aput-object v3, v0, v2

    const/16 v2, 0xdee

    .line 3743
    const-string v3, "3567. spear n.\u77db,\u67aa"

    aput-object v3, v0, v2

    const/16 v2, 0xdef

    .line 3744
    const-string v3, "3568. rear n.\u540e\u9762,\u80cc\u540e,\u540e\u65b9 v.\u9972\u517b,\u629a\u517b,\u683d\u57f9,\u4e3e\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xdf0

    .line 3745
    const-string v3, "3569. tear n.(pl.)\u773c\u6cea vt.\u6495\u88c2\uff1b\u4f7f\u2026\u5206\u88c2 vi.\u7834\u88c2"

    aput-object v3, v0, v2

    const/16 v2, 0xdf1

    .line 3746
    const-string v3, "3570. wear v.\u7a7f\u7740\uff0c\u6234\u7740\uff1b\u78e8\u635f\uff0c\u7528\u65e7 n.\u7a7f\uff0c\u6234\uff1b\u78e8\u635f"

    aput-object v3, v0, v2

    const/16 v2, 0xdf2

    .line 3747
    const-string v3, "3571. swear v.(at)\u8bc5\u5492,\u9a82\u4eba;\u5ba3\u8a93,\u53d1\u8a93"

    aput-object v3, v0, v2

    const/16 v2, 0xdf3

    .line 3748
    const-string v3, "3572. year n.\u5e74\uff0c\u5e74\u5ea6\uff0c\u5b66\u5e74 a./ad.\u6bcf\u5e74\uff0c\u4e00\u5e74\u4e00\u6b21"

    aput-object v3, v0, v2

    const/16 v2, 0xdf4

    .line 3749
    const-string v3, "3573. far a./ad.\u8fdc\uff0c\u4e45\u8fdc\uff0c\u9065\u8fdc ad.\u5230\u2026\u7a0b\u5ea6\uff0c\u2026\u5f97\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0xdf5

    .line 3750
    const-string v3, "3574. vinegar n.\u918b"

    aput-object v3, v0, v2

    const/16 v2, 0xdf6

    .line 3751
    const-string v3, "3575. cigar n.\u96ea\u8304\u70df"

    aput-object v3, v0, v2

    const/16 v2, 0xdf7

    .line 3752
    const-string v3, "3576. vulgar a.\u7c97\u4fd7\u7684\uff0c\u5eb8\u4fd7\u7684\uff0c\u672c\u571f\u7684\uff0c\u901a\u4fd7\u7684\uff0c\u666e\u901a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdf8

    .line 3753
    const-string v3, "3577. sugar n.\u7cd6\uff0c\u98df\u7cd6 vt.\u52a0\u7cd6\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xdf9

    .line 3754
    const-string v3, "3578. familiar a.\u719f\u6089\u7684;\u901a\u6653\u7684;\u4eb2\u8fd1\u7684 n.\u719f\u5ba2;\u5bc6\u53cb"

    aput-object v3, v0, v2

    const/16 v2, 0xdfa

    .line 3755
    const-string v3, "3579. peculiar a.\u53e4\u602a\u7684,\u5f02\u5e38\u7684;\u7279\u6b8a\u7684,\u7279\u6709\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdfb

    .line 3756
    const-string v3, "3580. jar n.\u7f50\u575b,\u5e7f\u53e3\u74f6"

    aput-object v3, v0, v2

    const/16 v2, 0xdfc

    .line 3757
    const-string v3, "3581. burglar n.(\u5165\u5ba4\u884c\u7a83\u7684)\u76d7\u8d3c"

    aput-object v3, v0, v2

    const/16 v2, 0xdfd

    .line 3758
    const-string v3, "3582. similar a.(to)\u76f8\u4f3c\u7684,\u7c7b\u4f3c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xdfe

    .line 3759
    const-string v3, "3583. cellar n.\u5730\u7a91,\u5730\u4e0b\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xdff

    .line 3760
    const-string v3, "3584. pillar n.\u67f1,\u53f0\u67f1,\u680b\u6881"

    aput-object v3, v0, v2

    const/16 v2, 0xe00

    .line 3761
    const-string v3, "3585. collar n.\u8863\u9886;\u73af\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xe01

    .line 3762
    const-string v3, "3586. dollar n.(\u7f8e\u56fd,\u52a0\u62ff\u5927\u7b49\u56fd\u8d27\u5e01\u5355\u4f4d)\u7f8e\u5143,\u52a0\u5143"

    aput-object v3, v0, v2

    const/16 v2, 0xe02

    .line 3763
    const-string v3, "3587. scholar n.\u5b66\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xe03

    .line 3764
    const-string v3, "3588. polar a.\u4e24\u6781\u7684,\u6781\u5730\u7684,\u5357\u8f95\u5317\u8f99\u7684 n.\u6781\u7ebf,\u6781\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0xe04

    .line 3765
    const-string v3, "3589. solar a.\u592a\u9633\u7684,\u65e5\u5149\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe05

    .line 3766
    const-string v3, "3590. spectacular a.\u58ee\u89c2\u7684,\u5f15\u4eba\u6ce8\u76ee\u7684 n.\u58ee\u89c2\u7684\u6f14\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0xe06

    .line 3767
    const-string v3, "3591. particular a.\u7279\u6b8a\u7684,\u82db\u6c42\u7684,\u4e2a\u522b\u7684n.\u8be6\u60c5,\u7ec6\u8282,\u7279\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0xe07

    .line 3768
    const-string v3, "3592. circular a.\u5706(\u5f62)\u7684,\u73af\u5f62\u7684;\u5faa\u73af\u7684 n.\u4f20\u5355,\u901a\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0xe08

    .line 3769
    const-string v3, "3593. muscular a.\u808c\u8089\u7684;\u808c\u8089\u53d1\u8fbe\u7684;\u5f3a\u5065\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe09

    .line 3770
    const-string v3, "3594. regular a.\u6709\u89c4\u5f8b\u7684;\u6574\u9f50\u7684,\u5300\u79f0\u7684,\u6b63\u89c4\u7684,\u6b63\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe0a

    .line 3771
    const-string v3, "3595. singular a.\u975e\u51e1\u7684,\u5353\u8d8a\u7684;\u5355\u6570\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe0b

    .line 3772
    const-string v3, "3596. popular a.\u6d41\u884c\u7684,\u901a\u4fd7\u7684,\u5927\u4f17\u7684;\u5e7f\u53d7\u6b22\u8fce\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe0c

    .line 3773
    const-string v3, "3597. grammar n.\u8bed\u6cd5,\u8bed\u6cd5\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0xe0d

    .line 3774
    const-string v3, "3598. seminar n.(\u5927\u5b66\u7684)\u7814\u7a76\u73ed,\u7814\u8ba8\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xe0e

    .line 3775
    const-string v3, "3599. lunar a.\u6708\u4eae\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe0f

    .line 3776
    const-string v3, "3600. oar n.\u6868,\u6a79 v.\u5212,\u5212\u52a8,\u5212\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0xe10

    .line 3777
    const-string v3, "3601. roar n./v.\u543c\u53eb,\u6012\u53f7;\u8f70\u9e23,\u5486\u54ee"

    aput-object v3, v0, v2

    const/16 v2, 0xe11

    .line 3778
    const-string v3, "3602. uproar n.\u9a9a\u52a8,\u55a7\u56a3,\u9f0e\u6cb8"

    aput-object v3, v0, v2

    const/16 v2, 0xe12

    .line 3779
    const-string v3, "3603. soar vi.(\u6307\u9e1f\u7b49)\u9ad8\u98de\uff0c\u7ff1\u7fd4\uff1b\u98de\u6da8\uff1b\u9ad8\u8038"

    aput-object v3, v0, v2

    const/16 v2, 0xe13

    .line 3780
    const-string v3, "3604. tar n.\u67cf\u6cb9\uff0c\u7126\u6cb9 vt.\u6d82\u6216\u6d47\u67cf\u6cb9/\u7126\u6cb9\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xe14

    .line 3781
    const-string v3, "3605. guitar n.\u5409\u4ed6 vi.\u5f39\u5409\u4ed6"

    aput-object v3, v0, v2

    const/16 v2, 0xe15

    .line 3782
    const-string v3, "3606. star n.\u661f\uff1b\u6052\u661f\uff1b\u660e\u661f v.\u7528\u661f\u53f7\u6807\u51fa\uff1b\u626e\u6f14\u4e3b\u89d2"

    aput-object v3, v0, v2

    const/16 v2, 0xe16

    .line 3783
    const-string v3, "3607. war n.\u6218\u4e89(\u72b6\u6001)\uff1b\u51b2\u7a81 vi.\u4f5c\u6218"

    aput-object v3, v0, v2

    const/16 v2, 0xe17

    .line 3784
    const-string v3, "3608. rubber n.\u6a61\u76ae,\u6a61\u80f6;\u6a61\u80f6\u5236\u54c1,\u80f6\u978b"

    aput-object v3, v0, v2

    const/16 v2, 0xe18

    .line 3785
    const-string v3, "3609. fiber n.(fibre)\u7ea4\u7ef4;\u6784\u9020;\u7ea4\u7ef4\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xe19

    .line 3786
    const-string v3, "3610. chamber n.\u623f\u95f4\uff0c\u5ba4\uff1b\u4f1a\u8bae\u5ba4\uff1b\u8bae\u9662\uff1b(\u52a8\u7269\u4f53\u5185)\u8154\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xe1a

    .line 3787
    const-string v3, "3611. December n.\u5341\u4e8c\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0xe1b

    .line 3788
    const-string v3, "3612. member n.\u6210\u5458,\u4f1a\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xe1c

    .line 3789
    const-string v3, "3613. remember v.\u8bb0\u4f4f;(to)\u8f6c\u8fbe\u95ee\u5019,\u4ee3\u2026\u81f4\u610f,\u4ee3\u2026\u95ee\u597d"

    aput-object v3, v0, v2

    const/16 v2, 0xe1d

    .line 3790
    const-string v3, "3614. September n.\u4e5d\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0xe1e

    .line 3791
    const-string v3, "3615. November n.\u5341\u4e00\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0xe1f

    .line 3792
    const-string v3, "3616. timber n.\u6728\u6750,\u6728\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xe20

    .line 3793
    const-string v3, "3617. cucumber n.\u9ec4\u74dc"

    aput-object v3, v0, v2

    const/16 v2, 0xe21

    .line 3794
    const-string v3, "3618. lumber n.\u6728\u6750,\u6728\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xe22

    .line 3795
    const-string v3, "3619. plumber n.(\u88c5\u4fee\u6c34\u7ba1\u7684)\u7ba1\u5b50\u5de5"

    aput-object v3, v0, v2

    const/16 v2, 0xe23

    .line 3796
    const-string v3, "3620. number n.\u6570,\u6570\u5b57,\u6570\u91cf,\u53f7\u7801,\u4e00\u7fa4 v.\u5171\u8ba1,\u7f16\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0xe24

    .line 3797
    const-string v3, "3621. sober a.\u6e05\u9192\u7684;\u8ba4\u771f\u7684,\u51b7\u9759\u7684,\u9002\u5ea6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe25

    .line 3798
    const-string v3, "3622. October n.\u5341\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0xe26

    .line 3799
    const-string v3, "3623. barber n.\u7406\u53d1\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xe27

    .line 3800
    const-string v3, "3624. soccer n.\u8db3\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xe28

    .line 3801
    const-string v3, "3625. officer n.\u5b98\u5458,\u529e\u4e8b\u5458;\u5de5\u4f5c\u4eba\u5458;\u519b\u5b98"

    aput-object v3, v0, v2

    const/16 v2, 0xe29

    .line 3802
    const-string v3, "3626. cancer n.\u764c"

    aput-object v3, v0, v2

    const/16 v2, 0xe2a

    .line 3803
    const-string v3, "3627. grocer n.\u98df\u54c1\u5546,\u6742\u8d27\u5546"

    aput-object v3, v0, v2

    const/16 v2, 0xe2b

    .line 3804
    const-string v3, "3628. saucer n.\u8336\u6258,\u789f\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xe2c

    .line 3805
    const-string v3, "3629. reader n.\u8bfb\u8005\uff1b\u8bfb\u672c\uff0c\u8bfb\u7269\uff1b(\u82f1\u56fd\u7684)\u5927\u5b66\u8bb2\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xe2d

    .line 3806
    const-string v3, "3630. ladder n.\u68af\u5b50,\u9636\u68af"

    aput-object v3, v0, v2

    const/16 v2, 0xe2e

    .line 3807
    const-string v3, "3631. spider n.\u8718\u86db"

    aput-object v3, v0, v2

    const/16 v2, 0xe2f

    .line 3808
    const-string v3, "3632. consider v.\u8003\u8651\uff0c\u7ec6\u60f3\uff1b\u4f53\u8c05\uff0c\u987e\u53ca\uff1b\u8ba4\u4e3a\uff0c\u628a\u2026\u770b\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0xe30

    .line 3809
    const-string v3, "3633. elder a.\u5e74\u957f\u7684,\u8d44\u683c\u8001\u7684 n.\u957f\u8f88"

    aput-object v3, v0, v2

    const/16 v2, 0xe31

    .line 3810
    const-string v3, "3634. bewilder v.\u4f7f\u8ff7\u60d1,\u96be\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0xe32

    .line 3811
    const-string v3, "3635. holder n.\u6301\u6709\u8005,\u5360\u6709\u8005;(\u53f0,\u67b6\u7b49)\u652f\u6301\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xe33

    .line 3812
    const-string v3, "3636. shoulder n.\u80a9,\u80a9\u90e8 v.\u80a9\u8d1f,\u627f\u62c5"

    aput-object v3, v0, v2

    const/16 v2, 0xe34

    .line 3813
    const-string v3, "3637. wander v.\u6f2b\u6b65,\u5f98\u5f8a;\u8ff7\u8def,\u8ff7\u5931\u65b9\u5411;\u79bb\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0xe35

    .line 3814
    const-string v3, "3638. gender n.(\u751f\u7406\u4e0a\u7684)\u6027\uff1b(\u540d\u8bcd\u3001\u4ee3\u8bcd\u7b49\u7684)\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0xe36

    .line 3815
    const-string v3, "3639. slender a.\u4fee\u957f\u7684,\u7ec6\u957f\u7684,\u82d7\u6761\u7684;\u5fae\u5c0f\u7684,\u5fae\u8584\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe37

    .line 3816
    const-string v3, "3640. render v.\u4f7f\u5f97,\u81f4\u4f7f;\u63d0\u51fa,\u63d0\u4f9b,\u5448\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0xe38

    .line 3817
    const-string v3, "3641. surrender vi.\u6295\u964d\uff0c\u5c48\u670d vt.\u653e\u5f03\uff0c\u4ea4\u51fa n.\u6295\u964d\uff0c\u8ba4\u8f93"

    aput-object v3, v0, v2

    const/16 v2, 0xe39

    .line 3818
    const-string v3, "3642. tender a.\u5ae9\u7684;\u654f\u611f\u7684;\u6e29\u67d4\u7684 v.\u63d0\u51fa,\u63d0\u4f9b;\u6295\u6807"

    aput-object v3, v0, v2

    const/16 v2, 0xe3a

    .line 3819
    const-string v3, "3643. remainder n.\u5269\u4f59\u7269,\u5269\u4e0b\u7684;\u4f59\u6570,\u4f59\u9879"

    aput-object v3, v0, v2

    const/16 v2, 0xe3b

    .line 3820
    const-string v3, "3644. hinder v.(from)\u963b\u6b62,\u59a8\u788d a.\u540e\u9762\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe3c

    .line 3821
    const-string v3, "3645. cylinder n.\u5706\u7b52,\u5706\u9525\u4f53;\u6c7d\u7f38"

    aput-object v3, v0, v2

    const/16 v2, 0xe3d

    .line 3822
    const-string v3, "3646. ponder v.\u6c89\u601d,\u8003\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0xe3e

    .line 3823
    const-string v3, "3647. wonder n.\u60ca\u5947,\u60ca\u5f02;\u5947\u8ff9,\u5947\u4e8b v.(at)\u8be7\u5f02;\u60f3\u77e5\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0xe3f

    .line 3824
    const-string v3, "3648. under prep.\u5728\u2026\u4e0b\u9762\uff1b \u5728\u2026\u4ee5\u4e0b ad.\u5728\u4e0b\u9762\uff1b\u5c11\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0xe40

    .line 3825
    const-string v3, "3649. thunder n.\u96f7(\u58f0);\u8f70\u9686\u58f0 v.\u6253\u96f7;\u5927\u58f0\u8bf4,\u543c\u53eb"

    aput-object v3, v0, v2

    const/16 v2, 0xe41

    .line 3826
    const-string v3, "3650. blunder v.(\u56e0\u65e0\u77e5\u7b49\u800c)\u72af\u5927\u9519;\u8e09\u8e09\u8dc4\u8dc4\u5730\u8d70 n.\u5927\u9519"

    aput-object v3, v0, v2

    const/16 v2, 0xe42

    .line 3827
    const-string v3, "3651. order n.\u547d\u4ee4;\u6b21\u5e8f;\u6574\u9f50;\u5b9a\u8d27\u5355;\u7b49\u7ea7 v.\u5b9a\u5236,\u8ba2\u8d2d"

    aput-object v3, v0, v2

    const/16 v2, 0xe43

    .line 3828
    const-string v3, "3652. border n.\u8fb9\u754c,\u56fd\u754c;\u8fb9(\u6cbf) v.\u4ea4\u754c,\u4e0e\u2026\u63a5\u58e4;\u63a5\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0xe44

    .line 3829
    const-string v3, "3653. recorder n.\u8bb0\u5f55\u5458;\u5f55\u97f3\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xe45

    .line 3830
    const-string v3, "3654. disorder n.\u6df7\u4e71,\u6742\u4e71;\u9a9a\u4e71;\u5931\u8c03,\u75be\u75c5"

    aput-object v3, v0, v2

    const/16 v2, 0xe46

    .line 3831
    const-string v3, "3655. murder v./n.\u8c0b\u6740,\u51f6\u6740"

    aput-object v3, v0, v2

    const/16 v2, 0xe47

    .line 3832
    const-string v3, "3656. powder n.\u7c89\u672b,\u836f\u7c89;\u706b\u836f,\u70b8\u836f"

    aput-object v3, v0, v2

    const/16 v2, 0xe48

    .line 3833
    const-string v3, "3657. beer n.\u5564\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0xe49

    .line 3834
    const-string v3, "3658. deer n.\u9e7f"

    aput-object v3, v0, v2

    const/16 v2, 0xe4a

    .line 3835
    const-string v3, "3659. cheer v.(\u4f7f)\u632f\u594b,(\u4f7f)\u9ad8\u5174 v./n.\u559d\u5f69,\u6b22\u547c"

    aput-object v3, v0, v2

    const/16 v2, 0xe4b

    .line 3836
    const-string v3, "3660. sheer a.\u7eaf\u7cb9\u7684,\u5341\u8db3\u7684,\u5168\u7136\u7684;\u9661\u5ced\u7684,\u9669\u5cfb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe4c

    .line 3837
    const-string v3, "3661. engineer n.\u5de5\u7a0b\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xe4d

    .line 3838
    const-string v3, "3662. pioneer n.\u5148\u9a71,\u5021\u5bfc\u8005,\u5f00\u62d3\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xe4e

    .line 3839
    const-string v3, "3663. peer n.\u540c\u8f88,\u540c\u7b49\u5730\u4f4d\u7684\u4eba;\u8d35\u65cf v.\u51dd\u89c6,\u9690\u7ea6\u51fa\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0xe4f

    .line 3840
    const-string v3, "3664. career n.(\u4e2a\u4eba\u7684)\u4e8b\u4e1a\uff1b\u4e13\u4e1a\uff0c\u751f\u6daf\uff0c\u804c\u4e1a\uff0c\u7ecf\u5386"

    aput-object v3, v0, v2

    const/16 v2, 0xe50

    .line 3841
    const-string v3, "3665. volunteer n./v.\u81ea\u613f(\u8005,\u5175);\u81ea\u613f(\u63d0\u4f9b)"

    aput-object v3, v0, v2

    const/16 v2, 0xe51

    .line 3842
    const-string v3, "3666. steer vt.\u9a7e\u9a76\uff0c\u4e3a\u2026\u64cd\u8235\uff1b\u5f15\u5bfcvi.\u9a7e\u9a76"

    aput-object v3, v0, v2

    const/16 v2, 0xe52

    .line 3843
    const-string v3, "3667. queer a.\u5947\u602a\u7684,\u53e4\u602a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe53

    .line 3844
    const-string v3, "3668. refer v.\u53c2\u8003,\u67e5\u8be2;\u63d0\u5230,\u5f15\u7528,\u6d89\u53ca;\u63d0\u4ea4,\u4e0a\u5448"

    aput-object v3, v0, v2

    const/16 v2, 0xe54

    .line 3845
    const-string v3, "3669. prefer v.(to)\u66f4\u559c\u6b22,\u5b81\u613f"

    aput-object v3, v0, v2

    const/16 v2, 0xe55

    .line 3846
    const-string v3, "3670. differ v.(from)\u4e0e\u2026\u4e0d\u540c;(with)\u4e0e\u2026\u610f\u89c1\u4e0d\u540c"

    aput-object v3, v0, v2

    const/16 v2, 0xe56

    .line 3847
    const-string v3, "3671. offer v.\u63d0\u4f9b,\u63d0\u8bae,\u51fa\u73b0 n.\u51fa\u4ef7,\u63d0\u8bae,\u610f\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0xe57

    .line 3848
    const-string v3, "3672. suffer v.(from)\u53d7\u75db\u82e6,\u60a3\u75c5;\u53d7\u635f\u5931;\u906d\u53d7;\u5fcd\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0xe58

    .line 3849
    const-string v3, "3673. infer v.\u63a8\u8bba,\u63a8\u65ad"

    aput-object v3, v0, v2

    const/16 v2, 0xe59

    .line 3850
    const-string v3, "3674. confer v.\u5546\u8ba8\uff1b\u6388\u4e88\uff0c\u9881\u7ed9(\u52cb\u8854\uff0c\u5b66\u4f4d\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0xe5a

    .line 3851
    const-string v3, "3675. transfer vt./n.\u8f6c\u79fb\uff1b\u8f6c\u6362\uff1b\u8f6c\u8ba9\uff1b\u8fc7\u6237\uff1b\u8fc1\u79fb\uff1b\u6539\u4e58"

    aput-object v3, v0, v2

    const/16 v2, 0xe5b

    .line 3852
    const-string v3, "3676. eager a.(for)\u6e34\u671b\u7684,\u70ed\u5207\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe5c

    .line 3853
    const-string v3, "3677. manager n.\u7ecf\u7406,\u7ba1\u7406\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe5d

    .line 3854
    const-string v3, "3678. teenager n.\u5341\u51e0\u5c81\u7684\u9752\u5c11\u5e74"

    aput-object v3, v0, v2

    const/16 v2, 0xe5e

    .line 3855
    const-string v3, "3679. stagger vi.\u6447\u6643\u7740\u79fb\u52a8;\u8e52\u8dda n.\u6447\u6643\u4e0d\u7a33\u7684\u52a8\u4f5c;\u8e52\u8dda"

    aput-object v3, v0, v2

    const/16 v2, 0xe5f

    .line 3856
    const-string v3, "3680. trigger n.\u6273\u673a vt.\u89e6\u53d1\uff0c\u5f15\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0xe60

    .line 3857
    const-string v3, "3681. tiger n\uff0e\u864e\uff1b\u8001\u864e"

    aput-object v3, v0, v2

    const/16 v2, 0xe61

    .line 3858
    const-string v3, "3682. anger n.\u6124\u6012\uff0c\u6c14\u6124 vt.\u4f7f\u53d1\u6012\uff0c\u6fc0\u6012 vi.\u53d1\u6012"

    aput-object v3, v0, v2

    const/16 v2, 0xe62

    .line 3859
    const-string v3, "3683. danger n.\u5371\u9669;\u5a01\u80c1;\u5371\u9669\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xe63

    .line 3860
    const-string v3, "3684. stranger n.\u964c\u751f\u4eba,\u751f\u5ba2;\u5916\u5730\u4eba,\u5916\u56fd\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe64

    .line 3861
    const-string v3, "3685. passenger n.\u4e58\u5ba2,\u65c5\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0xe65

    .line 3862
    const-string v3, "3686. messenger n.\u9001\u4fe1\u8005,\u4f7f\u8005,\u4f20\u4ee4\u5175"

    aput-object v3, v0, v2

    const/16 v2, 0xe66

    .line 3863
    const-string v3, "3687. finger n.\u624b\u6307;\u6307\u72b6\u7269;\u6307\u9488"

    aput-object v3, v0, v2

    const/16 v2, 0xe67

    .line 3864
    const-string v3, "3688. linger v.\u9017\u7559,\u5f98\u5f8a,\u62d6\u5ef6,\u7559\u604b,\u6d6a\u8d39\u5149\u9634,\u82df\u5ef6\u6b8b\u5598"

    aput-object v3, v0, v2

    const/16 v2, 0xe68

    .line 3865
    const-string v3, "3689. hunger n./v.\u9965\u997f;\u6e34\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0xe69

    .line 3866
    const-string v3, "3690. hamburger n.\u6c49\u5821\u5305,\u725b\u8089\u997c"

    aput-object v3, v0, v2

    const/16 v2, 0xe6a

    .line 3867
    const-string v3, "3691. her pron.[she\u7684\u5bbe\u683c]\u5979\uff1b[she\u7684\u6240\u6709\u683c]\u5979\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe6b

    .line 3868
    const-string v3, "3692. teacher n.\u6559\u5e08(\u5458)\uff0c\u8001(\u5bfc)\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xe6c

    .line 3869
    const-string v3, "3693. butcher n.\u5c60\u592b,\u5356\u8089\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xe6d

    .line 3870
    const-string v3, "3694. philosopher n.\u54f2\u5b66\u5bb6,\u54f2\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe6e

    .line 3871
    const-string v3, "3695. feather n.\u7fbd\u6bdb"

    aput-object v3, v0, v2

    const/16 v2, 0xe6f

    .line 3872
    const-string v3, "3696. leather n.\u76ae\u9769,\u76ae\u9769\u5236\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xe70

    .line 3873
    const-string v3, "3697. weather n.\u5929\u6c14,\u6c14\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0xe71

    .line 3874
    const-string v3, "3698. father n.\u7236\u4eb2\uff1b\u521b\u59cb\u4eba\uff0c\u53d1\u660e\u8005\uff1b(Father)\u795e\u7236"

    aput-object v3, v0, v2

    const/16 v2, 0xe72

    .line 3875
    const-string v3, "3699. gather v.\u805a\u96c6,\u805a\u62e2;\u63a8\u6d4b,\u63a8\u65ad"

    aput-object v3, v0, v2

    const/16 v2, 0xe73

    .line 3876
    const-string v3, "3700. rather ad.\u76f8\u5f53,\u6709\u4e00\u70b9\u513f;\u5b81\u613f,\u5b81\u53ef"

    aput-object v3, v0, v2

    const/16 v2, 0xe74

    .line 3877
    const-string v3, "3701. together ad.\u5171\u540c,\u4e00\u8d77;\u5408\u8d77\u6765,\u96c6\u62e2\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xe75

    .line 3878
    const-string v3, "3702. altogether ad.\u5b8c\u5168\uff0c\u603b\u4e4b\uff0c\u5168\u90e8\u5730\uff1b\u603b\u5171\uff1b\u603b\u800c\u8a00\u4e4b"

    aput-object v3, v0, v2

    const/16 v2, 0xe76

    .line 3879
    const-string v3, "3703. whether conj.\u662f\u5426\uff0c\u4f1a\u4e0d\u4f1a\uff0c\u4e0d\u7ba1\uff0c\u65e0\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0xe77

    .line 3880
    const-string v3, "3704. either ad.\u4e5f(\u4e0d) pron.\u4e24\u8005\u4e4b\u4e00 a.(\u4e24\u8005\u4e2d)\u4efb\u4e00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe78

    .line 3881
    const-string v3, "3705. neither a.\u4e24\u8005\u90fd\u4e0d pron.\u4e24\u8005\u90fd\u4e0d ad.\u4e5f\u4e0d"

    aput-object v3, v0, v2

    const/16 v2, 0xe79

    .line 3882
    const-string v3, "3706. other a.\u53e6\u5916\u7684\uff0c\u5176\u4ed6\u7684 n./pron.\u53e6\u4e00\u4e2a\u4eba(\u6216\u4e8b)"

    aput-object v3, v0, v2

    const/16 v2, 0xe7a

    .line 3883
    const-string v3, "3707. bother vt.\u6253\u6270\uff0c\u9ebb\u70e6 vi.\u62c5\u5fc3\uff0c\u70e6\u607c n.\u70e6\u607c\uff0c\u7126\u6025"

    aput-object v3, v0, v2

    const/16 v2, 0xe7b

    .line 3884
    const-string v3, "3708. mother n.\u6bcd\u4eb2"

    aput-object v3, v0, v2

    const/16 v2, 0xe7c

    .line 3885
    const-string v3, "3709. grandmother n.\u7956\u6bcd,\u5916\u7956\u6bcd"

    aput-object v3, v0, v2

    const/16 v2, 0xe7d

    .line 3886
    const-string v3, "3710. another a.\u53e6\u4e00\u4e2a\uff0c\u53c8\uff0c\u518d pron.\u53e6\u4e00\u4e2a\uff0c\u7c7b\u4f3c\u7684\u4e00\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0xe7e

    .line 3887
    const-string v3, "3711. brother n.\u5144\u5f1f;\u540c\u80de;\u6559\u53cb"

    aput-object v3, v0, v2

    const/16 v2, 0xe7f

    .line 3888
    const-string v3, "3712. farther ad.\u66f4\u8fdc\u5730,\u518d\u5f80\u524d\u5730 a.\u66f4\u8fdc\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe80

    .line 3889
    const-string v3, "3713. further ad./a.\u66f4\u8fdc,\u66f4\u5f80\u524d;\u8fdb\u4e00\u6b65 v.\u4fc3\u8fdb,\u589e\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0xe81

    .line 3890
    const-string v3, "3714. soldier n.\u58eb\u5175,\u519b\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe82

    .line 3891
    const-string v3, "3715. amplifier n.\u653e\u5927\u5668\uff0c\u6269\u5927\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xe83

    .line 3892
    const-string v3, "3716. cashier n.\u6536\u94f6\u5458,\u51fa\u7eb3\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xe84

    .line 3893
    const-string v3, "3717. premier n.\u9996\u76f8,\u603b\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0xe85

    .line 3894
    const-string v3, "3718. barrier n.\u6805\u680f,\u5c4f\u969c;\u969c\u788d(\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xe86

    .line 3895
    const-string v3, "3719. carrier n.\u642c\u8fd0\u4eba;\u8f7d\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xe87

    .line 3896
    const-string v3, "3720. frontier n.\u56fd\u5883,\u8fb9\u5883;\u5c16\u7aef,\u65b0\u9886\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0xe88

    .line 3897
    const-string v3, "3721. speaker n.\u8bf4\u8bdd\u8005\uff0c\u53d1\u8a00\u8005\uff1b\u8bf4\u67d0\u79cd\u8bed\u8a00\u8005\uff1b\u626c\u58f0\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xe89

    .line 3898
    const-string v3, "3722. loudspeaker n.\u626c\u58f0\u5668,\u6269\u97f3\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xe8a

    .line 3899
    const-string v3, "3723. locker n.\u66f4\u8863\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0xe8b

    .line 3900
    const-string v3, "3724. tanker n.\u6cb9\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0xe8c

    .line 3901
    const-string v3, "3725. worker n.\u5de5\u4eba\uff0c\u5de5\u4f5c\u8005\uff0c\u5de5\u4f5c\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xe8d

    .line 3902
    const-string v3, "3726. dealer n.\u5546\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe8e

    .line 3903
    const-string v3, "3727. ruler n.\u7edf\u6cbb\u8005,\u652f\u914d\u8005;\u5c3a,\u76f4\u5c3a"

    aput-object v3, v0, v2

    const/16 v2, 0xe8f

    .line 3904
    const-string v3, "3728. steamer n.\u6c7d\u8239,\u8f6e\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0xe90

    .line 3905
    const-string v3, "3729. hammer n.\u94c1\u9524,\u69cc,\u6994\u5934 v.\u9524\u51fb,\u6572\u6253"

    aput-object v3, v0, v2

    const/16 v2, 0xe91

    .line 3906
    const-string v3, "3730. summer n.\u590f\u5929\uff0c\u590f\u5b63 a.\u590f\u5b63\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe92

    .line 3907
    const-string v3, "3731. customer n.\u987e\u5ba2,\u4e3b\u987e"

    aput-object v3, v0, v2

    const/16 v2, 0xe93

    .line 3908
    const-string v3, "3732. farmer n.\u519c\u6c11,\u519c\u573a\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0xe94

    .line 3909
    const-string v3, "3733. former a.\u4ee5\u524d\u7684,\u5728\u524d\u7684 pron.\u524d\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xe95

    .line 3910
    const-string v3, "3734. foreigner n.\u5916\u56fd\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xe96

    .line 3911
    const-string v3, "3735. container n.\u5bb9\u5668;\u96c6\u88c5\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0xe97

    .line 3912
    const-string v3, "3736. liner n.\u73ed\u673a,\u5b9a\u671f\u8f6e\u8239,\u90ae\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0xe98

    .line 3913
    const-string v3, "3737. banner n.\u65d7(\u5e1c)"

    aput-object v3, v0, v2

    const/16 v2, 0xe99

    .line 3914
    const-string v3, "3738. manner n.\u65b9\u5f0f;\u4e3e\u6b62;(pl.)\u98ce\u5ea6,\u793c\u8c8c;\u89c4\u77e9;\u98ce\u4fd7"

    aput-object v3, v0, v2

    const/16 v2, 0xe9a

    .line 3915
    const-string v3, "3739. inner a.\u5185\u90e8\u7684,\u91cc\u9762\u7684;\u5185\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xe9b

    .line 3916
    const-string v3, "3740. dinner n.\u6b63\u9910,\u5bb4\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xe9c

    .line 3917
    const-string v3, "3741. practitioner n.\u5b9e\u8df5\u8005\uff0c\u4ece\u4e8b\u8005\uff1b(\u533b\u751f\u6216\u5f8b\u5e08\u7b49)\u5f00\u4e1a\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xe9d

    .line 3918
    const-string v3, "3742. prisoner n.\u56da\u72af"

    aput-object v3, v0, v2

    const/16 v2, 0xe9e

    .line 3919
    const-string v3, "3743. corner n.\u89d2\uff0c\u8857\u89d2\uff1b\u504f\u50fb\u5904\uff1b vt.\u5c06\u2026\u903c\u5165\u56f0\u5883\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0xe9f

    .line 3920
    const-string v3, "3744. partner n.\u5408\u4f5c\u8005,\u5408\u4f19\u4eba,\u5408\u80a1\u4eba,\u4f19\u4f34,\u821e\u4f34,\u914d\u5076"

    aput-object v3, v0, v2

    const/16 v2, 0xea0

    .line 3921
    const-string v3, "3745. owner n.\u7269\u4e3b,\u6240\u6709\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xea1

    .line 3922
    const-string v3, "3746. per prep.\u6bcf;\u7ecf,\u7531"

    aput-object v3, v0, v2

    const/16 v2, 0xea2

    .line 3923
    const-string v3, "3747. paper n.\u7eb8\uff1b\u7eb8\u5236\u54c1\uff1b\u62a5\u7eb8\uff1b(pl)\u6587\u4ef6\uff1b\u8bd5\u5377\uff1b\u8bba\u6587"

    aput-object v3, v0, v2

    const/16 v2, 0xea3

    .line 3924
    const-string v3, "3748. newspaper n.\u62a5\u7eb8"

    aput-object v3, v0, v2

    const/16 v2, 0xea4

    .line 3925
    const-string v3, "3749. skyscraper n.\u6469\u5929\u5927\u697c"

    aput-object v3, v0, v2

    const/16 v2, 0xea5

    .line 3926
    const-string v3, "3750. shopkeeper n.\u5e97\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0xea6

    .line 3927
    const-string v3, "3751. hamper v.\u59a8\u788d,\u963b\u788d,\u7275\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xea7

    .line 3928
    const-string v3, "3752. temper n.\u813e\u6c14\uff1b\u97e7\u5ea6vt.\u8c03\u548c\uff0c\u4f7f\u7f13\u548c\uff1b\u4f7f\u56de\u706b"

    aput-object v3, v0, v2

    const/16 v2, 0xea8

    .line 3929
    const-string v3, "3753. proper a.\u9002\u5408\u7684;\u5408\u4e4e\u4f53\u7edf\u7684;\u56fa\u6709\u7684;\u6709\u793c\u8c8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xea9

    .line 3930
    const-string v3, "3754. pepper n.\u80e1\u6912\u7c89,\u80e1\u6912;\u8fa3\u6912"

    aput-object v3, v0, v2

    const/16 v2, 0xeaa

    .line 3931
    const-string v3, "3755. slipper n.\u4fbf\u978b,\u62d6\u978b"

    aput-object v3, v0, v2

    const/16 v2, 0xeab

    .line 3932
    const-string v3, "3756. copper n.\u94dc;\u94dc\u5e01,\u94dc\u5236\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xeac

    .line 3933
    const-string v3, "3757. upper a.\u4e0a\u9762\u7684;\u4e0a\u90e8\u7684,\u8f83\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xead

    .line 3934
    const-string v3, "3758. supper n.\u665a\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0xeae

    .line 3935
    const-string v3, "3759. whisper v.\u8033\u8bed;\u79c1\u4e0b\u8bf4,\u5077\u5077\u544a\u8bc9 n.\u8033\u8bed;\u4f20\u95fb"

    aput-object v3, v0, v2

    const/16 v2, 0xeaf

    .line 3936
    const-string v3, "3760. prosper v.\u6210\u529f,\u5174\u9686,\u660c\u76db,\u4f7f\u6210\u529f,\u4f7f\u660c\u9686,\u7e41\u8363"

    aput-object v3, v0, v2

    const/16 v2, 0xeb0

    .line 3937
    const-string v3, "3761. super a.\u6781\u597d\u7684,\u8d85\u7ea7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xeb1

    .line 3938
    const-string v3, "3762. laser n.\u6fc0\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0xeb2

    .line 3939
    const-string v3, "3763. cater vi.(for/to)\u6ee1\u8db3,\u8fce\u5408;(for)\u63d0\u4f9b\u996e\u98df\u53ca\u670d\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0xeb3

    .line 3940
    const-string v3, "3764. theater n.(theatre)\u620f\u9662;\u620f\u5267;\u9636\u68af\u6559\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0xeb4

    .line 3941
    const-string v3, "3765. sweater n.\u6bdb\u8863,\u7ed2\u8863,\u539a\u8fd0\u52a8\u886b"

    aput-object v3, v0, v2

    const/16 v2, 0xeb5

    .line 3942
    const-string v3, "3766. later ad.\u540e\u6765,\u8fc7\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0xeb6

    .line 3943
    const-string v3, "3767. water n.\u6c34 vt.\u6d47\u704c\uff1b\u7ed9\u2026\u996e\u6c34 vi.\u6d41\u6cea\uff0c\u52a0\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0xeb7

    .line 3944
    const-string v3, "3768. character n.\u6027\u683c,\u54c1\u8d28,\u7279\u6027;\u4eba\u7269,\u89d2\u8272;\u5b57\u7b26,(\u6c49)\u5b57"

    aput-object v3, v0, v2

    const/16 v2, 0xeb8

    .line 3945
    const-string v3, "3769. diameter n.\u76f4\u5f84"

    aput-object v3, v0, v2

    const/16 v2, 0xeb9

    .line 3946
    const-string v3, "3770. parameter n.\u53c2\u6570,\u53c2\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xeba

    .line 3947
    const-string v3, "3771. millimeter n.(millimetre)\u6beb\u7c73"

    aput-object v3, v0, v2

    const/16 v2, 0xebb

    .line 3948
    const-string v3, "3772. thermometer n.\u6e29\u5ea6\u8ba1"

    aput-object v3, v0, v2

    const/16 v2, 0xebc

    .line 3949
    const-string v3, "3773. after prep.\u5728...\u4ee5\u540e\uff1b\u5728...\u540e\u9762 adv.\u4ee5\u540e\uff0c\u540e\u6765"

    aput-object v3, v0, v2

    const/16 v2, 0xebd

    .line 3950
    const-string v3, "3774. thereafter ad.\u6b64\u540e,\u4ee5\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0xebe

    .line 3951
    const-string v3, "3775. daughter n.\u5973\u513f"

    aput-object v3, v0, v2

    const/16 v2, 0xebf

    .line 3952
    const-string v3, "3776. laughter n.\u7b11,\u7b11\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xec0

    .line 3953
    const-string v3, "3777. slaughter n.\u5c60\u6740\uff0c\u5c60\u5bb0 vt.\u5c60\u6740\uff0c\u5bb0\u6740"

    aput-object v3, v0, v2

    const/16 v2, 0xec1

    .line 3954
    const-string v3, "3778. waiter n.\u4f8d\u8005,\u670d\u52a1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xec2

    .line 3955
    const-string v3, "3779. "

    aput-object v3, v0, v2

    const/16 v2, 0xec3

    .line 3956
    const-string v3, "3780. "

    aput-object v3, v0, v2

    const/16 v2, 0xec4

    .line 3957
    const-string v3, "3781. typewriter n.\u6253\u5b57\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xec5

    .line 3958
    const-string v3, "3782. alter vt.\u6539\u53d8\uff0c\u66f4\u6539\uff1b\u6539\u505a(\u8863\u670d) vi.\u6539\u53d8\uff0c\u53d8\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0xec6

    .line 3959
    const-string v3, "3783. shelter n.\u63a9\u853d\u5904;\u63a9\u853d,\u4fdd\u62a4 v.\u63a9\u853d,\u8eb2\u907f,\u5e87\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0xec7

    .line 3960
    const-string v3, "3784. filter n.\u6ee4\u5668,\u6ee4\u7eb8"

    aput-object v3, v0, v2

    const/16 v2, 0xec8

    .line 3961
    const-string v3, "3785. enter vt.\u8fdb\u5165\uff1b\u53c2\u52a0\uff0c\u52a0\u5165\uff1b\u5199\u5165 vi.\u8fdb\u53bb\uff0c\u8fdb\u6765"

    aput-object v3, v0, v2

    const/16 v2, 0xec9

    .line 3962
    const-string v3, "3786. carpenter n.\u6728\u5de5,\u6728\u5320"

    aput-object v3, v0, v2

    const/16 v2, 0xeca

    .line 3963
    const-string v3, "3787. painter n.\u6f06\u5de5,\u753b\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0xecb

    .line 3964
    const-string v3, "3788. winter n.\u51ac\u5b63\uff0c\u51ac\u5929"

    aput-object v3, v0, v2

    const/16 v2, 0xecc

    .line 3965
    const-string v3, "3789. counter n.\u67dc\u53f0;\u8ba1\u6570\u5668 a./ad.\u76f8\u53cd(\u7684) v.\u53cd\u5bf9,\u53cd\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0xecd

    .line 3966
    const-string v3, "3790. encounter n./v.\u9047\u5230,\u906d\u9047"

    aput-object v3, v0, v2

    const/16 v2, 0xece

    .line 3967
    const-string v3, "3791. chapter n. \u7ae0\uff1b\u56de\uff0c\u7bc7"

    aput-object v3, v0, v2

    const/16 v2, 0xecf

    .line 3968
    const-string v3, "3792. helicopter n.\u76f4\u5347(\u98de)\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xed0

    .line 3969
    const-string v3, "3793. charter v.\u79df\u8239,\u79df\u8f66,\u79df\u7528\u98de\u673a\uff1bn.\u5baa\u7ae0\uff0c\u7279\u8bb8\u72b6"

    aput-object v3, v0, v2

    const/16 v2, 0xed1

    .line 3970
    const-string v3, "3794. quarter n.\u56db\u5206\u4e4b\u4e00;\u5b63;\u4e00\u523b\u949f;(pl.)\u65b9\u5411;(pl.)\u4f4f\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0xed2

    .line 3971
    const-string v3, "3795. porter n.\u5b88\u95e8\u4eba,\u95e8\u623f,\u884c\u674e\u642c\u8fd0\u5de5,\u670d\u52a1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xed3

    .line 3972
    const-string v3, "3796. reporter n.\u62a5\u544a\u4eba,\u901a\u8baf\u5458;\u8bb0\u8005,\u62a5\u5bfc\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xed4

    .line 3973
    const-string v3, "3797. Easter n.\u590d\u6d3b\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0xed5

    .line 3974
    const-string v3, "3798. plaster n.\u7070\u6ce5;\u719f\u77f3\u818f;\u818f\u836f"

    aput-object v3, v0, v2

    const/16 v2, 0xed6

    .line 3975
    const-string v3, "3799. master n.\u7537\u4e3b\u4eba;\u5e08\u5085;\u7855\u58eb v.\u7cbe\u901a,\u63a7\u5236 a.\u4e3b\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xed7

    .line 3976
    const-string v3, "3800. headmaster n.\u6821\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xed8

    .line 3977
    const-string v3, "3801. disaster n.\u707e\u96be,\u5927\u7978;\u5f7b\u5e95\u7684\u5931\u8d25"

    aput-object v3, v0, v2

    const/16 v2, 0xed9

    .line 3978
    const-string v3, "3802. semester n.\u5b66\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0xeda

    .line 3979
    const-string v3, "3803. youngster n.\u5c0f\u4f19\u5b50\uff0c\u5e74\u8f7b\u4eba\uff1b\u5c11\u5e74\uff0c\u513f\u7ae5"

    aput-object v3, v0, v2

    const/16 v2, 0xedb

    .line 3980
    const-string v3, "3804. register n./v.\u767b\u8bb0,\u6ce8\u518c v.(\u4eea\u8868\u7b49)\u6307\u793a,(\u90ae\u4ef6)\u6302\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0xedc

    .line 3981
    const-string v3, "3805. minister n.\u90e8\u957f,\u5927\u81e3"

    aput-object v3, v0, v2

    const/16 v2, 0xedd

    .line 3982
    const-string v3, "3806. administer v.\u65bd\u884c\uff0c\u5b9e\u65bd\uff1b\u638c\u7ba1\uff0c\u6599\u7406...\u7684\u4e8b\u52a1\uff1b\u7ed9\u4e88"

    aput-object v3, v0, v2

    const/16 v2, 0xede

    .line 3983
    const-string v3, "3807. sister n.\u59d0\uff0c\u59b9\uff1b\u62a4\u58eb\u957f\uff1b\u4fee\u5973\uff0c\u5973\u6559\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0xedf

    .line 3984
    const-string v3, "3808. monster n.\u602a\u7269,\u5996\u602a,\u7578\u5f62\u7684\u52a8\u690d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xee0

    .line 3985
    const-string v3, "3809. foster vt.\u517b\u80b2;\u6536\u517b;\u6000\u62b1;\u9f13\u52b1 a.\u6536\u517b\u7684 n.\u517b\u80b2\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xee1

    .line 3986
    const-string v3, "3810. poster n\u6d77\u62a5,\u5f20\u8d34\u7684\u5927\u5e45\u5e7f\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0xee2

    .line 3987
    const-string v3, "3811. cluster n.\u4e1b,\u7fa4,\u4e32 v.\u7fa4\u96c6,\u4e1b\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xee3

    .line 3988
    const-string v3, "3812. scatter v.\u6563\u5f00,\u9a71\u6563;\u6563\u5e03,\u6563\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0xee4

    .line 3989
    const-string v3, "3813. shatter n.\u788e\u7247\uff1b\u7c89\u788e\u3000v.\u7c89\u788e\uff1b\u4f7f\u75b2\u60eb\uff1b\u4f7f\u9707\u9a87"

    aput-object v3, v0, v2

    const/16 v2, 0xee5

    .line 3990
    const-string v3, "3814. latter a.\u540e\u8005\u7684\uff1b\u540e\u4e00\u534a\u7684\uff0c\u63a5\u8fd1\u7ec8\u4e86\u7684 n.\u540e\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xee6

    .line 3991
    const-string v3, "3815. flatter vt.\u5949\u627f;\u4f7f\u9ad8\u5174;\u4f7f\u6ee1\u610f;\u80dc\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xee7

    .line 3992
    const-string v3, "3816. matter n.\u7269\u8d28,\u7269\u4f53;\u6bdb\u75c5,\u9ebb\u70e6;\u4e8b\u60c5 v.\u6709\u5173\u7cfb,\u8981\u7d27"

    aput-object v3, v0, v2

    const/16 v2, 0xee8

    .line 3993
    const-string v3, "3817. better a.\u8f83\u597d\u7684 ad.\u66f4\u597d(\u5730) v.\u6539\u826f n.\u8f83\u4f73\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xee9

    .line 3994
    const-string v3, "3818. letter n.\u4fe1,\u51fd\u4ef6;\u5b57\u6bcd,\u6587\u5b57"

    aput-object v3, v0, v2

    const/16 v2, 0xeea

    .line 3995
    const-string v3, "3819. bitter a.(\u6709)\u82e6(\u5473)\u7684;\u75db\u82e6\u7684,\u5389\u5bb3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xeeb

    .line 3996
    const-string v3, "3820. litter n.\u5783\u573e,(\u6742\u4e71\u7684)\u5e9f\u7269 v.\u4f7f\u6742\u4e71,\u4e71\u4e22"

    aput-object v3, v0, v2

    const/16 v2, 0xeec

    .line 3997
    const-string v3, "3821. glitter n.\u5149\u8f89,\u707f\u70c2 v.\u95ea\u95ea\u53d1\u5149;\u95ea\u8000"

    aput-object v3, v0, v2

    const/16 v2, 0xeed

    .line 3998
    const-string v3, "3822. utter v.\u8bf4,\u53d1\u51fa(\u58f0\u97f3) a.\u5f7b\u5e95\u7684,\u5b8c\u5168\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xeee

    .line 3999
    const-string v3, "3823. butter n.\u9ec4\u6cb9,\u5976\u6cb9 v.\u6d82\u9ec4\u6cb9\u4e8e\u2026\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0xeef

    .line 4000
    const-string v3, "3824. shutter n.\u767e\u53f6\u7a97\uff1b(\u7167\u76f8\u673a)\u5feb\u95e8\uff1b\u5173\u95ed\u88c5\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0xef0

    .line 4001
    const-string v3, "3825. mutter n.\u5583\u5583\u800c\u8bed,\u5c0f\u58f0\u4f4e\u8bed;\u62b1\u6028 v.\u4f4e\u58f0\u8bf4,\u62b1\u6028"

    aput-object v3, v0, v2

    const/16 v2, 0xef1

    .line 4002
    const-string v3, "3826. outer a.\u5916\u90e8\u7684,\u5916\u9762\u7684,\u5916\u5c42\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xef2

    .line 4003
    const-string v3, "3827. computer n.\u8ba1\u7b97\u673a,\u7535\u8111;\u8ba1\u7b97\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xef3

    .line 4004
    const-string v3, "3828. conquer v.\u5f81\u670d,\u6218\u80dc,\u5360\u9886;\u514b\u670d,\u7834\u9664(\u574f\u4e60\u60ef\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0xef4

    .line 4005
    const-string v3, "3829. ever ad.\u66fe\u7ecf\uff1b\u6c38\u8fdc\uff1b\u5728\u4efb\u4f55\u65f6\u5019\uff1b\u7a76\u7adf"

    aput-object v3, v0, v2

    const/16 v2, 0xef5

    .line 4006
    const-string v3, "3830. fever n.\u53d1\u70ed,\u72c2\u70ed"

    aput-object v3, v0, v2

    const/16 v2, 0xef6

    .line 4007
    const-string v3, "3831. whichever pron./a.\u65e0\u8bba\u54ea\u4e2a,\u65e0\u8bba\u54ea\u4e9b"

    aput-object v3, v0, v2

    const/16 v2, 0xef7

    .line 4008
    const-string v3, "3832. lever n.\u6746,\u6760\u6746,\u624b\u6bb5,\u9014\u5f84,\u5de5\u5177"

    aput-object v3, v0, v2

    const/16 v2, 0xef8

    .line 4009
    const-string v3, "3833. clever a.\u806a\u660e\u7684,\u4f36\u4fd0\u7684,\u673a\u654f\u7684,\u7cbe\u5de7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xef9

    .line 4010
    const-string v3, "3834. never ad.\u6c38\u4e0d\uff0c\u4ece\u4e0d\uff0c\u51b3\u4e0d\uff1b\u4ece\u6765\u6ca1\u6709\uff1b\u4e0d\uff0c\u6ca1\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0xefa

    .line 4011
    const-string v3, "3835. whenever conj.\u65e0\u8bba\u4f55\u65f6,\u968f\u65f6;\u6bcf\u5f53"

    aput-object v3, v0, v2

    const/16 v2, 0xefb

    .line 4012
    const-string v3, "3836. whoever pron.[\u5f15\u5bfc\u540d\u8bcd\u4ece\u53e5]\u8c01\uff1b\u65e0\u8bba\u8c01\uff1b\u7a76\u7adf\u662f\u8c01"

    aput-object v3, v0, v2

    const/16 v2, 0xefc

    .line 4013
    const-string v3, "3837. whatsoever ad.(\u7528\u4e8e\u5426\u5b9a\u53e5\u4e2d\u4ee5\u52a0\u5f3a\u8bed\u6c14)\u4efb\u4f55"

    aput-object v3, v0, v2

    const/16 v2, 0xefd

    .line 4014
    const-string v3, "3838. wherever conj.\u65e0\u8bba\u5728\u54ea\u91cc ad.\u65e0\u8bba\u5728\u54ea\u91cc,\u7a76\u7adf\u5728\u54ea\u91cc"

    aput-object v3, v0, v2

    const/16 v2, 0xefe

    .line 4015
    const-string v3, "3839. forever adv.(for ever)\u6c38\u8fdc\uff1b\u603b\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0xeff

    .line 4016
    const-string v3, "3840. whatever pron.\u65e0\u8bba\u4ec0\u4e48 a.\u65e0\u8bba\u4ec0\u4e48\u6837\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf00

    .line 4017
    const-string v3, "3841. however ad.\u7136\u800c\uff0c\u53ef\u662f\uff0c\u4e0d\u8fc7\uff0c\u65e0\u8bba\u5982\u4f55 conj.\u65e0\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0xf01

    .line 4018
    const-string v3, "3842. shiver v./n.\u6218\u6817,\u53d1\u6296"

    aput-object v3, v0, v2

    const/16 v2, 0xf02

    .line 4019
    const-string v3, "3843. liver n.\u809d,\u809d\u810f"

    aput-object v3, v0, v2

    const/16 v2, 0xf03

    .line 4020
    const-string v3, "3844. deliver v.\u4ea4\u4ed8,\u9012\u9001;\u53d1\u8868,\u8868\u8fbe;\u91ca\u653e;\u63a5\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xf04

    .line 4021
    const-string v3, "3845. river n.\u6cb3\u6d41"

    aput-object v3, v0, v2

    const/16 v2, 0xf05

    .line 4022
    const-string v3, "3846. driver n.\u9a7e\u9a76\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xf06

    .line 4023
    const-string v3, "3847. quiver v./n.\u98a4\u6296,\u6296\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xf07

    .line 4024
    const-string v3, "3848. silver n.\u94f6;\u94f6\u5668;\u94f6\u5e01 v.\u9540\u94f6"

    aput-object v3, v0, v2

    const/16 v2, 0xf08

    .line 4025
    const-string v3, "3849. over ad.\u5728\u4e0a\u65b9\uff1b\u904d\u53ca\u5730 prep.\u5728\u7684\u4e0a\u65b9 a.\u7ed3\u675f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf09

    .line 4026
    const-string v3, "3850. cover v.\u8986\u76d6,\u5305\u62ec,\u6d89\u53ca n.\u76d6\u5b50,\u5957\u5b50;(\u4e66\u7684)\u5c01\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0xf0a

    .line 4027
    const-string v3, "3851. recover v.\u6536\u56de;(from)\u6062\u590d,\u75ca\u6108;\u91cd\u65b0\u83b7\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0xf0b

    .line 4028
    const-string v3, "3852. uncover v.\u63ed\u5f00,\u63ed\u9732"

    aput-object v3, v0, v2

    const/16 v2, 0xf0c

    .line 4029
    const-string v3, "3853. discover v.\u53d1\u73b0,\u663e\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0xf0d

    .line 4030
    const-string v3, "3854. moreover conj./ad.\u518d\u8005,\u52a0\u4e4b,\u800c\u4e14"

    aput-object v3, v0, v2

    const/16 v2, 0xf0e

    .line 4031
    const-string v3, "3855. hover vi.(\u9e1f)\u76d8\u65cb\uff0c\u7ff1\u7fd4\uff0c(\u4eba)\u9017\u7559\u5728\u9644\u8fd1\u5f98\u5f8a"

    aput-object v3, v0, v2

    const/16 v2, 0xf0f

    .line 4032
    const-string v3, "3856. lover n.\u7231\u597d\u8005;(pl.)\u60c5\u4fa3"

    aput-object v3, v0, v2

    const/16 v2, 0xf10

    .line 4033
    const-string v3, "3857. turnover n.\u7ffb\u5012(\u7269);\u4eba\u5458\u8c03\u6574;(\u8d44\u91d1\u7b49)\u5468\u8f6c;\u8425\u4e1a\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0xf11

    .line 4034
    const-string v3, "3858. maneuver n.(manoeuvre)\u673a\u52a8;\u8fd0\u7528,\u64cd\u4f5c; v.\u673a\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xf12

    .line 4035
    const-string v3, "3859. drawer n.\u62bd\u5c49"

    aput-object v3, v0, v2

    const/16 v2, 0xf13

    .line 4036
    const-string v3, "3860. shower n.\u9635\u96e8;\u6c90\u6d74;(\u4e00)\u9635/\u5927\u6279v.\u4e0b\u9635\u96e8,\u503e\u6ce8"

    aput-object v3, v0, v2

    const/16 v2, 0xf14

    .line 4037
    const-string v3, "3861. lower a.\u8f83\u4f4e\u7684,\u4e0b\u7ea7\u7684,\u4e0b\u6e38\u7684 v.\u964d\u4e0b,\u653e\u4f4e"

    aput-object v3, v0, v2

    const/16 v2, 0xf15

    .line 4038
    const-string v3, "3862. flower n.\u82b1\uff1b\u7cbe\u534e\uff0c\u7cbe\u7cb9\uff0c\u7cbe\u82f1\uff1b\u76db\u65f6 vi.\u5f00\u82b1"

    aput-object v3, v0, v2

    const/16 v2, 0xf16

    .line 4039
    const-string v3, "3863. power n.\u529b,\u7cbe\u529b;\u529f\u7387,\u7535\u529b;(\u6570\u5b66)\u5e42;\u6743\u529b,\u52bf\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xf17

    .line 4040
    const-string v3, "3864. horsepower n.[\u673a]\u9a6c\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0xf18

    .line 4041
    const-string v3, "3865. tower n.\u5854 v.\u9ad8\u8038"

    aput-object v3, v0, v2

    const/16 v2, 0xf19

    .line 4042
    const-string v3, "3866. answer vt.\u56de\u7b54\uff0c\u7b54\u590d\uff0c\u7b54\u6848 v.\u56de\u7b54\uff0c\u7b54\u590d\uff0c\u54cd\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0xf1a

    .line 4043
    const-string v3, "3867. layer n.\u5c42\uff0c\u5c42\u6b21\uff1b\u94fa\u8bbe\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf1b

    .line 4044
    const-string v3, "3868. prayer n.\u7948\u7977,\u7977\u544a,\u7977\u6587"

    aput-object v3, v0, v2

    const/16 v2, 0xf1c

    .line 4045
    const-string v3, "3869. employer n.\u96c7\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0xf1d

    .line 4046
    const-string v3, "3870. lawyer n.\u5f8b\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xf1e

    .line 4047
    const-string v3, "3871. fertilizer n.(fertiliser)\u80a5\u6599"

    aput-object v3, v0, v2

    const/16 v2, 0xf1f

    .line 4048
    const-string v3, "3872. air n.\u7a7a\u6c14\uff1b(\u590d\u6570)\u795e\u6c14 vt.(\u4f7f)\u901a\u98ce\uff1b\u667e\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0xf20

    .line 4049
    const-string v3, "3873. fair a.\u516c\u5e73\u7684,\u5408\u7406\u7684;\u76f8\u5f53\u7684 n.\u96c6\u5e02,\u4ea4\u6613\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xf21

    .line 4050
    const-string v3, "3874. affair n.[pl.]\u4e8b\u52a1\uff1b\u4e8b\u60c5(\u4ef6)\uff1b(\u4e2a\u4eba\u7684)\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0xf22

    .line 4051
    const-string v3, "3875. hair n.\u6bdb\u53d1\uff0c\u5934\u53d1\uff1b\u7ed2\u6bdb\uff0c\u6bdb\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0xf23

    .line 4052
    const-string v3, "3876. chair n.\u6905\u5b50\uff1b(\u4f1a\u8bae\u7684)\u4e3b\u5e2d vt.\u5f53\u2026\u7684\u4e3b\u5e2d\uff0c\u4e3b\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0xf24

    .line 4053
    const-string v3, "3877. pair n.\u4e00\u5bf9,\u4e00\u53cc;\u4e00\u526f;\u592b\u5987 v.\u914d\u5bf9,\u6210\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0xf25

    .line 4054
    const-string v3, "3878. repair n.\u4fee\u7406,\u4fee\u8865 v.\u8865\u6551,\u7ea0\u6b63;\u4fee\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0xf26

    .line 4055
    const-string v3, "3879. impair v.\u635f\u5bb3,\u635f\u4f24;\u524a\u5f31,\u51cf\u5c11"

    aput-object v3, v0, v2

    const/16 v2, 0xf27

    .line 4056
    const-string v3, "3880. despair n.\u7edd\u671b;\u5931\u671b;\u4ee4\u4eba\u5931\u671b\u7684\u4eba(\u4e8b\u7269)v.\u7edd\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0xf28

    .line 4057
    const-string v3, "3881. stair n.(pl.)\u697c\u68af"

    aput-object v3, v0, v2

    const/16 v2, 0xf29

    .line 4058
    const-string v3, "3882. heir n.\u7ee7\u627f\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xf2a

    .line 4059
    const-string v3, "3883. their pron..[they\u7684\u6240\u6709\u683c]\u4ed6(\u5979\u3001\u5b83)\u4eec\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf2b

    .line 4060
    const-string v3, "3884. reservoir n.\u6c34\u5e93,\u84c4\u6c34\u6c60"

    aput-object v3, v0, v2

    const/16 v2, 0xf2c

    .line 4061
    const-string v3, "3885. sir n.\u5148\u751f\uff0c\u957f\u5b98\uff1b[S -\u7528\u4e8e\u59d3\u540d\u524d]\u2026\u7235\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0xf2d

    .line 4062
    const-string v3, "3886. stir v.\u6405\u62cc,\u6405\u52a8;\u52a8,\u6447\u52a8;\u6fc0\u52a8;\u8f70\u52a8;\u717d\u52a8,\u9f13\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0xf2e

    .line 4063
    const-string v3, "3887. or conj.\u6216\uff0c\u6216\u8005(\u8868\u793a\u9009\u62e9)\uff1b\u5373\uff0c\u5927\u7ea6\uff1b\u5426\u5219"

    aput-object v3, v0, v2

    const/16 v2, 0xf2f

    .line 4064
    const-string v3, "3888. labor n.(labour)\u5de5\u4f5c\uff0c\u52b3\u52a8\uff1b\u52b3\u529b v.\u52b3\u52a8\uff0c\u82e6\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0xf30

    .line 4065
    const-string v3, "3889. neighbor n.(neighbour)\u90bb\u5c45"

    aput-object v3, v0, v2

    const/16 v2, 0xf31

    .line 4066
    const-string v3, "3890. harbor n.(harbour)\u6d77\u6e2f;\u907f\u96be\u6240 v.\u9690\u533f,\u7a9d\u85cf"

    aput-object v3, v0, v2

    const/16 v2, 0xf32

    .line 4067
    const-string v3, "3891. ambassador n.\u5927\u4f7f\uff1b\u7279\u4f7f\uff0c(\u6d3e\u9a7b\u56fd\u9645\u7ec4\u7ec7\u7684)\u4ee3\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0xf33

    .line 4068
    const-string v3, "3892. corridor n.\u8d70\u5eca,\u901a\u8def"

    aput-object v3, v0, v2

    const/16 v2, 0xf34

    .line 4069
    const-string v3, "3893. odor n.(odour)\u6c14\u5473,\u9999\u5473,\u81ed\u5473,\u540d\u58f0"

    aput-object v3, v0, v2

    const/16 v2, 0xf35

    .line 4070
    const-string v3, "3894. for prep.\u4e3a\u4e86\uff1b\u7ed9\uff1b\u4ee3\u66ff\uff1b\u5411\uff1b\u652f\u6301 conj.\u56e0\u4e3a?"

    aput-object v3, v0, v2

    const/16 v2, 0xf36

    .line 4071
    const-string v3, "3895. anchor n./v.\u951a\uff1b\u5371\u96be\u65f6\u53ef\u4f9d\u9760\u7684\u4eba\u6216\u7269\uff1b\u7528\u951a\u6cca\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0xf37

    .line 4072
    const-string v3, "3896. metaphor n.\u9690\u55bb\uff0c\u6697\u55bb"

    aput-object v3, v0, v2

    const/16 v2, 0xf38

    .line 4073
    const-string v3, "3897. author n.\u4f5c\u8005\uff0c\u4f5c\u5bb6\uff0c\u8457\u4f5c\u4eba\uff1b\u521b\u59cb\u4eba\uff0c\u53d1\u8d77\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xf39

    .line 4074
    const-string v3, "3898. senior a.\u5e74\u957f\u7684;\u5730\u4f4d\u8f83\u9ad8\u7684 n.(\u5927\u5b66)\u56db\u5e74\u7ea7\u5b66\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0xf3a

    .line 4075
    const-string v3, "3899. junior a./n.\u5e74\u5c11\u7684/\u8005,\u4e09\u5e74\u7ea7\u7684/\u5b66\u751f,\u4e0b\u7ea7(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0xf3b

    .line 4076
    const-string v3, "3900. inferior a.\u4e0b\u7b49\u7684,\u4e0b\u7ea7\u7684;\u52a3\u7b49\u7684,\u5dee\u7684 n.\u4e0b\u7ea7,\u665a\u8f88"

    aput-object v3, v0, v2

    const/16 v2, 0xf3c

    .line 4077
    const-string v3, "3901. superior a.\u4f18\u826f\u7684,\u5353\u8d8a\u7684;\u4e0a\u7ea7\u7684 n.\u4e0a\u7ea7;\u957f\u8005;\u9ad8\u624b"

    aput-object v3, v0, v2

    const/16 v2, 0xf3d

    .line 4078
    const-string v3, "3902. interior a.\u5185\u90e8\u7684,\u91cc\u9762\u7684 n.\u5185\u90e8,\u5185\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xf3e

    .line 4079
    const-string v3, "3903. exterior a.\u5916\u90e8\u7684,\u5916\u9762\u7684 n.\u5916\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0xf3f

    .line 4080
    const-string v3, "3904. prior a.\u4f18\u5148\u7684,\u5728\u524d\u7684;(to)\u5728\u2026\u4e4b\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0xf40

    .line 4081
    const-string v3, "3905. behavior n.(behaviour)\u884c\u4e3a,\u4e3e\u6b62\uff1b(\u673a\u5668\u7b49)\u8fd0\u8f6c\u60c5\u51b5"

    aput-object v3, v0, v2

    const/16 v2, 0xf41

    .line 4082
    const-string v3, "3906. major a.\u4e3b\u8981\u7684n.\u6210\u5e74\u4eba,\u4e13\u4e1a\u5b66\u751f,\u4e3b\u4fee\u8bfe\u7a0bv.\u4e3b\u4fee"

    aput-object v3, v0, v2

    const/16 v2, 0xf42

    .line 4083
    const-string v3, "3907. bachelor n.\u5355\u8eab\u6c49;(\u4ea6\u4f5cB-)\u5b66\u58eb(\u5b66\u4f4d)"

    aput-object v3, v0, v2

    const/16 v2, 0xf43

    .line 4084
    const-string v3, "3908. sailor n.\u6c34\u624b,\u6d77\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xf44

    .line 4085
    const-string v3, "3909. tailor n.\u88c1\u7f1d v.\u7f1d\u5236,\u526a\u88c1"

    aput-object v3, v0, v2

    const/16 v2, 0xf45

    .line 4086
    const-string v3, "3910. chancellor n.(\u82f1)\u5927\u81e3\uff1b\u6cd5\u5b98\uff1b(\u5fb7\u3001\u5965)\u603b\u7406\uff1b\u5927\u5b66\u6821\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xf46

    .line 4087
    const-string v3, "3911. color n.(=colour)\u989c\u8272\uff1b\u989c\u6599\uff1b\u80a4\u8272 v.\u7ed9\u2026\u7740\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0xf47

    .line 4088
    const-string v3, "3912. glamor n.(glamour)\u9b45\u529b;\u9b54\u6cd5 vt.\u8ff7\u60d1"

    aput-object v3, v0, v2

    const/16 v2, 0xf48

    .line 4089
    const-string v3, "3913. humor n.(humour)\u5e7d\u9ed8,\u8bd9\u8c10"

    aput-object v3, v0, v2

    const/16 v2, 0xf49

    .line 4090
    const-string v3, "3914. rumor n.(rumour)\u4f20\u95fb,\u8c23\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0xf4a

    .line 4091
    const-string v3, "3915. nor conj.\uff0fad.\u4e5f\u4e0d\uff0c\u4e5f\u6ca1\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0xf4b

    .line 4092
    const-string v3, "3916. minor a.\u8f83\u5c0f\u7684,\u8f83\u5c0f\u7684 n.\u517c\u4fee\u5b66\u79d1 v.(in)\u517c\u4fee"

    aput-object v3, v0, v2

    const/16 v2, 0xf4c

    .line 4093
    const-string v3, "3917. honor n.(honour)\u5c0a\u656c,\u656c\u610f;\u8363\u8a89,\u5149\u8363 v.\u5c0a\u656c"

    aput-object v3, v0, v2

    const/16 v2, 0xf4d

    .line 4094
    const-string v3, "3918. governor n.\u7edf\u6cbb\u8005,\u7ba1\u7406\u8005,\u603b\u7763,\u5dde(\u7701)\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xf4e

    .line 4095
    const-string v3, "3919. door n.\u95e8\uff1b\u95e8\u53e3\uff0c\u51fa\u5165\u53e3\uff1b\u95e8\u72b6\u7269\uff1b\u5bb6\uff1b\u901a\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0xf4f

    .line 4096
    const-string v3, "3920. indoor a.\u5ba4\u5185\u7684,\u6237\u5185\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf50

    .line 4097
    const-string v3, "3921. outdoor a.\u5ba4\u5916\u7684,\u91ce\u5916\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf51

    .line 4098
    const-string v3, "3922. floor n.\u5730\u677f,(\u697c\u623f)\u7684\u5c42"

    aput-object v3, v0, v2

    const/16 v2, 0xf52

    .line 4099
    const-string v3, "3923. poor a.\u8d2b\u56f0\u7684\uff1b\u53ef\u601c\u7684\uff1b\u8d2b\u4e4f\u7684\uff1b\u8d2b\u7620\u7684\uff1b\u4f4e\u52a3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf53

    .line 4100
    const-string v3, "3924. emperor n.\u7687\u5e1d"

    aput-object v3, v0, v2

    const/16 v2, 0xf54

    .line 4101
    const-string v3, "3925. error n.\u9519\u8bef,\u8fc7\u5931"

    aput-object v3, v0, v2

    const/16 v2, 0xf55

    .line 4102
    const-string v3, "3926. terror n.\u6050\u6016;\u53ef\u6015\u7684\u4eba(\u4e8b)"

    aput-object v3, v0, v2

    const/16 v2, 0xf56

    .line 4103
    const-string v3, "3927. mirror n.\u955c\u5b50;\u53cd\u6620,\u53cd\u5c04 v.\u53cd\u6620,\u53cd\u5c04"

    aput-object v3, v0, v2

    const/16 v2, 0xf57

    .line 4104
    const-string v3, "3928. horror n.\u6050\u6016,\u6218\u6817"

    aput-object v3, v0, v2

    const/16 v2, 0xf58

    .line 4105
    const-string v3, "3929. sponsor n.\u53d1\u8d77\u4eba,\u4e3b\u529b\u8005,\u4fdd\u8bc1\u4eba v.\u53d1\u8d77,\u4e3b\u529e"

    aput-object v3, v0, v2

    const/16 v2, 0xf59

    .line 4106
    const-string v3, "3930. successor n.\u63a5\u66ff\u7684\u4eba\u6216\u4e8b\u7269\uff0c\u7ee7\u4efb\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf5a

    .line 4107
    const-string v3, "3931. predecessor n.\u524d\u8f88\uff0c\u524d\u4efb"

    aput-object v3, v0, v2

    const/16 v2, 0xf5b

    .line 4108
    const-string v3, "3932. professor n.\u6559\u6388"

    aput-object v3, v0, v2

    const/16 v2, 0xf5c

    .line 4109
    const-string v3, "3933. senator n.\u53c2\u8bae\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xf5d

    .line 4110
    const-string v3, "3934. generator n.\u53d1\u7535\u673a,\u53d1\u751f\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xf5e

    .line 4111
    const-string v3, "3935. operator n.\u64cd\u4f5c\u4eba\u5458,(\u7535\u8bdd)\u63a5\u7ebf\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xf5f

    .line 4112
    const-string v3, "3936. spectator n.\u89c2\u4f17,\u65c1\u89c2\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf60

    .line 4113
    const-string v3, "3937. equator n.\u8d64\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0xf61

    .line 4114
    const-string v3, "3938. elevator n.\u7535\u68af,\u5347\u964d\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xf62

    .line 4115
    const-string v3, "3939. actor n.\u7537\u6f14\u5458\uff1b\u6f14\u5458\uff0c\u884c\u52a8\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf63

    .line 4116
    const-string v3, "3940. factor n.\u56e0\u7d20,\u8981\u7d20"

    aput-object v3, v0, v2

    const/16 v2, 0xf64

    .line 4117
    const-string v3, "3941. tractor n.\u62d6\u62c9\u673a,\u7275\u5f15\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0xf65

    .line 4118
    const-string v3, "3942. projector n.\u653e\u6620\u673a,\u5e7b\u706f\u673a,\u6295\u5f71\u4eea"

    aput-object v3, v0, v2

    const/16 v2, 0xf66

    .line 4119
    const-string v3, "3943. director n.\u6307\u5bfc\u8005,\u4e3b\u4efb,\u5bfc\u6f14"

    aput-object v3, v0, v2

    const/16 v2, 0xf67

    .line 4120
    const-string v3, "3944. sector n.\u90e8\u95e8\uff0c\u90e8\u5206\uff1b\u9632\u5fa1\u5730\u6bb5\uff0c\u9632\u533a\uff1b\u6247\u5f62"

    aput-object v3, v0, v2

    const/16 v2, 0xf68

    .line 4121
    const-string v3, "3945. detector n.\u53d1\u73b0\u8005,\u4fa6\u5bdf\u5668,\u63a2\u6d4b\u5668,\u68c0\u6ce2\u5668,\u68c0\u7535\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xf69

    .line 4122
    const-string v3, "3946. doctor n.\u533b\u751f;\u535a\u58eb vt.\u6388\u4ee5\u535a\u58eb\u5b66\u4f4d;\u8bca\u65ad;\u4fee\u6539"

    aput-object v3, v0, v2

    const/16 v2, 0xf6a

    .line 4123
    const-string v3, "3947. conductor n.\u7ba1\u7406\u8005\uff1b(\u6c7d\u8f66)\u552e\u7968\u5458\uff1b\u9886\u961f\uff0c\u6307\u6325\uff1b\u5bfc\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xf6b

    .line 4124
    const-string v3, "3948. semiconductor n.\u534a\u5bfc\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0xf6c

    .line 4125
    const-string v3, "3949. traitor n.\u53db\u5f92,\u5356\u56fd\u8d3c"

    aput-object v3, v0, v2

    const/16 v2, 0xf6d

    .line 4126
    const-string v3, "3950. editor n.\u7f16\u8f91,\u7f16\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf6e

    .line 4127
    const-string v3, "3951. monitor n.\u73ed\u957f;\u76d1\u542c\u5668,\u76d1\u89c6\u5668 v.\u76d1\u63a7,\u76d1\u6d4b"

    aput-object v3, v0, v2

    const/16 v2, 0xf6f

    .line 4128
    const-string v3, "3952. visitor n.\u8bbf\u95ee\u8005,\u5ba2\u4eba,\u6765\u5bbe,\u53c2\u89c2\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0xf70

    .line 4129
    const-string v3, "3953. motor n.\u53d1\u52a8\u673a,\u7535\u52a8\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xf71

    .line 4130
    const-string v3, "3954. ancestor n.\u7956\u5b97\uff0c\u7956\u5148\uff1b\u539f\u578b\uff0c\u5148\u9a71"

    aput-object v3, v0, v2

    const/16 v2, 0xf72

    .line 4131
    const-string v3, "3955. transistor n.\u6676\u4f53\u7ba1\uff1b\u6676\u4f53\u7ba1\u6536\u97f3\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xf73

    .line 4132
    const-string v3, "3956. tutor n.\u5bfc\u5e08;\u5bb6\u5ead\u6559\u5e08 v.\u8f85\u5bfc;\u5f53\u5bfc\u5e08;\u5f53\u5bb6\u5ead\u6559\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0xf74

    .line 4133
    const-string v3, "3957. liquor n.\u9152\uff1b\u6eb6\u6db2\uff0c\u6db2\u5242"

    aput-object v3, v0, v2

    const/16 v2, 0xf75

    .line 4134
    const-string v3, "3958. endeavor v./n.(endeavour)\u52aa\u529b,\u5c3d\u529b,\u529b\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0xf76

    .line 4135
    const-string v3, "3959. favor n.(favour)\u597d\u611f;\u559c\u7231;\u5173\u5207v.\u8d5e\u6210,\u652f\u6301,\u504f\u7231"

    aput-object v3, v0, v2

    const/16 v2, 0xf77

    .line 4136
    const-string v3, "3960. flavor n.(flavour)\u60c5\u5473;\u98ce\u5473;\u6ecb\u5473 v.\u7ed9\u2026\u8c03\u5473"

    aput-object v3, v0, v2

    const/16 v2, 0xf78

    .line 4137
    const-string v3, "3961. mayor n.\u5e02\u957f"

    aput-object v3, v0, v2

    const/16 v2, 0xf79

    .line 4138
    const-string v3, "3962. razor n.\u5243\u5200"

    aput-object v3, v0, v2

    const/16 v2, 0xf7a

    .line 4139
    const-string v3, "3963. occur v.\u53d1\u751f,\u51fa\u73b0;\u5b58\u5728;\u60f3\u8d77,\u60f3\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0xf7b

    .line 4140
    const-string v3, "3964. recur v.(\u5c24\u6307\u4e0d\u597d\u7684\u4e8b)\u4e00\u518d\u53d1\u751f\uff1b\u91cd\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0xf7c

    .line 4141
    const-string v3, "3965. incur v.\u62db\u81f4,\u60f9\u8d77,\u906d\u53d7"

    aput-object v3, v0, v2

    const/16 v2, 0xf7d

    .line 4142
    const-string v3, "3966. entrepreneur n.[\u6cd5]\u4f01\u4e1a\u5bb6, \u4e3b\u529e\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xf7e

    .line 4143
    const-string v3, "3967. amateur a.&n.\u4e1a\u4f59(\u6c34\u5e73)\u7684(\u8fd0\u52a8\u5458\u3001\u827a\u672f\u5bb6\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0xf7f

    .line 4144
    const-string v3, "3968. fur n.\u6bdb,\u6bdb\u76ae"

    aput-object v3, v0, v2

    const/16 v2, 0xf80

    .line 4145
    const-string v3, "3969. sulfur n.(sulphur)\u786b"

    aput-object v3, v0, v2

    const/16 v2, 0xf81

    .line 4146
    const-string v3, "3970. blur n.\u6a21\u7cca\u4e0d\u6e05\u7684\u4e8b\u7269\uff1b\u6c61\u70b9 vt.\u4f7f\u6a21\u7cca\uff1b\u73b7\u6c61"

    aput-object v3, v0, v2

    const/16 v2, 0xf82

    .line 4147
    const-string v3, "3971. murmur v./n.\u5c0f\u58f0\u8bf4(\u8bdd);\u5c0f\u58f0\u62b1\u6028,\u5495\u54dd"

    aput-object v3, v0, v2

    const/16 v2, 0xf83

    .line 4148
    const-string v3, "3972. our pron.[we\u7684\u6240\u6709\u683c]\u6211\u4eec\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf84

    .line 4149
    const-string v3, "3973. four num.\u56db pron./a.\u56db(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0xf85

    .line 4150
    const-string v3, "3974. hour n.\u5c0f\u65f6\uff0c\u949f\u70b9\uff1b\u65f6\u523b\uff1b\u8bfe\u65f6\uff0c\u5de5\u4f5c\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0xf86

    .line 4151
    const-string v3, "3975. flour n.\u9762\u7c89"

    aput-object v3, v0, v2

    const/16 v2, 0xf87

    .line 4152
    const-string v3, "3976. tumour n.(tumor)(\u80bf)\u7624\uff0c\u80bf\u5757"

    aput-object v3, v0, v2

    const/16 v2, 0xf88

    .line 4153
    const-string v3, "3977. pour v.\u704c\u6ce8, \u503e\u6cfb, \u6d8c\u5165, \u6d41, \u503e\u76c6\u5927\u96e8"

    aput-object v3, v0, v2

    const/16 v2, 0xf89

    .line 4154
    const-string v3, "3978. vapour n.(vapor)\u6c7d\uff0c(\u6c34)\u84b8\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0xf8a

    .line 4155
    const-string v3, "3979. sour a.\u9178\u7684;\u53d1\u9178\u7684;\u9178\u75db\u7684;\u813e\u6c14\u574f\u7684;\u523b\u8584\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf8b

    .line 4156
    const-string v3, "3980. tour n.\u65c5\u6e38\uff0c\u65c5\u884c\uff1b\u5de1\u56de\u6f14\u51fa/\u6bd4\u8d5b v.\u65c5\u6e38"

    aput-object v3, v0, v2

    const/16 v2, 0xf8c

    .line 4157
    const-string v3, "3981. your pron.[you\u7684\u6240\u6709\u683c]\u4f60\u7684\uff0c\u4f60\u4eec\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xf8d

    .line 4158
    const-string v3, "3982. spur n.\u9774\u523a,\u9a6c\u523a;\u523a\u6fc0,\u523a\u6fc0\u7269 v.\u523a\u6fc0,\u6fc0\u52b1"

    aput-object v3, v0, v2

    const/16 v2, 0xf8e

    .line 4159
    const-string v3, "3983. as ad.\u540c\u6837\u5730 conj.\u7531\u4e8e\uff1b\u50cf...\u4e00\u6837 prep.\u4f5c\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0xf8f

    .line 4160
    const-string v3, "3984. whereas conj.\u800c,\u5374,\u53cd\u4e4b"

    aput-object v3, v0, v2

    const/16 v2, 0xf90

    .line 4161
    const-string v3, "3985. overseas a.\u5916\u56fd\u7684,\u6d77\u5916\u7684 ad.\u5728\u6d77\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0xf91

    .line 4162
    const-string v3, "3986. gas n.\u6c14\u4f53\uff1b\u7164\u6c14\uff1b\u6c7d\u6cb9\uff1b\u6bd2\u6c14vt.\u6bd2(\u6b7b)\uff1b\u52a0\u6cb9"

    aput-object v3, v0, v2

    const/16 v2, 0xf92

    .line 4163
    const-string v3, "3987. bias n./v.(\u4f7f\u6709)\u504f\u89c1,\u504f\u5fc3,\u504f\u8892"

    aput-object v3, v0, v2

    const/16 v2, 0xf93

    .line 4164
    const-string v3, "3988. Christmas n\uff0e\u5723\u8bde\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0xf94

    .line 4165
    const-string v3, "3989. canvas n.\u5e06\u5e03\uff1b\u5e06\u5e03\u753b\u5e03\uff0c(\u5e06\u5e03)\u6cb9\u753b"

    aput-object v3, v0, v2

    const/16 v2, 0xf95

    .line 4166
    const-string v3, "3990. economics n.\u7ecf\u6d4e\u5b66,\u7ecf\u6d4e\u60c5\u51b5"

    aput-object v3, v0, v2

    const/16 v2, 0xf96

    .line 4167
    const-string v3, "3991. physics n.\u7269\u7406(\u5b66)"

    aput-object v3, v0, v2

    const/16 v2, 0xf97

    .line 4168
    const-string v3, "3992. politics n.\u653f\u6cbb,\u653f\u6cbb\u5b66;\u653f\u7eb2,\u653f\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0xf98

    .line 4169
    const-string v3, "3993. odds n.\u4e0d\u5e73\u7b49,\u5dee\u5f02;\u673a\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xf99

    .line 4170
    const-string v3, "3994. goods n.(pl.)\u8d27\u7269\uff0c\u5546\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0xf9a

    .line 4171
    const-string v3, "3995. besides ad.\u6b64\u5916\uff1b\u5e76\u4e14 prep.\u4e8e\u2026\u4e4b\u5916\uff1b\u9664\u2026\u4ee5\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0xf9b

    .line 4172
    const-string v3, "3996. clothes n.\u8863\u670d(\u867d\u4e3a\u590d\u6570\uff0c\u4ea6\u4e0d\u53ef\u6570)"

    aput-object v3, v0, v2

    const/16 v2, 0xf9c

    .line 4173
    const-string v3, "3997. species n.(\u7269)\u79cd,\u79cd\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0xf9d

    .line 4174
    const-string v3, "3998. series n.\u4e00\u7cfb\u5217,\u8fde\u7eed;\u4e1b\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0xf9e

    .line 4175
    const-string v3, "3999. sometimes ad.\u4e0d\u65f6\uff0c\u6709\u65f6\uff0c\u95f4\u6216"

    aput-object v3, v0, v2

    const/16 v2, 0xf9f

    .line 4176
    const-string v3, "4000. themselves pron.\u4ed6(\u5979\u3001\u5b83)\u4eec\u81ea\u5df1\uff1b\u4ed6(\u5979\u3001\u5b83)\u4eec\u4eb2\u81ea"

    aput-object v3, v0, v2

    const/16 v2, 0xfa0

    .line 4177
    const-string v3, "4001. ourselves pron.[\u53cd\u8eab\u4ee3\u8bcd]\u6211\u4eec\u81ea\u5df1\uff1b\u6211\u4eec\u4eb2\u81ea"

    aput-object v3, v0, v2

    const/16 v2, 0xfa1

    .line 4178
    const-string v3, "4002. yes ad.\u662f[\u7528\u4e8e\u80af\u5b9a\u53e5\u524d]\uff0c\u662f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfa2

    .line 4179
    const-string v3, "4003. surroundings n.\u5468\u56f4\u7684\u4e8b\u7269,\u73af\u5883"

    aput-object v3, v0, v2

    const/16 v2, 0xfa3

    .line 4180
    const-string v3, "4004. maths n.(mathematics/math)\u6570\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0xfa4

    .line 4181
    const-string v3, "4005. his pron.[he\u7684\u6240\u6709\u683c/\u7269\u4e3b\u4ee3\u8bcd]\u4ed6\u7684(\u6240\u6709\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xfa5

    .line 4182
    const-string v3, "4006. this pron.\u8fd9(\u4e2a) a.\u8fd9(\u4e2a)\uff1b\u4eca ad.\u8fd9(\u6837)"

    aput-object v3, v0, v2

    const/16 v2, 0xfa6

    .line 4183
    const-string v3, "4007. tennis n.\u7f51\u7403"

    aput-object v3, v0, v2

    const/16 v2, 0xfa7

    .line 4184
    const-string v3, "4008. basis n.\u57fa\u7840,\u6839\u636e"

    aput-object v3, v0, v2

    const/16 v2, 0xfa8

    .line 4185
    const-string v3, "4009. emphasis n.\u5f3a\u8c03,\u91cd\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0xfa9

    .line 4186
    const-string v3, "4010. thesis n.(pl.theses) \u8bba\u6587;\u8bba\u9898;\u8bba\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0xfaa

    .line 4187
    const-string v3, "4011. synthesis n.(pl.syntheses)\u7efc\u5408,\u5408\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0xfab

    .line 4188
    const-string v3, "4012. hypothesis n.\u5047\u8bf4,\u5047\u8bbe,\u524d\u63d0"

    aput-object v3, v0, v2

    const/16 v2, 0xfac

    .line 4189
    const-string v3, "4013. crisis n.(pl.crises)\u5371\u673a,\u7d27\u8981\u5173\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0xfad

    .line 4190
    const-string v3, "4014. analysis n.(pl.analyses)\u5206\u6790\uff1b\u5206\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0xfae

    .line 4191
    const-string v3, "4015. axis n.\u8f74\uff0c\u8f74\u7ebf\uff0c\u4e2d\u5fc3\u7ebf\uff1b\u5750\u6807\u8f74\uff0c\u57fa\u51c6\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0xfaf

    .line 4192
    const-string v3, "4016. jeans n.\u725b\u4ed4\u88e4\uff08\u53c8\u79f0blue jeans, dungarees\u7b49\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0xfb0

    .line 4193
    const-string v3, "4017. means n.\u65b9\u6cd5,\u624b\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0xfb1

    .line 4194
    const-string v3, "4018. lens n.\u900f\u955c,\u955c\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0xfb2

    .line 4195
    const-string v3, "4019. remains n.(pl.)\u5269\u4f59,\u6b8b\u4f59,\u9057\u8ff9"

    aput-object v3, v0, v2

    const/16 v2, 0xfb3

    .line 4196
    const-string v3, "4020. chaos n.\u6df7\u4e71,\u7d0a\u4e71"

    aput-object v3, v0, v2

    const/16 v2, 0xfb4

    .line 4197
    const-string v3, "4021. perhaps ad.\u4e5f\u8bb8,\u5927\u6982,\u6050\u6015"

    aput-object v3, v0, v2

    const/16 v2, 0xfb5

    .line 4198
    const-string v3, "4022. hers pron.[she\u7684\u7269\u4e3b\u4ee3\u8bcd]\u5979\u7684(\u6240\u6709\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xfb6

    .line 4199
    const-string v3, "4023. trousers n.\u88e4\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xfb7

    .line 4200
    const-string v3, "4024. headquarters n.\u53f8\u4ee4\u90e8,\u6307\u6325\u90e8;\u603b\u90e8,\u603b\u5c40"

    aput-object v3, v0, v2

    const/16 v2, 0xfb8

    .line 4201
    const-string v3, "4025. downstairs ad.\u5728\u697c\u4e0b,\u5f80\u697c\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0xfb9

    .line 4202
    const-string v3, "4026. upstairs ad.\u5411\u697c\u4e0a;\u5728\u697c\u4e0a;\u4e0a\u697c ad.\u697c\u4e0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfba

    .line 4203
    const-string v3, "4027. theirs pron.[they\u7684\u7269\u4e3b\u4ee3\u8bcd]\u4ed6(\u5979\u3001\u5b83)\u4eec\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfbb

    .line 4204
    const-string v3, "4028. scissors n.\u526a\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0xfbc

    .line 4205
    const-string v3, "4029. ours pron.[we\u7684\u7269\u4e3b\u4ee3\u8bcd]\u6211\u4eec\u7684(\u6240\u6709\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xfbd

    .line 4206
    const-string v3, "4030. yours pron.[you\u7684\u7269\u4e3b\u4ee3\u8bcd]\u4f60(\u4eec)\u7684(\u6240\u6709\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0xfbe

    .line 4207
    const-string v3, "4031. "

    aput-object v3, v0, v2

    const/16 v2, 0xfbf

    .line 4208
    const-string v3, "4032. "

    aput-object v3, v0, v2

    const/16 v2, 0xfc0

    .line 4209
    const-string v3, "4033. class n.\u73ed\u7ea7\uff0c\u5e74\u7ea7\uff1b\u79cd\u7c7b\uff0c\u7b49\u7ea7\uff0c\u9636\u7ea7\uff1b(\u4e00\u8282)\u8bfe"

    aput-object v3, v0, v2

    const/16 v2, 0xfc1

    .line 4210
    const-string v3, "4034. glass n.\u73bb\u7483;\u73bb\u7483\u676f;\u955c\u5b50;(pl.)\u773c\u955c"

    aput-object v3, v0, v2

    const/16 v2, 0xfc2

    .line 4211
    const-string v3, "4035. mass n.\u5927\u91cf,\u4f17\u591a;\u56e2,\u5757;(pl.)\u7fa4\u4f17,\u6c11\u4f17;\u8d28\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0xfc3

    .line 4212
    const-string v3, "4036. pass v.\u7ecf/\u901a/\u7a7f/\u5ea6\u8fc7\uff1b\u4f20\u9012 n.\u901a\u884c\u8bc1\uff1b\u8003\u8bd5\u53ca\u683c"

    aput-object v3, v0, v2

    const/16 v2, 0xfc4

    .line 4213
    const-string v3, "4037. compass n.\u7f57\u76d8,\u6307\u5357\u9488;(pl.)\u5706\u89c4"

    aput-object v3, v0, v2

    const/16 v2, 0xfc5

    .line 4214
    const-string v3, "4038. overpass n.\u8fc7\u8857\u5929\u6865 vt.\u80dc\u8fc7,\u901a\u8fc7,\u5ffd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0xfc6

    .line 4215
    const-string v3, "4039. surpass vt.\u8d85\u8fc7,\u80dc\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xfc7

    .line 4216
    const-string v3, "4040. bypass n.(by-pass)\u65c1\u9053\uff1bvt.\u7ed5\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xfc8

    .line 4217
    const-string v3, "4041. brass n.\u9ec4\u94dc,\u94dc\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0xfc9

    .line 4218
    const-string v3, "4042. grass n.\u8349\uff0c\u8349\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0xfca

    .line 4219
    const-string v3, "4043. embarrass vt.\u4f7f\u56f0\u7a98,\u4f7f\u5c40\u4fc3\u4e0d\u5b89;\u963b\u788d,\u9ebb\u70e6"

    aput-object v3, v0, v2

    const/16 v2, 0xfcb

    .line 4220
    const-string v3, "4044. access n.\u8fdb\u5165\uff1b\u63a5\u5165\uff1b\u5230\u8fbe\uff1b\u4eab\u7528\u6743\uff1b\u5165\u53e3 vi.\u5b58\u53d6"

    aput-object v3, v0, v2

    const/16 v2, 0xfcc

    .line 4221
    const-string v3, "4045. success n.\u6210\u5c31\uff0c\u6210\u529f\uff1b\u6210\u529f\u7684\u4e8b\u7269\uff0c\u6709\u6210\u5c31\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xfcd

    .line 4222
    const-string v3, "4046. princess n.\u516c\u4e3b,\u738b\u5983"

    aput-object v3, v0, v2

    const/16 v2, 0xfce

    .line 4223
    const-string v3, "4047. process n.\u8fc7\u7a0b,\u8fdb\u7a0b;\u5de5\u5e8f,\u5236\u4f5c\u6cd5;\u5de5\u827a v.\u52a0\u5de5,\u5904\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0xfcf

    .line 4224
    const-string v3, "4048. excess a.\u8fc7\u91cf\u7684,\u989d\u5916\u7684 n.\u8fc7\u91cf;\u8fc7\u5269;\u8d85\u989d;\u65e0\u8282\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xfd0

    .line 4225
    const-string v3, "4049. confess v.\u4f9b\u8ba4\uff0c\u627f\u8ba4\uff0c\u5766\u767d\uff0c\u5fcf\u6094"

    aput-object v3, v0, v2

    const/16 v2, 0xfd1

    .line 4226
    const-string v3, "4050. chess n.\u68cb\uff0c\u56fd\u9645\u8c61\u68cb"

    aput-object v3, v0, v2

    const/16 v2, 0xfd2

    .line 4227
    const-string v3, "4051. less a./ad.\u66f4\u5c11\u7684(\u5730),\u66f4\u5c0f\u7684(\u5730)"

    aput-object v3, v0, v2

    const/16 v2, 0xfd3

    .line 4228
    const-string v3, "4052. bless v.\u795d\u798f,\u4fdd\u4f51"

    aput-object v3, v0, v2

    const/16 v2, 0xfd4

    .line 4229
    const-string v3, "4053. regardless a./ad.\u4e0d\u7ba1\u2026\u7684,\u4e0d\u987e\u2026\u7684,\u4e0d\u6ce8\u610f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfd5

    .line 4230
    const-string v3, "4054. nonetheless ad.[nevertheless]\u867d\u7136\u5982\u6b64, \u4f46\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0xfd6

    .line 4231
    const-string v3, "4055. nevertheless conj.(nonetheless)\u7136\u800c,\u4e0d\u8fc7 ad.\u4ecd\u7136,\u4e0d\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xfd7

    .line 4232
    const-string v3, "4056. ruthless a.\u6b8b\u9177\u7684,\u65e0\u60c5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfd8

    .line 4233
    const-string v3, "4057. reckless a.\u4e0d\u6ce8\u610f\u7684,\u5927\u610f\u7684,\u5364\u83bd\u7684,\u4e0d\u987e\u540e\u679c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfd9

    .line 4234
    const-string v3, "4058. unless conj.\u9664\u975e prep.\u9664\u2026\u5916"

    aput-object v3, v0, v2

    const/16 v2, 0xfda

    .line 4235
    const-string v3, "4059. restless a.\u5f97\u4e0d\u5230\u4f11\u606f\u7684;\u4e0d\u5e73\u9759\u7684;\u5750\u7acb\u4e0d\u5b89\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0xfdb

    .line 4236
    const-string v3, "4060. mess n.\u6df7\u4e71,\u6df7\u6742,\u810f\u4e71 v.\u5f04\u810f,\u5f04\u4e71,\u641e\u7cdf"

    aput-object v3, v0, v2

    const/16 v2, 0xfdc

    .line 4237
    const-string v3, "4061. kindness n.\u4ec1\u6148,\u4eb2\u5207;\u597d\u610f;\u53cb\u597d\u884c\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0xfdd

    .line 4238
    const-string v3, "4062. goodness n.\u5584\u826f\uff0c\u4ec1\u6148\uff1b(\u98df\u7269\u7b49)\u7cbe\u534e int.\u5929\u54ea"

    aput-object v3, v0, v2

    const/16 v2, 0xfde

    .line 4239
    const-string v3, "4063. business n.\u5546\u4e1a,\u751f\u610f;\u4e8b\u52a1,\u4e1a\u52a1,\u804c\u8d23"

    aput-object v3, v0, v2

    const/16 v2, 0xfdf

    .line 4240
    const-string v3, "4064. illness n.\u75c5,\u75be\u75c5"

    aput-object v3, v0, v2

    const/16 v2, 0xfe0

    .line 4241
    const-string v3, "4065. harness v.\u6cbb\u7406,\u5229\u7528 n.\u9a6c\u5177,\u633d\u5177"

    aput-object v3, v0, v2

    const/16 v2, 0xfe1

    .line 4242
    const-string v3, "4066. witness n.\u76ee\u51fb\u8005,\u8bc1\u4eba;\u8bc1\u636e,\u8bc1\u660e v.\u76ee\u51fb,\u76ee\u7779;\u4f5c\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0xfe2

    .line 4243
    const-string v3, "4067. caress vt.\uff0fn.\u7231\u629a\uff0c\u629a\u6478"

    aput-object v3, v0, v2

    const/16 v2, 0xfe3

    .line 4244
    const-string v3, "4068. dress n.\u670d\u88c5,\u7ae5\u88c5,\u5973\u88c5 v.\u7a7f\u8863,\u6253\u626e"

    aput-object v3, v0, v2

    const/16 v2, 0xfe4

    .line 4245
    const-string v3, "4069. address n.\u4f4f\u5740\uff1b\u81f4\u8bcd v.\u5411...\u81f4\u8bcd\uff1b\u5728\u4fe1\u5c01\u4e0a\u5199\u59d3\u540d"

    aput-object v3, v0, v2

    const/16 v2, 0xfe5

    .line 4246
    const-string v3, "4070. congress n.(\u4ee3\u8868)\u5927\u4f1a;(\u7f8e\u56fd\u7b49\u56fd\u7684)\u56fd\u4f1a,\u8bae\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0xfe6

    .line 4247
    const-string v3, "4071. progress v./n.\u8fdb\u6b65\uff0c\u8fdb\u5c55\uff1b\u524d\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0xfe7

    .line 4248
    const-string v3, "4072. press v.\u538b;\u538b\u69a8;\u7d27\u8feb,\u50ac\u4fc3 n.\u62a5\u520a,\u901a\u8baf\u793e;\u538b\u69a8\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0xfe8

    .line 4249
    const-string v3, "4073. depress v.\u538b\u6291,\u964d\u4f4e;\u4f7f\u6cae\u4e27,\u538b\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0xfe9

    .line 4250
    const-string v3, "4074. impress v.(on)\u5370,\u76d6\u5370;\u7559\u4e0b\u5370\u8c61,\u5f15\u4eba\u6ce8\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0xfea

    .line 4251
    const-string v3, "4075. compress vt.\u538b\u7d27\uff0c\u538b\u7f29\uff1b(\u628a\u601d\u60f3\u3001\u6587\u5b57\u7b49)\u6d53\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0xfeb

    .line 4252
    const-string v3, "4076. oppress v.\u538b\u8feb,\u538b\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0xfec

    .line 4253
    const-string v3, "4077. suppress v.\u9547\u538b,\u538b\u5236;\u6291\u5236,\u5fcd\u4f4f;\u67e5\u7981"

    aput-object v3, v0, v2

    const/16 v2, 0xfed

    .line 4254
    const-string v3, "4078. express v.\u8868\u8fbe,\u8868\u793a a.\u7279\u5feb\u7684,\u5feb\u901f\u7684 n.\u5feb\u8f66,\u5feb\u8fd0"

    aput-object v3, v0, v2

    const/16 v2, 0xfee

    .line 4255
    const-string v3, "4079. actress n.\u5973\u6f14\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xfef

    .line 4256
    const-string v3, "4080. waitress n.\u5973\u4f8d\u8005,\u5973\u670d\u52a1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0xff0

    .line 4257
    const-string v3, "4081. stress n.\u538b\u529b\uff1b\u91cd\u8981\u6027\uff1b\u5e94\u529b\uff1b\u91cd\u97f3vt.\u5f3a\u8c03\uff0c\u91cd\u8bfb"

    aput-object v3, v0, v2

    const/16 v2, 0xff1

    .line 4258
    const-string v3, "4082. distress n.\u82e6\u607c;\u5371\u96be;\u4e0d\u5e78 v.\u4f7f\u82e6\u607c"

    aput-object v3, v0, v2

    const/16 v2, 0xff2

    .line 4259
    const-string v3, "4083. mistress n.\u5973\u4e3b\u4eba;\u4e3b\u5987;\u60c5\u5987,\u60c5\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xff3

    .line 4260
    const-string v3, "4084. assess vt.(\u4e3a\u5f81\u7a0e)\u8bc4\u4f30(\u8d22\u4ea7\u3001\u6536\u5165)\uff1b\u5f81\u7a0e\uff1b\u8bc4\u4ef7"

    aput-object v3, v0, v2

    const/16 v2, 0xff4

    .line 4261
    const-string v3, "4085. possess v.\u5360\u6709,\u62e5\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0xff5

    .line 4262
    const-string v3, "4086. hostess n.\u5973\u4e3b\u4eba,\u5973\u4e3b\u6301\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0xff6

    .line 4263
    const-string v3, "4087. guess v./n.\u731c\u6d4b\uff0c\u63a8\u6d4b\uff1b\u4ee5\u4e3a\uff1b\u731c\u60f3[\u540c]surmise"

    aput-object v3, v0, v2

    const/16 v2, 0xff7

    .line 4264
    const-string v3, "4088. kiss n./v.\u543b,\u63a5\u543b"

    aput-object v3, v0, v2

    const/16 v2, 0xff8

    .line 4265
    const-string v3, "4089. miss n.\u5c0f\u59d0 v. \u601d\u5ff5,\u672a\u51fb\u4e2d,\u9519\u8fc7,\u6f0f\u6389,\u9003\u8131"

    aput-object v3, v0, v2

    const/16 v2, 0xff9

    .line 4266
    const-string v3, "4090. dismiss v.\u514d\u804c,\u89e3\u96c7,\u5f00\u9664,\u89e3\u6563"

    aput-object v3, v0, v2

    const/16 v2, 0xffa

    .line 4267
    const-string v3, "4091. boss n.\u8001\u677f\uff0c\u4e0a\u53f8 vt.\u6307\u6325\uff0c\u63a7\u5236\uff0c\u53d1\u53f7\u65bd\u4ee4"

    aput-object v3, v0, v2

    const/16 v2, 0xffb

    .line 4268
    const-string v3, "4092. loss n.\u4e27\u5931\uff0c\u9057\u5931\uff1b\u635f\u5931\uff0c\u635f\u8017\uff0c\u4e8f\u635f\uff1b\u5931\u8d25"

    aput-object v3, v0, v2

    const/16 v2, 0xffc

    .line 4269
    const-string v3, "4093. moss n.\u82d4,\u85d3,\u5730\u8863"

    aput-object v3, v0, v2

    const/16 v2, 0xffd

    .line 4270
    const-string v3, "4094. cross n.\u5341\u5b57(\u67b6)\uff1b\u82e6\u96be a.\u4ea4\u53c9\u7684\uff1b\u53d1\u6012\u7684 v.\u7a7f\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xffe

    .line 4271
    const-string v3, "4095. across prep.\u6a2a\u8fc7\uff0c\u8d8a\u8fc7\uff1b\u5728\u7684\u5bf9\u9762 ad.\u6a2a\u8fc7\uff0c\u7a7f\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0xfff

    .line 4272
    const-string v3, "4096. gross a.\u603b\u7684,\u6bdb(\u91cd)\u7684;\u7c97\u9c81\u7684,\u7c97\u4fd7\u7684 n.\u603b\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x1000

    .line 4273
    const-string v3, "4097. toss vt.\u5411\u4e0a\u63b7/\u6254\uff1b\u6447\u6446\uff0c\u98a0\u7c38 n.\u6295\uff0c\u6254\uff1b\u6447\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x1001

    .line 4274
    const-string v3, "4098. discuss vt.\u8ba8\u8bba,\u5546\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0x1002

    .line 4275
    const-string v3, "4099. fuss n./v.\u5fd9\u4e71,\u5927\u60ca\u5c0f\u602a"

    aput-object v3, v0, v2

    const/16 v2, 0x1003

    .line 4276
    const-string v3, "4100. its pron.[it\u7684\u6240\u6709\u683c]\u5b83\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1004

    .line 4277
    const-string v3, "4101. pants n.\u88e4\u5b50, \u77ed\u88e4"

    aput-object v3, v0, v2

    const/16 v2, 0x1005

    .line 4278
    const-string v3, "4102. outskirts n.\u90ca\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x1006

    .line 4279
    const-string v3, "4103. us pron.\u6211\u4eec(we\u7684\u5bbe\u683c\u5f62\u5f0f)"

    aput-object v3, v0, v2

    const/16 v2, 0x1007

    .line 4280
    const-string v3, "4104. bus n.\u516c\u5171\u6c7d\u8f66\uff0c\u603b\u7ebf\uff0c\u4fe1\u606f\u901a\u8def"

    aput-object v3, v0, v2

    const/16 v2, 0x1008

    .line 4281
    const-string v3, "4105. focus n.\u7126\u70b9,(\u6d3b\u52a8,\u5174\u8da3\u7b49\u7684)\u4e2d\u5fc3 v.(on)\u4f7f\u805a\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x1009

    .line 4282
    const-string v3, "4106. circus n.\u9a6c\u620f\u56e2,\u6742\u6280\u56e2;\u9a6c\u620f\u573a,\u6742\u6280\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x100a

    .line 4283
    const-string v3, "4107. nucleus n.(pl.nuclei)\u6838,\u6838\u5fc3,\u539f\u5b50\u6838"

    aput-object v3, v0, v2

    const/16 v2, 0x100b

    .line 4284
    const-string v3, "4108. thus ad.\u5982\u6b64\uff1b\u50cf\u8fd9\u6837\uff1b\u4e8e\u662f\uff1b\u56e0\u6b64"

    aput-object v3, v0, v2

    const/16 v2, 0x100c

    .line 4285
    const-string v3, "4109. radius n.\u534a\u5f84,\u534a\u5f84\u8303\u56f4,\u6709\u6548\u822a\u7a0b,\u8303\u56f4,\u754c\u9650"

    aput-object v3, v0, v2

    const/16 v2, 0x100d

    .line 4286
    const-string v3, "4110. genius n.\u5929\u624d"

    aput-object v3, v0, v2

    const/16 v2, 0x100e

    .line 4287
    const-string v3, "4111. plus prep.\u52a0\u4e0a a.\u6b63\u7684,\u52a0\u7684 n.\u52a0\u53f7,\u6b63\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x100f

    .line 4288
    const-string v3, "4112. surplus n.\u8fc7\u5269,\u5269\u4f59\uff1b\u4f59\u6b3e,\u4f59\u989d a.\u8fc7\u5269\u7684,\u5269\u4f59\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1010

    .line 4289
    const-string v3, "4113. minus a.\u8d1f\u7684,\u51cf\u7684 prep.\u51cf\u53bb n.\u8d1f\u53f7,\u51cf\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x1011

    .line 4290
    const-string v3, "4114. bonus n.\u5956\u91d1,\u7ea2\u5229"

    aput-object v3, v0, v2

    const/16 v2, 0x1012

    .line 4291
    const-string v3, "4115. tremendous a.\u5de8\u5927\u7684,\u6781\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1013

    .line 4292
    const-string v3, "4116. gorgeous a.\u534e\u4e3d\u7684\uff1b\u707f\u70c2\u7684\uff1b\u7f8e\u4e3d\u7684\uff1b\u5b9c\u4eba\u7684\uff1b\u68d2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1014

    .line 4293
    const-string v3, "4117. simultaneous a.\u540c\u65f6\u7684,\u540c\u65f6\u5b58\u5728\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1015

    .line 4294
    const-string v3, "4118. instantaneous a.\u77ac\u95f4\u7684,\u5373\u523b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1016

    .line 4295
    const-string v3, "4119. spontaneous a.\u81ea\u53d1\u7684,\u81ea\u7136\u4ea7\u751f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1017

    .line 4296
    const-string v3, "4120. homogeneous a.\u540c\u79cd\u7c7b\u7684\uff0c\u540c\u6027\u8d28\u7684\uff0c\u6709\u76f8\u540c\u7279\u5f81\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1018

    .line 4297
    const-string v3, "4121. erroneous a.\u9519\u8bef\u7684,\u4e0d\u6b63\u786e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1019

    .line 4298
    const-string v3, "4122. dubious a.\u6000\u7591\u7684\uff0c\u65e0\u628a\u63e1\u7684\uff1b\u6709\u95ee\u9898\u7684\uff0c\u9760\u4e0d\u4f4f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101a

    .line 4299
    const-string v3, "4123. spacious adj.\u5e7f\u9614\u7684\uff0c\u5bbd\u655e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101b

    .line 4300
    const-string v3, "4124. gracious a.\u4eb2\u5207\u7684,\u5ba2\u6c14\u7684;\u5bbd\u539a\u7684,\u4ec1\u6148\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101c

    .line 4301
    const-string v3, "4125. precious a.\u73cd\u8d35\u7684,\u8d35\u91cd\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101d

    .line 4302
    const-string v3, "4126. delicious a.\u7f8e\u5473\u7684;\u7f8e\u5999\u7684;\u4f7f\u4eba\u6109\u5feb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101e

    .line 4303
    const-string v3, "4127. suspicious a.(of)\u53ef\u7591\u7684,\u591a\u7591\u7684,\u7591\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x101f

    .line 4304
    const-string v3, "4128. vicious a.\u6076\u6bd2\u7684,\u51f6\u6b8b\u7684,\u90aa\u6076\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1020

    .line 4305
    const-string v3, "4129. conscious a.(of)\u610f\u8bc6\u5230\u7684,\u81ea\u89c9\u7684;\u795e\u5fd7\u6e05\u9192\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1021

    .line 4306
    const-string v3, "4130. tedious a.\u4e4f\u5473\u7684,\u5355\u8c03\u7684,\u5197\u957f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1022

    .line 4307
    const-string v3, "4131. religious a.\u5b97\u6559\u7684,\u4fe1\u6559\u7684,\u8654\u8bda\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1023

    .line 4308
    const-string v3, "4132. ingenious a.\u673a\u654f\u7684;\u6709\u72ec\u521b\u6027\u7684;\u7cbe\u81f4\u7684;\u7cbe\u5de7\u5236\u6210\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1024

    .line 4309
    const-string v3, "4133. various a.\u5404\u79cd\u5404\u6837\u7684;\u4e0d\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1025

    .line 4310
    const-string v3, "4134. serious a.\u4e25\u8083\u7684;\u4e3b\u8981\u7684;\u4e25\u91cd\u7684,\u5371\u6025\u7684;\u8ba4\u771f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1026

    .line 4311
    const-string v3, "4135. mysterious a.\u795e\u79d8\u7684,\u53ef\u7591\u7684,\u96be\u7406\u89e3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1027

    .line 4312
    const-string v3, "4136. glorious a.\u58ee\u4e3d\u7684,\u8f89\u714c\u7684;\u5149\u8363\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1028

    .line 4313
    const-string v3, "4137. notorious a.\u81ed\u540d\u662d\u8457\u7684,\u58f0\u540d\u72fc\u85c9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1029

    .line 4314
    const-string v3, "4138. curious a.\u597d\u5947\u7684, \u6c42\u77e5\u7684, \u53e4\u602a\u7684, \u7231\u6311\u5254\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102a

    .line 4315
    const-string v3, "4139. furious a.\u72c2\u6012\u7684,\u72c2\u66b4\u7684,\u731b\u70c8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102b

    .line 4316
    const-string v3, "4140. infectious a.\u4f20\u67d3\u7684,\u4f20\u67d3\u6027\u7684,\u6709\u611f\u67d3\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102c

    .line 4317
    const-string v3, "4141. ambitious a.\u6709\u62b1\u8d1f\u7684\uff0c\u96c4\u5fc3\u52c3\u52c3\u7684\uff1b\u6709\u91ce\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102d

    .line 4318
    const-string v3, "4142. conscientious a.\u5ba1\u614e\u6b63\u76f4\u7684\uff0c\u8ba4\u771f\u7684\uff0c\u672c\u7740\u826f\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102e

    .line 4319
    const-string v3, "4143. cautious a.(of)\u5c0f\u5fc3\u7684,\u8c28\u614e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x102f

    .line 4320
    const-string v3, "4144. obvious a.\u660e\u663e\u7684,\u663e\u800c\u6613\u89c1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1030

    .line 4321
    const-string v3, "4145. previous a.\u5148\u524d\u7684,\u4ee5\u524d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1031

    .line 4322
    const-string v3, "4146. anxious a.\u7126\u8651\u7684\uff0c\u62c5\u5fc3\u7684\uff1b\u6025\u4e8e(\u5f97\u5230\u7684)\uff0c\u6e34\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1032

    .line 4323
    const-string v3, "4147. jealous a.(of)\u5992\u5fcc\u7684;\u731c\u7591\u7684,\u8b66\u60d5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1033

    .line 4324
    const-string v3, "4148. marvelous a.(marvellous)\u60ca\u4eba\u7684,\u5947\u8ff9\u822c\u7684,\u5999\u6781\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1034

    .line 4325
    const-string v3, "4149. fabulous a.\u6781\u597d\u7684\uff1b\u6781\u4e3a\u5de8\u5927\u7684\uff1b\u5bd3\u8a00\u4e2d\u7684\uff0c\u4f20\u8bf4\u4e2d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1035

    .line 4326
    const-string v3, "4150. ridiculous a.\u8352\u8c2c\u7684,\u53ef\u7b11\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1036

    .line 4327
    const-string v3, "4151. famous a.\u8457\u540d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1037

    .line 4328
    const-string v3, "4152. unanimous a.\u5168\u4f53\u4e00\u81f4\u7684,\u4e00\u81f4\u540c\u610f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1038

    .line 4329
    const-string v3, "4153. enormous a.\u5de8\u5927\u7684,\u5e9e\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1039

    .line 4330
    const-string v3, "4154. anonymous a.\u533f\u540d\u7684\uff0c\u65e0\u540d\u7684\uff0c\u59d3\u6c0f\u4e0d\u660e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103a

    .line 4331
    const-string v3, "4155. poisonous a.\u6709\u6bd2\u7684,\u6076\u610f\u7684,\u6076\u6bd2\u7684,\u9053\u5fb7\u8d25\u574f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103b

    .line 4332
    const-string v3, "4156. monotonous a.\u5355\u8c03\u7684,\u65e0\u53d8\u5316\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103c

    .line 4333
    const-string v3, "4157. dangerous a.\u5371\u9669\u7684\uff0c\u4e0d\u5b89\u5168\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103d

    .line 4334
    const-string v3, "4158. numerous a.\u4f17\u591a\u7684,\u8bb8\u591a\u7684,\u5927\u6279\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103e

    .line 4335
    const-string v3, "4159. generous a.\u5bbd\u5b8f\u5927\u91cf\u7684,\u6177\u6168\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x103f

    .line 4336
    const-string v3, "4160. prosperous a.\u7e41\u8363\u7684,\u5174\u65fa\u7684,\u8302\u76db\u7684,\u987a\u5229\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1040

    .line 4337
    const-string v3, "4161. rigorous a.\u4e25\u683c\u7684,\u4e25\u5389\u7684,\u4e25\u9177\u7684,\u4e25\u5bc6\u7684,\u4e25\u8c28\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1041

    .line 4338
    const-string v3, "4162. vigorous a.\u671d\u6c14\u84ec\u52c3\u7684,\u7cbe\u529b\u65fa\u76db\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1042

    .line 4339
    const-string v3, "4163. humorous a.\u5bcc\u4e8e\u5e7d\u9ed8\u611f\u7684\uff0c\u5e7d\u9ed8\u7684\uff1b\u6ed1\u7a3d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1043

    .line 4340
    const-string v3, "4164. disastrous a.\u707e\u96be\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1044

    .line 4341
    const-string v3, "4165. conspicuous a.\u663e\u773c\u7684,\u660e\u663e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1045

    .line 4342
    const-string v3, "4166. ambiguous a.\u5f15\u8d77\u6b67\u4e49\u7684\uff0c\u6a21\u68f1\u4e24\u53ef\u7684\uff0c\u542b\u7cca\u4e0d\u6e05\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1046

    .line 4343
    const-string v3, "4167. superfluous a.\u591a\u4f59\u7684\uff0c\u8fc7\u5269\u7684\uff0c"

    aput-object v3, v0, v2

    const/16 v2, 0x1047

    .line 4344
    const-string v3, "4168. strenuous a.\u8d39\u529b\u7684\uff0c\u8270\u8f9b\u7684\uff1b\u594b\u53d1\u7684\uff0c\u52aa\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1048

    .line 4345
    const-string v3, "4169. continuous a.\u8fde\u7eed\u7684,\u6301\u7eed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1049

    .line 4346
    const-string v3, "4170. nervous a.\u795e\u7ecf\u7684;\u795e\u7ecf\u8fc7\u654f\u7684,\u7d27\u5f20\u4e0d\u5b89\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x104a

    .line 4347
    const-string v3, "4171. campus n.(\u5927\u5b66)\u6821\u56ed"

    aput-object v3, v0, v2

    const/16 v2, 0x104b

    .line 4348
    const-string v3, "4172. virus n.\u75c5\u6bd2;(\u7cbe\u795e,\u9053\u5fb7\u65b9\u9762\u7684)\u6709\u5bb3\u5f71\u54cd"

    aput-object v3, v0, v2

    const/16 v2, 0x104c

    .line 4349
    const-string v3, "4173. chorus n.\u5408\u5531\u961f;\u5408\u5531 v.\u5f02\u53e3\u540c\u58f0\u5730\u8bf4,\u968f\u58f0\u9644\u548c"

    aput-object v3, v0, v2

    const/16 v2, 0x104d

    .line 4350
    const-string v3, "4174. census n.\u4eba\u53e3\u666e\u67e5(\u8c03\u67e5)"

    aput-object v3, v0, v2

    const/16 v2, 0x104e

    .line 4351
    const-string v3, "4175. consensus n.(\u610f\u89c1\u7b49\u7684)\u4e00\u81f4\uff0c\u4e00\u81f4\u540c\u610f\uff0c\u5171\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x104f

    .line 4352
    const-string v3, "4176. versus prep.(vs.)\u2026\u5bf9\u2026(\u5728\u8bc9\u8bbc,\u6bd4\u8d5b\u7b49);\u4e0e\u2026\u76f8\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x1050

    .line 4353
    const-string v3, "4177. apparatus n.\u5668\u68b0\uff0c\u5668\u5177\uff0c\u4eea\u5668\uff1b\u673a\u6784\uff0c\u7ec4\u7ec7"

    aput-object v3, v0, v2

    const/16 v2, 0x1051

    .line 4354
    const-string v3, "4178. status n.\u5730\u4f4d,\u8eab\u4efd;\u60c5\u5f62,\u72b6\u51b5"

    aput-object v3, v0, v2

    const/16 v2, 0x1052

    .line 4355
    const-string v3, "4179. impetus n.\u63a8\u52a8(\u529b),\u4fc3\u8fdb"

    aput-object v3, v0, v2

    const/16 v2, 0x1053

    .line 4356
    const-string v3, "4180. news n.\u65b0\u95fb\uff0c\u6d88\u606f\uff1b\u65b0\u95fb\u62a5\u9053\uff0c\u65b0\u95fb\u5e7f\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0x1054

    .line 4357
    const-string v3, "4181. nowadays ad.\u73b0\u4eca,\u73b0\u5728"

    aput-object v3, v0, v2

    const/16 v2, 0x1055

    .line 4358
    const-string v3, "4182. sideways ad./a.\u5411\u65c1\u8fb9(\u7684),\u4fa7\u8eab,\u6a2a\u7740(\u7684),\u659c\u7740(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x1056

    .line 4359
    const-string v3, "4183. always ad.\u603b\u662f\uff0c\u65e0\u4f8b\u5916\u5730\uff1b\u6c38\u8fdc\uff0c\u59cb\u7ec8"

    aput-object v3, v0, v2

    const/16 v2, 0x1057

    .line 4360
    const-string v3, "4184. at prep.[\u8868\u793a\u4ef7\u683c\u3001\u901f\u5ea6\u7b49]\u4ee5\uff0c\u8fbe\uff1b\u5728..\u65b9\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x1058

    .line 4361
    const-string v3, "4185. bat n.\u7403\u62cd,\u7403\u68d2,\u77ed\u68d2;\u8759\u8760"

    aput-object v3, v0, v2

    const/16 v2, 0x1059

    .line 4362
    const-string v3, "4186. combat v./n.\u6218\u6597,\u640f\u6597,\u683c\u6597"

    aput-object v3, v0, v2

    const/16 v2, 0x105a

    .line 4363
    const-string v3, "4187. acrobat n.\u7279\u6280\u6f14\u5458\uff0c\u6742\u6280\u6f14\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x105b

    .line 4364
    const-string v3, "4188. cat n.\u732b\uff1b\u732b\u79d1\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x105c

    .line 4365
    const-string v3, "4189. eat vt.\u5403\uff0c\u559d vi.\u5403\u996d\uff0c\u5403\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x105d

    .line 4366
    const-string v3, "4190. beat n.\u6572\u6253;(\u5fc3\u810f\u7b49)\u8df3\u52a8 v.\u6253\u8d25;(\u5fc3\u810f\u7b49)\u8df3\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x105e

    .line 4367
    const-string v3, "4191. feat n.\u529f\u7ee9\uff0c\u4f1f\u4e1a\uff0c\u6280\u827a"

    aput-object v3, v0, v2

    const/16 v2, 0x105f

    .line 4368
    const-string v3, "4192. defeat n.\u51fb\u8d25,\u6218\u80dc,\u5931\u8d25 v.\u51fb\u8d25,\u6218\u80dc;\u4f7f\u5931\u8d25"

    aput-object v3, v0, v2

    const/16 v2, 0x1060

    .line 4369
    const-string v3, "4193. heat n.\u70ed,\u70ed\u5ea6;\u70ed\u70c8,\u6fc0\u70c8 v.(\u7ed9)\u52a0\u70ed,(\u4f7f)\u53d8\u70ed"

    aput-object v3, v0, v2

    const/16 v2, 0x1061

    .line 4370
    const-string v3, "4194. cheat v.\u6b3a\u9a97;\u4f5c\u5f0a n.\u9a97\u5b50;\u6b3a\u8bc8,\u6b3a\u9a97\u884c\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x1062

    .line 4371
    const-string v3, "4195. wheat n.\u5c0f\u9ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x1063

    .line 4372
    const-string v3, "4196. meat n.(\u98df\u7528)\u8089\u7c7b"

    aput-object v3, v0, v2

    const/16 v2, 0x1064

    .line 4373
    const-string v3, "4197. neat a.\u6574\u6d01\u7684,\u5e72\u51c0\u7684,\u4f18\u7f8e\u7684,\u7cbe\u81f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1065

    .line 4374
    const-string v3, "4198. repeat v.\u91cd\u590d,\u91cd\u8bf4,\u91cd\u505a n.\u91cd\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0x1066

    .line 4375
    const-string v3, "4199. great a.\u4f1f\u5927\u7684\uff1b\u91cd\u8981\u7684\uff1b\u5927\u91cf\u7684\uff1b\u5f88\u597d\u7684\uff1b\u7f8e\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1067

    .line 4376
    const-string v3, "4200. threat n.\u6050\u5413,\u5a01\u80c1;\u574f\u5146\u5934,\u5371\u9669\u8ff9\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x1068

    .line 4377
    const-string v3, "4201. treat v.\u5bf9\u5f85;\u6cbb\u7597;\u8bba\u8ff0;\u6b3e\u5f85,\u8bf7\u5ba2 n.\u6b3e\u5f85,\u8bf7\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0x1069

    .line 4378
    const-string v3, "4202. retreat v.\u64a4\u9000,\u9000\u5374"

    aput-object v3, v0, v2

    const/16 v2, 0x106a

    .line 4379
    const-string v3, "4203. seat n.\u5ea7\u4f4d,\u5e95\u5ea7;\u6240\u5728\u5730,\u573a\u6240 v.\u4f7f\u5750\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x106b

    .line 4380
    const-string v3, "4204. sweat n.\u6c57 v.(\u4f7f)\u51fa\u6c57"

    aput-object v3, v0, v2

    const/16 v2, 0x106c

    .line 4381
    const-string v3, "4205. fat a.\u591a\u8102\u80aa\u7684\uff0c\u80a5\u80d6\u7684\uff1b\u4e30\u539a\u7684n.\u8102\u80aa\uff0c\u80a5\u8089"

    aput-object v3, v0, v2

    const/16 v2, 0x106d

    .line 4382
    const-string v3, "4206. hat n.\u5e3d\u5b50(\u4e00\u822c\u6307\u6709\u8fb9\u7684\u5e3d\u5b50)"

    aput-object v3, v0, v2

    const/16 v2, 0x106e

    .line 4383
    const-string v3, "4207. chat v./n.\u95f2\u8c08,\u804a\u5929"

    aput-object v3, v0, v2

    const/16 v2, 0x106f

    .line 4384
    const-string v3, "4208. that a./pron.\u90a3\uff0c\u90a3\u4e2a ad.\u90a3\u4e48 conj.[\u5f15\u5bfc\u4ece\u53e5]"

    aput-object v3, v0, v2

    const/16 v2, 0x1070

    .line 4385
    const-string v3, "4209. what pron.\u4ec0\u4e48 a.\u591a\u4e48\uff0c\u4f55\u7b49\uff1b\u4ec0\u4e48\uff1b\u5c3d\u53ef\u80fd\u591a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1071

    .line 4386
    const-string v3, "4210. somewhat pron.&ad.\u4e00\u70b9\u513f\uff0c\u51e0\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x1072

    .line 4387
    const-string v3, "4211. flat a.\u5e73\u5766\u7684,\u6241\u5e73\u7684,\u5e73\u6de1\u7684 n.\u4e00\u5957\u623f\u95f4;\u5e73\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x1073

    .line 4388
    const-string v3, "4212. mat n.\u5e2d\u5b50,\u57ab\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x1074

    .line 4389
    const-string v3, "4213. format n.(\u51fa\u7248\u7269\u7684)\u5f00\u672c,\u7248\u5f0f,\u683c\u5f0f vt.\u8bbe\u8ba1;\u5b89\u6392"

    aput-object v3, v0, v2

    const/16 v2, 0x1075

    .line 4390
    const-string v3, "4214. boat n.\u5c0f\u8239,\u8247"

    aput-object v3, v0, v2

    const/16 v2, 0x1076

    .line 4391
    const-string v3, "4215. coat n.\u4e0a\u8863\uff0c\u5916\u5957\uff1b\u8868\u76ae\uff1b\u5c42,\u8986\u76d6\u7269 v.\u6d82(\u76d6)\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x1077

    .line 4392
    const-string v3, "4216. overcoat n.\u5916\u8863,\u5927\u8863"

    aput-object v3, v0, v2

    const/16 v2, 0x1078

    .line 4393
    const-string v3, "4217. goat n.\u5c71\u7f8a"

    aput-object v3, v0, v2

    const/16 v2, 0x1079

    .line 4394
    const-string v3, "4218. float n.\u98d8\u6d6e;\u6f02\u6d41\u7269 v.\u6d6e\u52a8;\u6f02\u6d6e;\u4f20\u64ad;\u52a8\u6447"

    aput-object v3, v0, v2

    const/16 v2, 0x107a

    .line 4395
    const-string v3, "4219. throat n.\u54bd\u5589,\u55d3\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x107b

    .line 4396
    const-string v3, "4220. pat v./n.\u8f7b\u62cd,\u8f7b\u6253,\u629a\u6478"

    aput-object v3, v0, v2

    const/16 v2, 0x107c

    .line 4397
    const-string v3, "4221. rat n.\u9f20"

    aput-object v3, v0, v2

    const/16 v2, 0x107d

    .line 4398
    const-string v3, "4222. habitat n.(\u52a8\u7269\u7684)\u6816\u606f\u5730\uff0c(\u690d\u7269\u7684)\u4ea7\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x107e

    .line 4399
    const-string v3, "4223. debt n.\u503a,\u503a\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0x107f

    .line 4400
    const-string v3, "4224. doubt n./v.\u6000\u7591,\u7591\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0x1080

    .line 4401
    const-string v3, "4225. act v.\u8868\u6f14\uff1b\u4e3e\u52a8\uff1b\u8d77\u4f5c\u7528 n.\u884c\u4e3a\uff0c\u6cd5\u4ee4\uff1b\u4e00\u5e55"

    aput-object v3, v0, v2

    const/16 v2, 0x1081

    .line 4402
    const-string v3, "4226. react v.\u53cd\u5e94,\u8d77\u4f5c\u7528;(against)\u53cd\u5bf9,\u8d77\u53cd\u4f5c\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x1082

    .line 4403
    const-string v3, "4227. fact n.\u4e8b\u5b9e,\u5b9e\u9645"

    aput-object v3, v0, v2

    const/16 v2, 0x1083

    .line 4404
    const-string v3, "4228. pact n.\u5408\u540c,\u6761\u7ea6,\u516c\u7ea6,\u534f\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x1084

    .line 4405
    const-string v3, "4229. impact n.\u51b2\u51fb,\u78b0\u649e;\u5f71\u54cd v.\u5f71\u54cd;\u6324\u5165,\u538b\u7d27"

    aput-object v3, v0, v2

    const/16 v2, 0x1085

    .line 4406
    const-string v3, "4230. compact a.\u7d27\u5bc6\u7684,\u7ed3\u5b9e\u7684;\u7b80\u660e\u7684 v.\u4f7f\u7d27\u51d1,\u538b\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x1086

    .line 4407
    const-string v3, "4231. interact v.\u4e92\u76f8\u4f5c\u7528,\u4e92\u76f8\u5f71\u54cd"

    aput-object v3, v0, v2

    const/16 v2, 0x1087

    .line 4408
    const-string v3, "4232. subtract v.\u51cf(\u53bb)"

    aput-object v3, v0, v2

    const/16 v2, 0x1088

    .line 4409
    const-string v3, "4233. contract n.(\u627f\u5305)\u5408\u540c/\u5951\u7ea6 v.\u8ba2\u5408\u540c/\u5951\u7ea6\uff1b\u4f7f\u7f29\u5c0f"

    aput-object v3, v0, v2

    const/16 v2, 0x1089

    .line 4410
    const-string v3, "4234. abstract a.\u62bd\u8c61\u7684 n.\u6458\u8981\uff0c\u6897\u6982 vt.\u63d0\u53d6\uff1b\u6458\u5f55\u8981\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x108a

    .line 4411
    const-string v3, "4235. distract v.\u5206\u6563;\u4f7f\u5206\u5fc3;\u6253\u6270;\u4f7f\u5fc3\u60c5\u70e6\u4e71"

    aput-object v3, v0, v2

    const/16 v2, 0x108b

    .line 4412
    const-string v3, "4236. attract vt.\u5f15\u8d77\u7684\u6ce8\u610f(\u6216\u5174\u8da3\u7b49),\u5438\u5f15\uff1b\u5f15\u8d77\uff1b\u6fc0\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x108c

    .line 4413
    const-string v3, "4237. extract v./n.\u62d4\u51fa,\u62bd\u51fa;\u6458\u5f55 n.\u62bd\u53d6\u7269;\u7cbe\u534e;\u9009\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x108d

    .line 4414
    const-string v3, "4238. intact a.\u5b8c\u6574\u65e0\u7f3a\u7684,\u672a\u7ecf\u89e6\u52a8\u7684,\u672a\u53d7\u635f\u4f24\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x108e

    .line 4415
    const-string v3, "4239. contact v./n.(\u4f7f)\u63a5\u89e6,\u8054\u7cfb,\u4ea4\u5f80"

    aput-object v3, v0, v2

    const/16 v2, 0x108f

    .line 4416
    const-string v3, "4240. exact a.\u786e\u5207\u7684,\u6b63\u786e\u7684,\u7cbe\u786e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1090

    .line 4417
    const-string v3, "4241. defect n.\u8fc7\u5931;\u7f3a\u70b9;\u4e0d\u8db3"

    aput-object v3, v0, v2

    const/16 v2, 0x1091

    .line 4418
    const-string v3, "4242. affect vt.\u5f71\u54cd\uff1b(\u75be\u75c5)\u4fb5\u88ad\uff1b\u611f\u52a8 n.\u60c5\u611f\uff0c\u611f\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x1092

    .line 4419
    const-string v3, "4243. effect n.\u7ed3\u679c;\u6548\u679c;\u5f71\u54cd;\u5370\u8c61 vt.\u62db\u81f4;\u5b9e\u73b0;\u8fbe\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x1093

    .line 4420
    const-string v3, "4244. infect vt.\u4f20\u67d3\uff0c\u611f\u67d3\uff1b\u5f71\u54cd(\u601d\u60f3\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x1094

    .line 4421
    const-string v3, "4245. perfect a.\u5b8c\u5584\u7684;\u5b8c\u5168\u7684;(\u8bed\u6cd5)\u5b8c\u6210\u7684 v.\u4f7f\u5b8c\u7f8e"

    aput-object v3, v0, v2

    const/16 v2, 0x1095

    .line 4422
    const-string v3, "4246. object n.\u7269\u4f53;\u5ba2\u4f53,\u5bf9\u8c61;\u76ee\u6807;\u5bbe\u8bed v.(to)\u53cd\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x1096

    .line 4423
    const-string v3, "4247. subject n.\u4e3b\u9898;\u5b66\u79d1 a.\u96b6\u5c5e\u7684;\u6613\u906d..\u7684 v.\u4f7f\u96b6\u5c5e"

    aput-object v3, v0, v2

    const/16 v2, 0x1097

    .line 4424
    const-string v3, "4248. eject v.\u55b7\u5c04,\u6392\u51fa;\u9a71\u9010"

    aput-object v3, v0, v2

    const/16 v2, 0x1098

    .line 4425
    const-string v3, "4249. reject v.\u62d2\u7edd,\u62b5\u5236,\u4e22\u5f03,\u6392\u65a5,\u9000\u6389 n.\u843d\u9009\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x1099

    .line 4426
    const-string v3, "4250. inject vt.\u6ce8\u5c04(\u836f\u6db2\u7b49)\uff1b\u6ce8\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x109a

    .line 4427
    const-string v3, "4251. project n.\u65b9\u6848,\u5de5\u7a0b,\u9879\u76eev.\u6295\u5c04,\u653e\u6620;\u8bbe\u8ba1,\u89c4\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0x109b

    .line 4428
    const-string v3, "4252. dialect n.\u65b9\u8a00"

    aput-object v3, v0, v2

    const/16 v2, 0x109c

    .line 4429
    const-string v3, "4253. elect v.\u9009\u4e3e,\u63a8\u9009;\u9009\u62e9,\u4f5c\u51fa\u9009\u62e9"

    aput-object v3, v0, v2

    const/16 v2, 0x109d

    .line 4430
    const-string v3, "4254. select v.\u9009\u62e9,\u6311\u9009 a.\u7cbe\u9009\u7684,\u9009\u62e9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x109e

    .line 4431
    const-string v3, "4255. reflect v.\u53cd\u5c04,\u53cd\u6620,\u8868\u73b0,\u53cd\u7701,\u6c89\u601d"

    aput-object v3, v0, v2

    const/16 v2, 0x109f

    .line 4432
    const-string v3, "4256. neglect v./n.\u5ffd\u89c6;\u758f\u5ffd,\u6f0f\u505a,\u5ffd\u7565"

    aput-object v3, v0, v2

    const/16 v2, 0x10a0

    .line 4433
    const-string v3, "4257. collect v.\u6536\u96c6,\u641c\u96c6;\u9886\u53d6,\u63a5\u8d70;\u6536(\u7a0e\u7b49);\u805a\u96c6,\u5806\u79ef"

    aput-object v3, v0, v2

    const/16 v2, 0x10a1

    .line 4434
    const-string v3, "4258. recollect v.\u56de\u5fc6,\u60f3\u8d77,\u8bb0\u8d77,\u5fc6\u8d77,\u8bb0\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x10a2

    .line 4435
    const-string v3, "4259. connect vt.\u8fde\u63a5\uff1b\u4e0e\u2026\u8054\u7cfb\uff0c\u63a5\u901a(\u7535\u8bdd) vi.\u8fde\u63a5"

    aput-object v3, v0, v2

    const/16 v2, 0x10a3

    .line 4436
    const-string v3, "4260. aspect n.\u6837\u5b50, \u5916\u8868, \u9762\u8c8c, (\u95ee\u9898\u7b49\u7684)\u65b9\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x10a4

    .line 4437
    const-string v3, "4261. respect n./v.\u5c0a\u656c,\u5c0a\u91cd n.\u656c\u610f,\u95ee\u5019,\u5173\u7cfb,\u65b9\u9762"

    aput-object v3, v0, v2

    const/16 v2, 0x10a5

    .line 4438
    const-string v3, "4262. inspect vt.\u68c0\u67e5,\u8c03\u67e5,\u89c6\u5bdf"

    aput-object v3, v0, v2

    const/16 v2, 0x10a6

    .line 4439
    const-string v3, "4263. prospect n.\u666f\u8272;\u524d\u666f,\u524d\u9014,\u5c55\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x10a7

    .line 4440
    const-string v3, "4264. retrospect v./n.\u56de\u987e\uff0c\u56de\u60f3\uff0c\u8ffd\u6eaf[\u53cd]foresee"

    aput-object v3, v0, v2

    const/16 v2, 0x10a8

    .line 4441
    const-string v3, "4265. suspect v.\u731c\u60f3\uff1b\u6000\u7591\uff1b\u5bdf\u89c9 a.\u53ef\u7591\u7684 n.\u5acc\u7591\u72af"

    aput-object v3, v0, v2

    const/16 v2, 0x10a9

    .line 4442
    const-string v3, "4266. expect v.\u9884\u671f;\u671f\u671b,\u6307\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x10aa

    .line 4443
    const-string v3, "4267. erect v.\u6811\u7acb,\u5efa\u7acb,\u4f7f\u7ad6\u7acb a.\u76f4\u7acb\u7684,\u5782\u76f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10ab

    .line 4444
    const-string v3, "4268. direct a./ad.\u5f84\u76f4\u7684(\u5730) v.\u7ba1\u7406,\u6307\u5bfc;(at,to)\u6307\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x10ac

    .line 4445
    const-string v3, "4269. correct a.\u6b63\u786e\u7684,\u6070\u5f53\u7684,\u7aef\u6b63\u7684 v.\u6539\u6b63,\u7ea0\u6b63,\u77eb\u6b63"

    aput-object v3, v0, v2

    const/16 v2, 0x10ad

    .line 4446
    const-string v3, "4270. insect n.\u6606\u866b"

    aput-object v3, v0, v2

    const/16 v2, 0x10ae

    .line 4447
    const-string v3, "4271. detect v.\u5bdf\u89c9,\u53d1\u89c9,\u4fa6\u5bdf,\u63a2\u6d4b"

    aput-object v3, v0, v2

    const/16 v2, 0x10af

    .line 4448
    const-string v3, "4272. architect n.\u5efa\u7b51\u5e08\uff1b\u8bbe\u8ba1\u5e08\uff1b\u7f14\u9020\u8005\uff1b\u521b\u9020\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x10b0

    .line 4449
    const-string v3, "4273. protect v.(from)\u4fdd\u62a4,\u4fdd\u536b"

    aput-object v3, v0, v2

    const/16 v2, 0x10b1

    .line 4450
    const-string v3, "4274. contradict v.\u53cd\u9a73;\u540c\u2026\u77db\u76fe,\u540c\u2026\u62b5\u89e6"

    aput-object v3, v0, v2

    const/16 v2, 0x10b2

    .line 4451
    const-string v3, "4275. addict v.\u4f7f\u6c89\u6eba\uff1b\u4f7f\u4e0a\u763e n.\u6c89\u6eba\u4e8e\u4e0d\u826f\u55dc\u597d\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x10b3

    .line 4452
    const-string v3, "4276. predict v.\u9884\u8a00,\u9884\u6d4b,\u9884\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0x10b4

    .line 4453
    const-string v3, "4277. verdict n.(\u966a\u5ba1\u56e2\u7684)\u88c1\u51b3,\u5224\u51b3\uff1b\u5224\u65ad\uff1b\u5b9a\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x10b5

    .line 4454
    const-string v3, "4278. conflict n.\u6218\u6597,\u6597\u4e89;\u62b5\u89e6,\u51b2\u7a81 v.(with)\u62b5\u89e6,\u51b2\u7a81"

    aput-object v3, v0, v2

    const/16 v2, 0x10b6

    .line 4455
    const-string v3, "4279. depict v.\u63cf\u7ed8;\u63cf\u5199,\u63cf\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x10b7

    .line 4456
    const-string v3, "4280. strict a.(with)\u4e25\u683c\u7684,\u4e25\u5389\u7684;\u4e25\u8c28\u7684,\u7cbe\u786e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10b8

    .line 4457
    const-string v3, "4281. restrict v.\u9650\u5236,\u7ea6\u675f"

    aput-object v3, v0, v2

    const/16 v2, 0x10b9

    .line 4458
    const-string v3, "4282. district n.\u5730\u533a,\u884c\u653f\u533a;\u7f8e\u56fd\u5404\u5dde\u7684\u4f17\u8bae\u9662\u9009\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x10ba

    .line 4459
    const-string v3, "4283. "

    aput-object v3, v0, v2

    const/16 v2, 0x10bb

    .line 4460
    const-string v3, "4284. "

    aput-object v3, v0, v2

    const/16 v2, 0x10bc

    .line 4461
    const-string v3, "4285. convict v.(\u7ecf\u5ba1\u8baf)\u8bc1\u660e\u2026\u6709\u7f6a,\u5ba3\u5224\u2026\u6709\u7f6a n.\u56da\u72af"

    aput-object v3, v0, v2

    const/16 v2, 0x10bd

    .line 4462
    const-string v3, "4286. distinct a.\u6e05\u695a\u7684,\u660e\u663e\u7684;(from)\u622a\u7136\u4e0d\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10be

    .line 4463
    const-string v3, "4287. instinct n.\u672c\u80fd,\u76f4\u89c9,\u5929\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x10bf

    .line 4464
    const-string v3, "4288. extinct a.\u706d\u7edd\u7684;\u7184\u706d\u4e86\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10c0

    .line 4465
    const-string v3, "4289. deduct vt.\u6263\u9664;\u6f14\u7ece(\u63a8\u7406)"

    aput-object v3, v0, v2

    const/16 v2, 0x10c1

    .line 4466
    const-string v3, "4290. conduct n.\u884c\u4e3a,\u54c1\u884c v.\u5f15\u5bfc;\u7ba1\u7406;\u6307\u6325(\u4e50\u961f);\u4f20\u5bfc"

    aput-object v3, v0, v2

    const/16 v2, 0x10c2

    .line 4467
    const-string v3, "4291. product n.\u4ea7\u54c1,\u4ea7\u7269;\u4e58\u79ef"

    aput-object v3, v0, v2

    const/16 v2, 0x10c3

    .line 4468
    const-string v3, "4292. obstruct v.\u963b\u9694,\u963b\u585e(\u9053\u8def\u3001\u901a\u9053\u7b49)n.\u963b\u788d\u7269,\u969c\u788d\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x10c4

    .line 4469
    const-string v3, "4293. instruct v.\u6559,\u6559\u6388;\u547d\u4ee4,\u6307\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x10c5

    .line 4470
    const-string v3, "4294. construct v.\u5efa\u8bbe,\u5efa\u9020,\u6784\u9020;\u521b\u7acb"

    aput-object v3, v0, v2

    const/16 v2, 0x10c6

    .line 4471
    const-string v3, "4295. bet v.\u8d4c,\u6253\u8d4c n.\u6253\u8d4c,\u8d4c\u6ce8"

    aput-object v3, v0, v2

    const/16 v2, 0x10c7

    .line 4472
    const-string v3, "4296. alphabet n.\u5b57\u6bcd\u8868\uff1b\u521d\u6b65\uff0c\u5165\u95e8"

    aput-object v3, v0, v2

    const/16 v2, 0x10c8

    .line 4473
    const-string v3, "4297. sheet n.\u88ab\u5355;(\u4e00)\u5f20,(\u4e00)\u7247,\u8584\u7247;\u5927\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x10c9

    .line 4474
    const-string v3, "4298. fleet n.\u8230\u961f,\u8239\u961f"

    aput-object v3, v0, v2

    const/16 v2, 0x10ca

    .line 4475
    const-string v3, "4299. meet n.\u4f1a,\u96c6\u4f1a v.\u9047\u89c1;\u4f1a\u8c08;\u8fce\u63a5;\u6ee1\u8db3;\u7b26\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x10cb

    .line 4476
    const-string v3, "4300. discreet a.(\u8a00\u884c)\u8c28\u614e\u7684\uff1b\u614e\u91cd\u7684\uff1b\u6709\u5224\u65ad\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10cc

    .line 4477
    const-string v3, "4301. greet v.\u81f4\u656c,\u656c\u610f,\u8fce\u63a5;\u6251(\u9f3b),\u5165(\u8033),\u89e6(\u76ee)"

    aput-object v3, v0, v2

    const/16 v2, 0x10cd

    .line 4478
    const-string v3, "4302. street n.\u8857\uff0c\u8857\u9053\uff1b\u884c\u8f66\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x10ce

    .line 4479
    const-string v3, "4303. sweet a.\u751c\u7684;\u53ef\u7231\u7684,\u7f8e\u597d\u7684 n.(\u5e38pl.)\u7cd6\u679c;\u751c\u98df"

    aput-object v3, v0, v2

    const/16 v2, 0x10cf

    .line 4480
    const-string v3, "4304. buffet n.\u81ea\u52a9\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x10d0

    .line 4481
    const-string v3, "4305. get v.\u83b7\u5f97\uff0c\u5f97\u5230\uff1b\u4f7f\uff0c\u4f7f\u5f97\uff1b\u53d8\u5f97\uff0c\u6210\u4e3a\uff1b\u5230\u8fbe"

    aput-object v3, v0, v2

    const/16 v2, 0x10d1

    .line 4482
    const-string v3, "4306. budget n.\u9884\u7b97 v.\u505a\u9884\u7b97"

    aput-object v3, v0, v2

    const/16 v2, 0x10d2

    .line 4483
    const-string v3, "4307. target n.\u76ee\u6807,\u5bf9\u8c61,\u9776\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x10d3

    .line 4484
    const-string v3, "4308. forget v.\u5fd8\u8bb0,\u9057\u5fd8"

    aput-object v3, v0, v2

    const/16 v2, 0x10d4

    .line 4485
    const-string v3, "4309. prophet n.\u9884\u8a00\u5bb6\uff1b\u5148\u77e5\uff1b\u63d0\u5021\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x10d5

    .line 4486
    const-string v3, "4310. diet n.\u996e\u98df,\u98df\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x10d6

    .line 4487
    const-string v3, "4311. quiet a.\u5b89\u9759\u7684,\u5e73\u9759\u7684 n.\u5b89\u9759 v.\u4f7f\u5b89\u9759,\u5e73\u9759"

    aput-object v3, v0, v2

    const/16 v2, 0x10d7

    .line 4488
    const-string v3, "4312. jet n.\u55b7\u6c14\u53d1\u52a8\u673a,\u55b7\u6c14\u5f0f\u98de\u673a;\u55b7\u53e3 v.\u55b7\u51fa,\u55b7\u5c04"

    aput-object v3, v0, v2

    const/16 v2, 0x10d8

    .line 4489
    const-string v3, "4313. jacket n.\u77ed\u4e0a\u8863,\u8304\u514b\u886b"

    aput-object v3, v0, v2

    const/16 v2, 0x10d9

    .line 4490
    const-string v3, "4314. packet n.\u5c0f\u5305\u88f9,\u5c0f\u6346;\u76d2;\u4e00\u6346,\u4e00\u624e;\u90ae\u8239,\u73ed\u8f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x10da

    .line 4491
    const-string v3, "4315. racket n.\u7403\u62cd"

    aput-object v3, v0, v2

    const/16 v2, 0x10db

    .line 4492
    const-string v3, "4316. bracket n.(\u65b9)\u62ec\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x10dc

    .line 4493
    const-string v3, "4317. cricket n.\u677f\u7403;\u87cb\u87c0"

    aput-object v3, v0, v2

    const/16 v2, 0x10dd

    .line 4494
    const-string v3, "4318. ticket n.\u7968,\u5165\u573a\u5238;\u7968\u7b7e;(\u4ea4\u901a\u8fdd\u7ae0)\u7f5a\u6b3e\u4f20\u7968"

    aput-object v3, v0, v2

    const/16 v2, 0x10de

    .line 4495
    const-string v3, "4319. pocket n.\u8863\u888b a.\u8896\u73cd\u7684,\u5c0f\u578b\u7684 v.\u628a\u2026\u88c5\u5165\u888b\u5185"

    aput-object v3, v0, v2

    const/16 v2, 0x10df

    .line 4496
    const-string v3, "4320. rocket n.\u706b\u7bad"

    aput-object v3, v0, v2

    const/16 v2, 0x10e0

    .line 4497
    const-string v3, "4321. bucket n.\u6c34\u6876,\u540a\u6876"

    aput-object v3, v0, v2

    const/16 v2, 0x10e1

    .line 4498
    const-string v3, "4322. blanket n.\u6bef\u5b50(\u53ef\u6570)\uff1b\u539a\u539a\u4e00\u5c42(\u53ef\u6570) vt.\u94fa\u4e0a\u4e00\u5c42"

    aput-object v3, v0, v2

    const/16 v2, 0x10e2

    .line 4499
    const-string v3, "4323. market n.\u96c6\u5e02,\u5e02\u573a;\u9500\u8def,\u9700\u6c42(\u91cf) v.\u9500\u552e"

    aput-object v3, v0, v2

    const/16 v2, 0x10e3

    .line 4500
    const-string v3, "4324. supermarket n.\u8d85\u7ea7\u5e02\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x10e4

    .line 4501
    const-string v3, "4325. basket n.\u7b50\uff0c\u7bee\uff0c\u7bd3"

    aput-object v3, v0, v2

    const/16 v2, 0x10e5

    .line 4502
    const-string v3, "4326. let v.\u8ba9\uff0c\u5141\u8bb8\uff0c\u542c\u4efb\uff1b\u8bbe\uff0c\u5047\u8bbe\uff1b\u51fa\u79df\uff0c\u79df\u7ed9"

    aput-object v3, v0, v2

    const/16 v2, 0x10e6

    .line 4503
    const-string v3, "4327. tablet n.\u836f\u7247;\u7891,\u533e"

    aput-object v3, v0, v2

    const/16 v2, 0x10e7

    .line 4504
    const-string v3, "4328. leaflet n.\u5c0f\u53f6,\u5ae9\u53f6;\u4f20\u5355,\u6d3b\u9875"

    aput-object v3, v0, v2

    const/16 v2, 0x10e8

    .line 4505
    const-string v3, "4329. pamphlet n.\u5c0f\u518c\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x10e9

    .line 4506
    const-string v3, "4330. toilet n.\u5395\u6240,\u76e5\u6d17\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x10ea

    .line 4507
    const-string v3, "4331. ballet n.\u82ad\u857e\u821e\uff0c\u82ad\u857e\u821e\u5267\uff1b\u82ad\u857e\u821e\u56e2"

    aput-object v3, v0, v2

    const/16 v2, 0x10eb

    .line 4508
    const-string v3, "4332. wallet n.\u76ae\u5939,\u94b1\u5305"

    aput-object v3, v0, v2

    const/16 v2, 0x10ec

    .line 4509
    const-string v3, "4333. bullet n.\u5b50\u5f39,\u67aa\u5f39"

    aput-object v3, v0, v2

    const/16 v2, 0x10ed

    .line 4510
    const-string v3, "4334. inlet n.\u6c34\u6e7e,\u5c0f\u6e7e;\u8fdb\u53e3,\u5165\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x10ee

    .line 4511
    const-string v3, "4335. violet n.\u7d2b\u7f57\u5170,\u7d2b\u8272 a.\u7d2b\u8272\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10ef

    .line 4512
    const-string v3, "4336. ultraviolet a./n.\u7d2b\u5916\u7ebf(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x10f0

    .line 4513
    const-string v3, "4337. outlet n.\u51fa\u8def,\u51fa\u53e3;\u9500\u8def,\u5e02\u573a;\u53d1\u6cc4\u65b9\u6cd5;\u7535\u6e90\u63d2\u5ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x10f1

    .line 4514
    const-string v3, "4338. helmet n.\u5934\u76d4,\u94a2\u76d4"

    aput-object v3, v0, v2

    const/16 v2, 0x10f2

    .line 4515
    const-string v3, "4339. net n.\u7f51,\u7f51\u72b6\u7269 v.\u7528\u7f51\u6355,\u4f7f\u843d\u7f51 a.\u7eaf\u51c0\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10f3

    .line 4516
    const-string v3, "4340. planet n.\u884c\u661f"

    aput-object v3, v0, v2

    const/16 v2, 0x10f4

    .line 4517
    const-string v3, "4341. magnet n.\u78c1\u4f53,\u78c1\u94c1"

    aput-object v3, v0, v2

    const/16 v2, 0x10f5

    .line 4518
    const-string v3, "4342. cabinet n.\u5185\u9601\uff0c\u5185\u9601\u4f1a\u8bae\uff1b(\u5e26\u73bb\u7483\u95e8\u5b58\u7269\u54c1\u7684)\u6a71\u67dc"

    aput-object v3, v0, v2

    const/16 v2, 0x10f6

    .line 4519
    const-string v3, "4343. internet n.[the\uff5e]\u56fd\u9645\u4e92\u8054\u7f51\uff0c\u56e0\u7279\u7f51"

    aput-object v3, v0, v2

    const/16 v2, 0x10f7

    .line 4520
    const-string v3, "4344. poet n.\u8bd7\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x10f8

    .line 4521
    const-string v3, "4345. pet n.\u7231\u755c,\u5ba0\u513f a.\u5ba0\u7231\u7684,\u8868\u793a\u4eb2\u6635\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x10f9

    .line 4522
    const-string v3, "4346. trumpet n.\u5587\u53ed,\u5c0f\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x10fa

    .line 4523
    const-string v3, "4347. puppet n.\u6728\u5076,\u5080\u5121"

    aput-object v3, v0, v2

    const/16 v2, 0x10fb

    .line 4524
    const-string v3, "4348. carpet n.\u5730\u6bef"

    aput-object v3, v0, v2

    const/16 v2, 0x10fc

    .line 4525
    const-string v3, "4349. cigaret n.(cigarette)\u9999\u70df,\u7eb8\u70df,\u5377\u70df"

    aput-object v3, v0, v2

    const/16 v2, 0x10fd

    .line 4526
    const-string v3, "4350. secret a.\u79d8\u5bc6\u7684,\u673a\u5bc6\u7684 n.\u79d8\u5bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x10fe

    .line 4527
    const-string v3, "4351. regret v./n.\u9057\u61be,\u61ca\u6094,\u62b1\u6b49"

    aput-object v3, v0, v2

    const/16 v2, 0x10ff

    .line 4528
    const-string v3, "4352. interpret vt.\u89e3\u91ca,\u8bf4\u660e;\u53e3\u8bd1"

    aput-object v3, v0, v2

    const/16 v2, 0x1100

    .line 4529
    const-string v3, "4353. set n.\u4e00\u5957,\u4e00\u526f,\u88c5\u7f6e,\u63a5\u53d7\u673av.\u63d0\u51fa,\u8c03\u6574,\u65e5\u843d"

    aput-object v3, v0, v2

    const/16 v2, 0x1101

    .line 4530
    const-string v3, "4354. offset n.\u5206\u652f,\u8865\u507f v.\u62b5\u6d88,\u8865\u507f"

    aput-object v3, v0, v2

    const/16 v2, 0x1102

    .line 4531
    const-string v3, "4355. sunset n.\u65e5\u843d\uff0c\u508d\u665a\uff1b\u665a\u971e"

    aput-object v3, v0, v2

    const/16 v2, 0x1103

    .line 4532
    const-string v3, "4356. closet n.(\u58c1)\u6a71a.\u79c1\u4e0b\u7684vt.\u628a\u2026\u5f15\u8fdb\u5bc6\u5ba4\u4f1a\u8c08"

    aput-object v3, v0, v2

    const/16 v2, 0x1104

    .line 4533
    const-string v3, "4357. upset v.\u4f7f\u2026\u5fc3\u70e6\u610f\u4e71;\u6253\u7ffb,\u63a8\u7ffba.\u96be\u8fc7\u7684;\u4e0d\u5b89\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1105

    .line 4534
    const-string v3, "4358. asset n.(pl.)\u8d44\u4ea7,\u8d22\u4ea7\uff1b\u6709\u4ef7\u503c\u7684\u7269\u54c1\uff1b\u5929\u8d4b"

    aput-object v3, v0, v2

    const/16 v2, 0x1106

    .line 4535
    const-string v3, "4359. outset n.\u5f00\u59cb,\u5f00\u7aef"

    aput-object v3, v0, v2

    const/16 v2, 0x1107

    .line 4536
    const-string v3, "4360. banquet n.(\u6b63\u5f0f\u7684)\u5bb4\u4f1a vi.\u53c2\u52a0\u5bb4\u4f1a vt.\u5bb4\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x1108

    .line 4537
    const-string v3, "4361. velvet n.\u4e1d\u7ed2,\u5929\u9e45\u7ed2 a.\u4e1d\u7ed2\u5236\u7684,\u67d4\u8f6f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1109

    .line 4538
    const-string v3, "4362. wet a.\u6e7f\u7684,\u6f6e\u6e7f\u7684;\u6709\u96e8\u7684,\u591a\u96e8\u7684 v.\u5f04\u6e7f,\u6cbe\u6e7f"

    aput-object v3, v0, v2

    const/16 v2, 0x110a

    .line 4539
    const-string v3, "4363. yet ad.\u8fd8\uff0c\u5c1a\uff0c\u4ecd\u7136\uff1b\u5df2\u7ecf conj.\u7136\u800c ad.\u751a\u81f3"

    aput-object v3, v0, v2

    const/16 v2, 0x110b

    .line 4540
    const-string v3, "4364. shaft n.\u8f74;\u6746\u72b6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x110c

    .line 4541
    const-string v3, "4365. craft n.\u5de5\u827a,\u624b\u827a,\u6280\u5de7;\u98de\u673a,\u98de\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0x110d

    .line 4542
    const-string v3, "4366. spacecraft n.\u5b87\u5b99\u98de\u8239"

    aput-object v3, v0, v2

    const/16 v2, 0x110e

    .line 4543
    const-string v3, "4367. aircraft n.\u98de\u673a\uff0c\u98de\u8239\uff0c\u98de\u884c\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x110f

    .line 4544
    const-string v3, "4368. draft n.\u8349\u7a3f,\u8349\u6848,\u8349\u56fe v.\u8d77\u8349,\u8349\u62df"

    aput-object v3, v0, v2

    const/16 v2, 0x1110

    .line 4545
    const-string v3, "4369. theft n.\u5077\u7a83(\u884c\u4e3a)\uff0c\u5077\u7a83\u7f6a"

    aput-object v3, v0, v2

    const/16 v2, 0x1111

    .line 4546
    const-string v3, "4370. left n.\u5de6\u9762\uff0c\u5de6\u65b9 a.\u5de6\u8fb9\u7684\uff0c\u5de6\u9762\u7684\uff1b\u5728\u5de6\u65b9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1112

    .line 4547
    const-string v3, "4371. gift n.\u793c\u54c1,\u8d60\u54c1;\u5929\u8d4b,\u624d\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0x1113

    .line 4548
    const-string v3, "4372. shift v.\u66ff\u6362,\u8f6c\u79fbn.\u8f6c\u6362,\u8f6c\u53d8;(\u8f6e)\u73ed,(\u6362)\u73ed"

    aput-object v3, v0, v2

    const/16 v2, 0x1114

    .line 4549
    const-string v3, "4373. lift v.\u5347\u8d77,\u4e3e\u8d77,\u6d88\u6563  n.\u7535\u68af,\u4e0a\u5347,\u514d\u8d39\u642d\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x1115

    .line 4550
    const-string v3, "4374. drift v./n.\u6f02,\u6f02\u6d41(\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x1116

    .line 4551
    const-string v3, "4375. thrift a.\u8282\u7ea6\uff0c\u8282\u4fed"

    aput-object v3, v0, v2

    const/16 v2, 0x1117

    .line 4552
    const-string v3, "4376. swift a./ad.\u5feb\u7684(\u5730);\u654f\u6377\u7684(\u5730)a.\u7acb\u523b\u7684n.\u96e8\u71d5"

    aput-object v3, v0, v2

    const/16 v2, 0x1118

    .line 4553
    const-string v3, "4377. soft a.\u8f6f\u7684;\u6e29\u67d4\u7684;\u7ec6\u5ae9\u7684,\u5149\u6ed1\u7684;\u4e0d\u542b\u9152\u7cbe\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1119

    .line 4554
    const-string v3, "4378. straight a.\u76f4\u7684;\u6574\u9f50\u7684,\u7aef\u6b63\u7684 ad.\u76f4\u63a5;\u6b63\u76f4,\u76f4\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x111a

    .line 4555
    const-string v3, "4379. eight num.\u516b pron.\u516b(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x111b

    .line 4556
    const-string v3, "4380. height n.\u9ad8,\u9ad8\u5ea6;(\u5e38pl.)\u9ad8\u5730,\u9ad8\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x111c

    .line 4557
    const-string v3, "4381. freight n.\u8d27\u7269,\u8d27\u8fd0,\u8fd0\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0x111d

    .line 4558
    const-string v3, "4382. weight n.\u91cd\u91cf;\u8d1f\u8377,\u91cd\u62c5;\u91cd\u8981\u6027,\u5206\u91cf;\u781d\u7801,\u79e4\u7823"

    aput-object v3, v0, v2

    const/16 v2, 0x111e

    .line 4559
    const-string v3, "4383. fight v./n.\u6253(\u4ed7),\u640f\u6597,\u6597\u4e89,\u6218\u6597"

    aput-object v3, v0, v2

    const/16 v2, 0x111f

    .line 4560
    const-string v3, "4384. light n.\u5149\uff1b\u706f v.\u70b9\u71c3\uff1b\u7167\u4eae a.\u8f7b(\u5feb)\uff1b\u6de1\uff1b\u660e\u4eae"

    aput-object v3, v0, v2

    const/16 v2, 0x1120

    .line 4561
    const-string v3, "4385. delight n.\u5feb\u4e50,\u9ad8\u5174 v.(\u4f7f)\u9ad8\u5174,(\u4f7f)\u6b23\u559c"

    aput-object v3, v0, v2

    const/16 v2, 0x1121

    .line 4562
    const-string v3, "4386. flight n.\u98de\u7fd4,\u98de\u884c;\u822a\u73ed;\u822a\u7a0b;\u9003\u8dd1;\u697c\u68af\u7684\u4e00\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0x1122

    .line 4563
    const-string v3, "4387. highlight v.\u4f7f\u663e\u8457,\u4f7f\u7a81\u51fa;\u5f3a\u8c03 n.\u6700\u7cbe\u5f69\u7684\u90e8\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x1123

    .line 4564
    const-string v3, "4388. plight n.\u60c5\u51b5,\u72b6\u6001,\u56f0\u5883,\u76df\u8a93(\u5a5a\u59fb) v.\u4fdd\u8bc1,\u7ea6\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x1124

    .line 4565
    const-string v3, "4389. slight a.\u8f7b\u5fae\u7684,\u5fae\u5c0f\u7684;\u7ea4\u7ec6\u7684,\u7626\u5f31\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1125

    .line 4566
    const-string v3, "4390. daylight n.\u65e5\u5149,\u767d\u663c,\u9ece\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x1126

    .line 4567
    const-string v3, "4391. might aux.v.\u53ef\u80fd,\u4e5f\u8bb8 n.\u529b\u91cf,\u5a01\u529b,\u6743\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x1127

    .line 4568
    const-string v3, "4392. night n.\u591c\u95f4\uff1b\u591c\uff1b\u665a(\u4e0a)"

    aput-object v3, v0, v2

    const/16 v2, 0x1128

    .line 4569
    const-string v3, "4393. tonight ad.\u5728\u4eca\u665a\uff1b\u5728\u4eca\u591c n.\u4eca\u665a\uff0c\u4eca\u591c"

    aput-object v3, v0, v2

    const/16 v2, 0x1129

    .line 4570
    const-string v3, "4394. overnight a.\u901a\u5bb5\u7684,\u665a\u4e0a\u7684 ad.\u5728\u6628\u591c,\u4e00\u591c\u5de5\u592b,\u7a81\u7136"

    aput-object v3, v0, v2

    const/16 v2, 0x112a

    .line 4571
    const-string v3, "4395. fortnight n.\u4e24\u661f\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x112b

    .line 4572
    const-string v3, "4396. right a.\u53f3\u7684,\u6b63\u786e\u7684 n.\u53f3,\u6743\u5229ad.\u5728\u53f3\u8fb9,\u6b63\u786e\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x112c

    .line 4573
    const-string v3, "4397. bright a.\u660e\u4eae\u7684,\u8f89\u714c\u7684;\u806a\u660e\u7684;\u6b22\u5feb\u7684,\u7f8e\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x112d

    .line 4574
    const-string v3, "4398. fright n.\u6050\u6016"

    aput-object v3, v0, v2

    const/16 v2, 0x112e

    .line 4575
    const-string v3, "4399. upright a.\u5782\u76f4\u7684,\u76f4\u7acb\u7684;\u6b63\u76f4\u7684,\u8bda\u5b9e\u7684 ad.\u7ad6\u7acb\u7740"

    aput-object v3, v0, v2

    const/16 v2, 0x112f

    .line 4576
    const-string v3, "4400. copyright n.\uff0fa.\u7248\u6743(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x1130

    .line 4577
    const-string v3, "4401. sight n.\u89c6\u529b;\u671b\u89c1,\u77a5\u89c1;\u89c6\u57df;\u773c\u754c;\u60c5\u666f,\u5947\u89c2"

    aput-object v3, v0, v2

    const/16 v2, 0x1131

    .line 4578
    const-string v3, "4402. eyesight n.\u89c6\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x1132

    .line 4579
    const-string v3, "4403. insight n.\u6d1e\u5bdf\u529b,\u89c1\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x1133

    .line 4580
    const-string v3, "4404. tight a.\u7d27\u7684;\u7d27\u8eab\u7684,\u88c5\u7d27\u7684;\u5bc6\u5c01\u7684 ad.\u7d27\u7d27\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1134

    .line 4581
    const-string v3, "4405. ought aux.\u5e94\u8be5(\u4f7f\u7528\u65f6,\u4e4b\u540e\u5e94\u63a5to,\u518d\u63a5\u52a8\u8bcd\u539f\u5f62)"

    aput-object v3, v0, v2

    const/16 v2, 0x1135

    .line 4582
    const-string v3, "4406. thought n.\u601d\u60f3\uff0c\u601d\u8003\uff0c\u601d\u7ef4\uff1b\u610f\u56fe\uff0c\u6253\u7b97\uff1b\u60f3\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x1136

    .line 4583
    const-string v3, "4407. drought n.\u65f1\u707e,\u5e72\u65f1"

    aput-object v3, v0, v2

    const/16 v2, 0x1137

    .line 4584
    const-string v3, "4408. it pron.\u5b83\uff1b[\u4f5c\u65e0\u4eba\u79f0\u52a8\u8bcd\u7684\u4e3b\u8bed]"

    aput-object v3, v0, v2

    const/16 v2, 0x1138

    .line 4585
    const-string v3, "4409. bait n.\u9975\uff0c\u5f15\u8bf1\u7269 vt.\u7528\u9975\u5f15\u8bf1\uff1b\u6298\u78e8\uff0c\u595a\u843d"

    aput-object v3, v0, v2

    const/16 v2, 0x1139

    .line 4586
    const-string v3, "4410. trait n.\u7279\u5f81,\u7279\u70b9,\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x113a

    .line 4587
    const-string v3, "4411. portrait n.\u8096\u50cf,\u753b\u50cf"

    aput-object v3, v0, v2

    const/16 v2, 0x113b

    .line 4588
    const-string v3, "4412. wait v.(for)\u7b49\u5f85\uff1b(on)\u4f8d\u5019 n.\u7b49\u5019\uff0c\u7b49\u5f85\u65f6\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x113c

    .line 4589
    const-string v3, "4413. await vt.\u7b49\u5019\uff0c\u671f\u5f85\uff1b(\u4e8b\u60c5\u7b49)\u964d\u4e34\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x113d

    .line 4590
    const-string v3, "4414. bit n.\u4e00\u70b9,\u4e00\u4e9b;\u5c0f\u5757,\u5c11\u91cf;\u7247\u523b;[\u8ba1]\u4f4d,\u6bd4\u7279"

    aput-object v3, v0, v2

    const/16 v2, 0x113e

    .line 4591
    const-string v3, "4415. habit n.\u4e60\u60ef,\u4e60\u6027,\u813e\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x113f

    .line 4592
    const-string v3, "4416. inhabit vt.\u5c45\u4f4f\u4e8e,\u5b58\u5728\u4e8e;\u6816\u606f\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x1140

    .line 4593
    const-string v3, "4417. rabbit n.\u5154\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x1141

    .line 4594
    const-string v3, "4418. inhibit vt.\u6291\u5236\uff0c\u7ea6\u675f"

    aput-object v3, v0, v2

    const/16 v2, 0x1142

    .line 4595
    const-string v3, "4419. prohibit v.\u7981\u6b62,\u4e0d\u51c6;\u963b\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x1143

    .line 4596
    const-string v3, "4420. exhibit v.\u5c55\u51fa,\u9648\u5217 n.\u5c55\u89c8\u54c1,\u9648\u5217\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x1144

    .line 4597
    const-string v3, "4421. orbit n.\u8f68\u9053 v.(\u4f7f)\u6cbf\u8f68\u9053\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x1145

    .line 4598
    const-string v3, "4422. deficit n.\u8d64\u5b57,\u9006\u5dee;\u4e8f\u635f,\u4e8f\u7a7a;\u4e0d\u8db3,\u7f3a\u4e4f"

    aput-object v3, v0, v2

    const/16 v2, 0x1146

    .line 4599
    const-string v3, "4423. implicit a.\u542b\u84c4\u7684;(in)\u56fa\u6709\u7684;\u65e0\u7591\u95ee\u7684;\u7edd\u5bf9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1147

    .line 4600
    const-string v3, "4424. explicit a.\u8be6\u8ff0\u7684,\u660e\u786e\u7684;\u5766\u7387\u7684;\u663e\u7136\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1148

    .line 4601
    const-string v3, "4425. edit v.\u7f16\u8f91,\u6821\u8ba2"

    aput-object v3, v0, v2

    const/16 v2, 0x1149

    .line 4602
    const-string v3, "4426. credit v./n.\u4fe1\u7528,\u4fe1\u4efb n.\u4fe1\u7528\u8d37\u6b3e,\u8d4a\u6b20;\u540d\u8a89,\u540d\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x114a

    .line 4603
    const-string v3, "4427. audit v.\u5ba1\u8ba1\uff1b\u67e5\u5e10\uff1b\u6838\u5bf9\uff1b\u65c1\u542c"

    aput-object v3, v0, v2

    const/16 v2, 0x114b

    .line 4604
    const-string v3, "4428. deceit n.\u6b3a\u9a97,\u6b3a\u9a97\u884c\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x114c

    .line 4605
    const-string v3, "4429. fit a.(\u75c5\u7684)\u53d1\u4f5c\uff0c\u75c9\u631b v./a.n.\u5408\u9002,\u8bd5\u7a7f,\u5b89\u88c5"

    aput-object v3, v0, v2

    const/16 v2, 0x114d

    .line 4606
    const-string v3, "4430. benefit n.\u5229\u76ca,\u597d\u5904,\u6069\u60e0 v.\u6709\u76ca\u4e8e;(from,by)\u53d7\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0x114e

    .line 4607
    const-string v3, "4431. profit n.\u5229\u6da6,\u6536\u76ca v.(by,from)\u5f97\u5229,\u83b7\u76ca;\u6709\u5229\u4e8e"

    aput-object v3, v0, v2

    const/16 v2, 0x114f

    .line 4608
    const-string v3, "4432. outfit n.\u7528\u5177,\u673a\u6784,\u5168\u5957\u88c5\u914d v.\u914d\u5907,(\u5f97\u5230)\u88c5\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x1150

    .line 4609
    const-string v3, "4433. hit v.\u6253,\u51fb;\u78b0\u649e n.\u51fb\u4e2d;\u6210\u529f\u800c\u98ce\u884c\u4e00\u65f6\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1151

    .line 4610
    const-string v3, "4434. kit n.\u6210\u5957\u5de5\u5177,\u7528\u5177\u5305,\u5de5\u5177\u7bb1"

    aput-object v3, v0, v2

    const/16 v2, 0x1152

    .line 4611
    const-string v3, "4435. split v.\u88c2\u5f00,\u5288\u5f00;\u5206\u88c2,\u5206\u79bb n.\u5206\u5316,\u5206\u88c2,\u88c2\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1153

    .line 4612
    const-string v3, "4436. slit v.\u5207\u5f00,\u622a\u5f00,\u7eb5\u5272 n.\u7ec6\u957f\u88c2\u7f1d,\u72ed\u957f\u5207\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1154

    .line 4613
    const-string v3, "4437. submit v.(to)\u4f7f\u670d\u4ece,\u5c48\u670d;(to)\u5448\u9001,\u63d0\u4ea4"

    aput-object v3, v0, v2

    const/16 v2, 0x1155

    .line 4614
    const-string v3, "4438. admit vt.\u627f\u8ba4\uff0c\u4f9b\u8ba4\uff1b\u51c6\u8bb8\u2026\u8fdb\u5165\uff0c\u51c6\u8bb8...\u52a0\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x1156

    .line 4615
    const-string v3, "4439. emit vt.\u53d1\u51fa;\u653e\u5c04;\u5410\u9732;\u6563\u53d1;\u53d1\u8868;\u53d1\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x1157

    .line 4616
    const-string v3, "4440. limit n.\u754c\u9650,\u9650\u5ea6,\u8303\u56f4 v.(to)\u9650\u5236,\u9650\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x1158

    .line 4617
    const-string v3, "4441. commit v.\u628a\u2026\u4ea4\u6258\u7ed9,\u63d0\u4ea4;\u72af(\u9519\u8bef),\u5e72(\u574f\u4e8b)"

    aput-object v3, v0, v2

    const/16 v2, 0x1159

    .line 4618
    const-string v3, "4442. summit n.\u9876\uff0c\u6700\u9ad8\u70b9\uff1b\u98a0\u5cf0\uff0c\u9ad8\u5cf0\uff1b\u6700\u9ad8\u7ea7\u4f1a\u8bae"

    aput-object v3, v0, v2

    const/16 v2, 0x115a

    .line 4619
    const-string v3, "4443. omit v.\u7701\u7565,\u5220\u53bb;\u9057\u6f0f,\u5ffd\u7565"

    aput-object v3, v0, v2

    const/16 v2, 0x115b

    .line 4620
    const-string v3, "4444. permit v.\u8bb8\u53ef,\u5141\u8bb8 n.\u8bb8\u53ef\u8bc1,\u6267\u7167"

    aput-object v3, v0, v2

    const/16 v2, 0x115c

    .line 4621
    const-string v3, "4445. transmit vt.\u4f20\u8f93/\u5bfc\uff1b\u8f6c\u9001\uff1b\u53d1\u5c04 vi.\u53d1\u5c04\u4fe1\u53f7\uff1b\u53d1\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x115d

    .line 4622
    const-string v3, "4446. knit v.\u7f16\u7ec7,\u7f16\u7ed3;\u63a5\u5408,\u7c98\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x115e

    .line 4623
    const-string v3, "4447. unit n.\u5355\u4f4d,\u5355\u5143;\u90e8\u4ef6,\u5143\u4ef6;\u673a\u7ec4,\u88c5\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x115f

    .line 4624
    const-string v3, "4448. exploit v.\u5f00\u62d3;\u5f00\u53d1;\u5265\u524a n.\u529f\u7ee9[\u52cb];\u4e1a\u7ee9"

    aput-object v3, v0, v2

    const/16 v2, 0x1160

    .line 4625
    const-string v3, "4449. pit n.\u5751,\u9677\u9631;\u7164\u77ff,\u77ff\u4e95"

    aput-object v3, v0, v2

    const/16 v2, 0x1161

    .line 4626
    const-string v3, "4450. spit v.\u5410(\u553e\u6cab),\u5410\u75f0 n.\u553e\u6db2"

    aput-object v3, v0, v2

    const/16 v2, 0x1162

    .line 4627
    const-string v3, "4451. inherit vt.\u7ee7\u627f(\u91d1\u94b1\u7b49)\uff0c\u7ecf\u9057\u4f20\u800c\u5f97(\u6027\u683c\u3001\u7279\u5f81)"

    aput-object v3, v0, v2

    const/16 v2, 0x1163

    .line 4628
    const-string v3, "4452. merit n.\u4f18\u70b9,\u4ef7\u503c,\u529f\u7ee9 v.\u503c\u5f97,\u5e94\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x1164

    .line 4629
    const-string v3, "4453. spirit n.\u7cbe\u795e;\u5fd7\u6c14;(pl.)\u60c5\u7eea,\u5fc3\u60c5;(pl.)\u9152\u7cbe"

    aput-object v3, v0, v2

    const/16 v2, 0x1165

    .line 4630
    const-string v3, "4454. sit vi.\u5750\uff0c\u5750\u4e0b\uff1b\u4f4d\u4e8e\uff1b\u6816\u606f\uff1b\u5b75\u5375 vt.\u4f7f\u5c31\u5750"

    aput-object v3, v0, v2

    const/16 v2, 0x1166

    .line 4631
    const-string v3, "4455. visit n.\u8bbf\u95ee,\u53c2\u89c2 v.\u8bbf\u95ee,\u53c2\u89c2;\u89c6\u5bdf;\u964d\u4e34;\u95f2\u8c08"

    aput-object v3, v0, v2

    const/16 v2, 0x1167

    .line 4632
    const-string v3, "4456. deposit v.\u5b58\u653e;\u4f7f\u6c89\u6dc0;\u4ed8(\u4fdd\u8bc1\u91d1) n.\u5b58\u6b3e;\u6c89\u79ef\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1168

    .line 4633
    const-string v3, "4457. circuit n.\u73af\u884c,\u5468\u7ebf,\u5de1\u56de;\u7535\u8def,\u7ebf\u8def"

    aput-object v3, v0, v2

    const/16 v2, 0x1169

    .line 4634
    const-string v3, "4458. biscuit n.\u997c\u5e72,\u70b9\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x116a

    .line 4635
    const-string v3, "4459. quit v.\u79bb\u5f00,\u9000\u51fa;\u505c\u6b62,\u653e\u5f03,\u8f9e\u804c"

    aput-object v3, v0, v2

    const/16 v2, 0x116b

    .line 4636
    const-string v3, "4460. recruit v.\u5f81\u52df(\u65b0\u5175)\uff0c\u5438\u6536\uff1b\u8865\u5145 n.\u65b0\u6210\u5458\uff0c\u65b0\u5175"

    aput-object v3, v0, v2

    const/16 v2, 0x116c

    .line 4637
    const-string v3, "4461. fruit n.\u6c34\u679c,\u679c\u5b9e;\u6210\u679c,\u6548\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0x116d

    .line 4638
    const-string v3, "4462. suit v.\u5408\u9002,\u9002\u5408;\u76f8\u914d,\u9002\u5e94 n.\u4e00\u5957\u897f\u670d;\u8bc9\u8bbc"

    aput-object v3, v0, v2

    const/16 v2, 0x116e

    .line 4639
    const-string v3, "4463. pursuit n.\u8ffd\u8d76,\u8ffd\u6c42;\u804c\u4e1a,\u5de5\u4f5c"

    aput-object v3, v0, v2

    const/16 v2, 0x116f

    .line 4640
    const-string v3, "4464. wit n.\u667a\u529b,\u624d\u667a,\u667a\u6167"

    aput-object v3, v0, v2

    const/16 v2, 0x1170

    .line 4641
    const-string v3, "4465. exit n.\u51fa\u53e3,\u901a\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x1171

    .line 4642
    const-string v3, "4466. halt n.\u6b62\u6b65,\u505c\u6b65,\u505c\u6b62\u524d\u8fdb v.\u6b62\u6b65,(\u4f7f)\u505c\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x1172

    .line 4643
    const-string v3, "4467. salt n.\u76d0,\u76d0,\u7c7b v.\u814c,\u76d0\u6e0d"

    aput-object v3, v0, v2

    const/16 v2, 0x1173

    .line 4644
    const-string v3, "4468. belt n.(\u76ae)\u5e26,\u8170\u5e26;\u5730\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x1174

    .line 4645
    const-string v3, "4469. melt v.(\u4f7f)\u878d\u5316,(\u4f7f)\u7194\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x1175

    .line 4646
    const-string v3, "4470. tilt v.(\u4f7f)\u503e\u4fa7\uff1b(\u4f7f)\u503e\u659c n.\u503e\u4fa7\uff1b\u503e\u659c"

    aput-object v3, v0, v2

    const/16 v2, 0x1176

    .line 4647
    const-string v3, "4471. guilt n.\u7f6a\u8fc7,\u5185\u759a"

    aput-object v3, v0, v2

    const/16 v2, 0x1177

    .line 4648
    const-string v3, "4472. quilt n.\u88ab\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x1178

    .line 4649
    const-string v3, "4473. bolt n.\u87ba\u6813,(\u95e8,\u7a97\u7684)\u63d2\u9500 v.\u95e9(\u95e8),\u5173\u7a97,\u62f4\u4f4f"

    aput-object v3, v0, v2

    const/16 v2, 0x1179

    .line 4650
    const-string v3, "4474. volt n.\u4f0f\u7279"

    aput-object v3, v0, v2

    const/16 v2, 0x117a

    .line 4651
    const-string v3, "4475. revolt v./n.\u53cd\u6297,\u8d77\u4e49"

    aput-object v3, v0, v2

    const/16 v2, 0x117b

    .line 4652
    const-string v3, "4476. fault n.\u8fc7\u5931,\u8fc7\u9519;\u7f3a\u70b9,\u6bdb\u75c5"

    aput-object v3, v0, v2

    const/16 v2, 0x117c

    .line 4653
    const-string v3, "4477. assault v.\u731b\u70c8\u5730\u653b\u51fb\uff0c\u88ad\u51fb n.\u7a81\u7136\u800c\u731b\u70c8\u7684\u653b\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0x117d

    .line 4654
    const-string v3, "4478. difficult a.\u56f0\u96be\u7684,\u8270\u96be\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x117e

    .line 4655
    const-string v3, "4479. adult n.\u6210\u5e74\u4eba a.\u6210\u5e74\u7684\uff0c\u5145\u5206\u957f\u6210\u7684\uff0c\u6210\u719f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x117f

    .line 4656
    const-string v3, "4480. result n.\u7ed3\u679c,\u6210\u7ee9 v.\u7ed3\u679c,\u81f4\u4f7f,\u5bfc\u81f4,\u7531\u2026\u800c\u9020\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0x1180

    .line 4657
    const-string v3, "4481. insult vt./n.\u4fae\u8fb1,\u51cc\u8fb1"

    aput-object v3, v0, v2

    const/16 v2, 0x1181

    .line 4658
    const-string v3, "4482. consult v.\u8bf7\u6559\uff0c\u5411...\u54a8\u8be2\uff0c\u627e...\u5546\u91cf\uff1b\u67e5\u9605\uff0c\u67e5\u770b"

    aput-object v3, v0, v2

    const/16 v2, 0x1182

    .line 4659
    const-string v3, "4483. ant n.\u8681\uff1b\u8682\u8681"

    aput-object v3, v0, v2

    const/16 v2, 0x1183

    .line 4660
    const-string v3, "4484. vacant a.\u7a7a\u7684,\u672a\u5360\u7528\u7684;\u7a7a\u7f3a\u7684;\u795e\u60c5\u832b\u7136\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1184

    .line 4661
    const-string v3, "4485. significant a.\u6709\u610f\u4e49\u7684;\u91cd\u5927\u7684,\u91cd\u8981\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1185

    .line 4662
    const-string v3, "4486. descendant n.\u5b50\u5b59,\u540e\u4ee3"

    aput-object v3, v0, v2

    const/16 v2, 0x1186

    .line 4663
    const-string v3, "4487. attendant n.\u966a\u4ece\uff1b\u51fa\u5e2d\u4eba\uff1b\u670d\u52a1\u5458 a.\u51fa\u5e2d\u7684\uff1b\u4f34\u968f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1187

    .line 4664
    const-string v3, "4488. abundant a.\u5927\u91cf(\u5145\u8db3)\u7684\uff1b(in)\u4e30\u5bcc(\u5bcc\u88d5)\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1188

    .line 4665
    const-string v3, "4489. redundant a.\u591a\u4f59\u7684,\u8fc7\u5269\u7684;(\u98df\u7269)\u4e30\u5bcc\u7684;\u88ab\u89e3\u96c7\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1189

    .line 4666
    const-string v3, "4490. infant n.\u5a74\u513f,\u5e7c\u513f"

    aput-object v3, v0, v2

    const/16 v2, 0x118a

    .line 4667
    const-string v3, "4491. extravagant a.\u5962\u4f88\u7684;\u8fc7\u5206\u7684;(\u8a00\u884c\u7b49)\u653e\u8086\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x118b

    .line 4668
    const-string v3, "4492. elegant a.\u4f18\u96c5\u7684;\u7aef\u5e84\u7684;\u96c5\u81f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x118c

    .line 4669
    const-string v3, "4493. arrogant a.\u50b2\u6162\u7684\uff0c\u81ea\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x118d

    .line 4670
    const-string v3, "4494. merchant n.\u5546\u4eba,\u96f6\u552e\u5546"

    aput-object v3, v0, v2

    const/16 v2, 0x118e

    .line 4671
    const-string v3, "4495. elephant n.(\u52a8\u7269)\u8c61"

    aput-object v3, v0, v2

    const/16 v2, 0x118f

    .line 4672
    const-string v3, "4496. radiant a.\u53d1\u5149\u7684,\u8f90\u5c04\u7684,\u5bb9\u5149\u7115\u53d1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1190

    .line 4673
    const-string v3, "4497. giant n.\u5de8\u4eba a.\u5de8\u5927\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1191

    .line 4674
    const-string v3, "4498. brilliant a.\u5149\u8f89\u7684,\u707f\u70c2\u7684;\u5353\u8d8a\u7684,\u6709\u624d\u534e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1192

    .line 4675
    const-string v3, "4499. plant n.\u690d\u7269,\u4f5c\u7269;\u5de5\u5382;\u88c5\u7f6e v.\u683d\u79cd,\u64ad\u79cd,\u683d\u57f9"

    aput-object v3, v0, v2

    const/16 v2, 0x1193

    .line 4676
    const-string v3, "4500. transplant n./v.\u79fb\u690d(\u690d\u7269\uff1b\u7ec4\u7ec7,\u5668\u5b98\u7b49)\uff1b\u8fc1\u79fb\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x1194

    .line 4677
    const-string v3, "4501. tenant n.\u627f\u79df\u4eba;\u623f\u5ba2;\u4f43\u6237 vt.\u79df\u501f\uff0c\u627f\u79df"

    aput-object v3, v0, v2

    const/16 v2, 0x1195

    .line 4678
    const-string v3, "4502. pregnant a.\u6000\u5b55\u7684,\u5b55\u80b2\u7684,\u5145\u6ee1\u7684,\u610f\u5473\u6df1\u957f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1196

    .line 4679
    const-string v3, "4503. indignant a.\u6124\u6168\u7684,\u6124\u6168\u4e0d\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1197

    .line 4680
    const-string v3, "4504. malignant a.\u6076\u6027\u7684\uff0c\u81f4\u547d\u7684\uff1b\u6076\u610f\u7684\uff0c\u6076\u6bd2\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1198

    .line 4681
    const-string v3, "4505. dominant a.\u652f\u914d\u7684,\u7edf\u6cbb\u7684,\u5360\u4f18\u52bf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1199

    .line 4682
    const-string v3, "4506. predominant a.(over)\u5360\u4f18\u52bf\u7684;\u4e3b\u8981\u7684,\u7a81\u51fa\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x119a

    .line 4683
    const-string v3, "4507. remnant n.\u5269\u4f59(\u7269),\u96f6\u6599,\u9057\u8ff9[\u98ce] a.\u5269\u4f59\u7684,\u6b8b\u7559\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x119b

    .line 4684
    const-string v3, "4508. pant n.\u5598\u6c14 v.\u5598,\u6c14\u5598\u5401\u5401\u5730\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x119c

    .line 4685
    const-string v3, "4509. participant n.\u53c2\u52a0\u8005,\u53c2\u4e0e\u8005 a.\u6709\u4efd\u7684,\u53c2\u4e0e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x119d

    .line 4686
    const-string v3, "4510. tolerant a.\u5bb9\u5fcd\u7684,\u5bbd\u5bb9\u7684\uff1b\u6709\u8010\u836f\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x119e

    .line 4687
    const-string v3, "4511. grant v.\u540c\u610f,\u51c6\u4e88;\u6388\u4e88 n.\u6388\u4e88\u7269;\u6d25\u8d34;\u8f6c\u8ba9\u8bc1\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0x119f

    .line 4688
    const-string v3, "4512. fragrant a.\u9999\u7684;\u82ac\u82b3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11a0

    .line 4689
    const-string v3, "4513. immigrant a.(\u4ece\u56fd\u5916)\u79fb\u6765\u7684,\u79fb\u6c11\u7684 n.\u79fb\u6c11,\u4fa8\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0x11a1

    .line 4690
    const-string v3, "4514. ignorant a.\u65e0\u77e5\u7684,\u611a\u6627\u7684;\u4e0d\u77e5\u9053\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11a2

    .line 4691
    const-string v3, "4515. warrant n.\u6b63\u5f53\u7406\u7531;\u8bb8\u53ef\u8bc1,\u59d4\u4efb\u72b6 v.\u4fdd\u8bc1,\u62c5\u4fdd"

    aput-object v3, v0, v2

    const/16 v2, 0x11a3

    .line 4692
    const-string v3, "4516. restaurant n.\u9910\u9986,\u996d\u5e97"

    aput-object v3, v0, v2

    const/16 v2, 0x11a4

    .line 4693
    const-string v3, "4517. pleasant a.\u4ee4\u4eba\u6109\u5feb\u7684 vt.\u4f7f\u9ad8\u5174 vi.\u6ee1\u610f\uff1b\u559c\u6b22"

    aput-object v3, v0, v2

    const/16 v2, 0x11a5

    .line 4694
    const-string v3, "4518. peasant n.(\u4e0d\u7528\u4e8e\u82f1\u56fd\u6216\u7f8e\u56fd)\u5c0f\u519c;\u4f43\u519c;\u519c\u6c11"

    aput-object v3, v0, v2

    const/16 v2, 0x11a6

    .line 4695
    const-string v3, "4519. reluctant a.\u4e0d\u613f\u7684,\u52c9\u5f3a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11a7

    .line 4696
    const-string v3, "4520. inhabitant n.\u5c45\u6c11,\u4f4f\u6237"

    aput-object v3, v0, v2

    const/16 v2, 0x11a8

    .line 4697
    const-string v3, "4521. militant a.\u597d\u6218\u7684\uff0c\u5bcc\u4e8e\u6218\u6597\u6027\u7684 n.\u6597\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0x11a9

    .line 4698
    const-string v3, "4522. resultant a.\u4f5c\u4e3a\u7ed3\u679c\u800c\u53d1\u751f\u7684;\u5408\u6210\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11aa

    .line 4699
    const-string v3, "4523. consultant n.\u4f1a\u8bca\u533b\u5e08,\u987e\u95ee\u533b\u751f;\u987e\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0x11ab

    .line 4700
    const-string v3, "4524. accountant n.\u4f1a\u8ba1\u4eba\u5458\uff0c\u4f1a\u8ba1\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x11ac

    .line 4701
    const-string v3, "4525. important a.\u91cd\u8981\u7684,\u91cd\u5927\u7684;\u6709\u5730\u4f4d\u7684,\u6709\u6743\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11ad

    .line 4702
    const-string v3, "4526. distant a.\u8fdc\u7684;\u9065\u8fdc\u7684;\u758f\u8fdc\u7684;\u4e0d\u4eb2\u8fd1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11ae

    .line 4703
    const-string v3, "4527. resistant a.(to)\u62b5\u6297\u7684,\u6709\u62b5\u6297\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11af

    .line 4704
    const-string v3, "4528. assistant a.\u5e2e\u52a9\u7684\uff0c\u8f85\u52a9\u7684 n.\u52a9\u624b\uff0c\u52a9\u6559\uff1b\u8f85\u52a9\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x11b0

    .line 4705
    const-string v3, "4529. instant a.\u7acb\u5373\u7684;\u7d27\u8feb\u7684;(\u98df\u54c1)\u901f\u6eb6\u7684 n.\u77ac\u95f4,\u65f6\u523b"

    aput-object v3, v0, v2

    const/16 v2, 0x11b1

    .line 4706
    const-string v3, "4530. constant a.\u56fa\u5b9a\u7684\uff0c\u6301\u7eed\u7684,\u5fe0\u5b9e\u7684 n.\u5e38\u6570,\u6052\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x11b2

    .line 4707
    const-string v3, "4531. relevant a.\u6709\u5173\u7684,\u4e2d\u80af\u7684,\u76f8\u5e94\u7684,\u5b9e\u8d28\u6027\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11b3

    .line 4708
    const-string v3, "4532. servant n.\u4ec6\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x11b4

    .line 4709
    const-string v3, "4533. want vt.\u60f3\u8981;\u5e0c\u671b;\u9700\u8981;\u7f3a,\u7f3a\u5c11 n.\u9700\u8981;\u77ed\u7f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x11b5

    .line 4710
    const-string v3, "4534. cent n.\u5206(\u5e01);\u767e per cent\u767e\u5206\u4e4b"

    aput-object v3, v0, v2

    const/16 v2, 0x11b6

    .line 4711
    const-string v3, "4535. "

    aput-object v3, v0, v2

    const/16 v2, 0x11b7

    .line 4712
    const-string v3, "4536. "

    aput-object v3, v0, v2

    const/16 v2, 0x11b8

    .line 4713
    const-string v3, "4537. adjacent a.(to)(\u65f6\u95f4\u4e0a)\u7d27\u63a5\u7740\u7684\uff1b\u90bb\u8fd1\u7684\uff0c\u6bd7\u90bb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11b9

    .line 4714
    const-string v3, "4538. accent n.\u53e3\u97f3,\u8154\u8c03\uff1b\u91cd\u97f3(\u7b26\u53f7)vt.\u91cd\u8bfb"

    aput-object v3, v0, v2

    const/16 v2, 0x11ba

    .line 4715
    const-string v3, "4539. decent a.\u4f53\u9762\u7684;\u6b63\u6d3e\u7684,\u5408\u4e4e\u793c\u4eea\u7684;\u5408\u9002\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11bb

    .line 4716
    const-string v3, "4540. recent a.\u65b0\u8fd1\u7684,\u8fd1\u6765\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11bc

    .line 4717
    const-string v3, "4541. magnificent a.\u534e\u4e3d\u7684,\u9ad8\u5c1a\u7684,\u5b8f\u4f1f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11bd

    .line 4718
    const-string v3, "4542. innocent a.(of)\u6e05\u767d\u7684,\u65e0\u7f6a\u7684;\u65e0\u5bb3\u7684;\u5355\u7eaf\u7684,\u65e0\u77e5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11be

    .line 4719
    const-string v3, "4543. percent n.(per cent)\u767e\u5206\u4e4b...\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11bf

    .line 4720
    const-string v3, "4544. scent n.\u6c14\u5473,\u9999\u5473,\u9999\u6c34,\u7ebf\u7d22,\u55c5\u89c9 v.\u55c5,\u53d1\u89c9"

    aput-object v3, v0, v2

    const/16 v2, 0x11c0

    .line 4721
    const-string v3, "4545. descent n.\u4e0b\u964d,\u964d\u4e0b;\u659c\u5761;\u8840\u7edf,\u5bb6\u4e16"

    aput-object v3, v0, v2

    const/16 v2, 0x11c1

    .line 4722
    const-string v3, "4546. adolescent n.\u9752\u5c11\u5e74  a.\u9752\u6625\u671f\u7684\uff0c\u9752\u5c11\u5e74\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11c2

    .line 4723
    const-string v3, "4547. precedent n.\u5148\u4f8b"

    aput-object v3, v0, v2

    const/16 v2, 0x11c3

    .line 4724
    const-string v3, "4548. accident n.\u610f\u5916\u906d\u9047,\u4e8b\u6545\uff1b\u610f\u5916(\u56e0\u7d20)"

    aput-object v3, v0, v2

    const/16 v2, 0x11c4

    .line 4725
    const-string v3, "4549. incident n.\u4e8b\u4ef6,\u4e8b\u53d8"

    aput-object v3, v0, v2

    const/16 v2, 0x11c5

    .line 4726
    const-string v3, "4550. confident n.(of,in)\u786e\u4fe1\u7684,\u81ea\u4fe1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11c6

    .line 4727
    const-string v3, "4551. resident n.\u5c45\u6c11,\u5e38\u4f4f\u8005 a.\u5c45\u4f4f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11c7

    .line 4728
    const-string v3, "4552. president n.\u603b\u7edf,\u6821\u957f,\u4f1a\u957f,\u4e3b\u5e2d"

    aput-object v3, v0, v2

    const/16 v2, 0x11c8

    .line 4729
    const-string v3, "4553. evident a.\u660e\u663e\u7684,\u660e\u767d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11c9

    .line 4730
    const-string v3, "4554. dependent a.\u4f9d\u9760\u7684,\u4f9d\u8d56\u7684,\u4ece\u5c5e\u7684;\u968f\u2026\u800c\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11ca

    .line 4731
    const-string v3, "4555. independent a.(of)\u72ec\u7acb\u7684,\u81ea\u4e3b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11cb

    .line 4732
    const-string v3, "4556. correspondent n.\u8bb0\u8005,\u901a\u8baf\u5458;\u901a\u4fe1\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x11cc

    .line 4733
    const-string v3, "4557. prudent a.\u8c28\u614e\u7684,\u667a\u6167\u7684,\u7a33\u5065\u7684,\u8282\u4fed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11cd

    .line 4734
    const-string v3, "4558. student n.(\u5927\u4e2d\u5b66\u6821\u7684)\u5b66\u751f\uff1b\u7814\u7a76\u8005\uff0c\u5b66\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x11ce

    .line 4735
    const-string v3, "4559. agent n.\u4ee3\u7406\u4eba\uff1b\u4ee3\u7406\u5546\uff1b\u4ea7\u751f\u4f5c\u7528\u7684\u4eba\u6216\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x11cf

    .line 4736
    const-string v3, "4560. diligent a.\u52e4\u594b\u7684,\u7528\u529f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d0

    .line 4737
    const-string v3, "4561. intelligent a.\u806a\u660e\u7684,\u660e\u667a\u7684,\u7406\u667a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d1

    .line 4738
    const-string v3, "4562. urgent a.\u6025\u8feb\u7684\uff0c\u7d27\u8981\u7684\uff0c\u7d27\u6025\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d2

    .line 4739
    const-string v3, "4563. efficient a.\u6709\u6548\u7684,\u6548\u7387\u9ad8\u7684;\u6709\u80fd\u529b\u7684,\u80fd\u80dc\u4efb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d3

    .line 4740
    const-string v3, "4564. sufficient a.(for)\u8db3\u591f\u7684,\u5145\u5206\u7684(\u6bd4enough\u62d8\u8c28\u3001\u6b63\u5f0f)"

    aput-object v3, v0, v2

    const/16 v2, 0x11d4

    .line 4741
    const-string v3, "4565. ancient a.\u53e4\u4ee3\u7684\uff0c\u53e4\u8001\u7684\uff0c\u53e4\u5f0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d5

    .line 4742
    const-string v3, "4566. obedient a.\u670d\u4ece\u7684,\u987a\u4ece\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d6

    .line 4743
    const-string v3, "4567. ingredient n.(\u6df7\u5408\u7269\u7684)\u7ec4\u6210\u90e8\u5206\uff0c\u914d\u6599\uff1b\u6210\u4efd\uff0c\u8981\u7d20"

    aput-object v3, v0, v2

    const/16 v2, 0x11d7

    .line 4744
    const-string v3, "4568. client n.\u5f8b\u5e08\u7b49\u7684\u5f53\u4e8b\u4eba\uff0c\u59d4\u6258\u4eba\uff1b\u5546\u5e97\u7684\u987e\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0x11d8

    .line 4745
    const-string v3, "4569. convenient a.(to)\u4fbf\u5229\u7684,\u65b9\u4fbf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11d9

    .line 4746
    const-string v3, "4570. recipient a.\u63a5\u53d7\u7684,\u611f\u53d7\u6027\u5f3a\u7684 n.\u63a5\u53d7\u8005,\u611f\u53d7\u8005,\u5bb9\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x11da

    .line 4747
    const-string v3, "4571. orient n.\u4e1c\u65b9,\u4e9a\u6d32 v.\u4f7f\u671d\u4e1c,\u4e3a\u2026\u5b9a\u4f4d,\u4f7f\u9002\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x11db

    .line 4748
    const-string v3, "4572. transient a.\u77ed\u6682\u7684\uff0c\u8f6c\u77ac\u5373\u901d\u7684\uff1b\u4e34\u65f6\u7684\uff0c\u6682\u4f4f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11dc

    .line 4749
    const-string v3, "4573. patient a.\u6709\u8010\u5fc3\u7684,\u80fd\u5fcd\u8010\u7684 n.\u75c5\u4eba,\u60a3\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x11dd

    .line 4750
    const-string v3, "4574. impatient a.\u4e0d\u8010\u70e6\u7684,\u6025\u8e81\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11de

    .line 4751
    const-string v3, "4575. talent n.\u624d\u80fd,\u5929\u8d44;\u4eba\u624d"

    aput-object v3, v0, v2

    const/16 v2, 0x11df

    .line 4752
    const-string v3, "4576. prevalent a.\u6d41\u884c\u7684,\u666e\u904d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11e0

    .line 4753
    const-string v3, "4577. equivalent a.(to)\u76f8\u7b49\u7684,\u7b49\u4ef7\u7684 n.\u76f8\u7b49\u7269,\u7b49\u4ef7\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x11e1

    .line 4754
    const-string v3, "4578. silent a.\u5bc2\u9759,\u6c89\u9ed8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11e2

    .line 4755
    const-string v3, "4579. excellent a.\u5353\u8d8a\u7684,\u6781\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11e3

    .line 4756
    const-string v3, "4580. violent a.\u731b\u70c8\u7684,\u6fc0\u70c8\u7684;\u66b4\u529b\u5f15\u8d77\u7684,\u5f3a\u66b4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11e4

    .line 4757
    const-string v3, "4581. turbulent a.\u72c2\u66b4\u7684,\u65e0\u79e9\u5e8f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x11e5

    .line 4758
    const-string v3, "4582. parliament n.\u56fd\u4f1a,\u8bae\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x11e6

    .line 4759
    const-string v3, "4583. ornament v.\u88c5\u9970,\u7f8e\u5316 n.\u88c5\u9970,\u88c5\u9970\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x11e7

    .line 4760
    const-string v3, "4584. temperament n.\u6c14\u8d28\uff0c\u6027\u683c\uff0c\u6027\u60c5\uff1b\u8d44\u8d28"

    aput-object v3, v0, v2

    const/16 v2, 0x11e8

    .line 4761
    const-string v3, "4585. cement n.\u6c34\u6ce5;\u80f6\u6ce5,\u80f6\u63a5\u5242 v.\u80f6\u5408;\u5de9\u56fa,\u52a0\u5f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x11e9

    .line 4762
    const-string v3, "4586. replacement n.\u53d6\u4ee3,\u66ff\u6362,\u66ff\u6362\u7269,\u4ee3\u66ff\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x11ea

    .line 4763
    const-string v3, "4587. agreement n.\u534f\u5b9a\uff1b\u534f\u8bae\uff1b\u5951\u7ea6\uff1b\u8fbe\u6210\u534f\u8bae\uff1b\u540c\u610f\uff0c\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x11eb

    .line 4764
    const-string v3, "4588. engagement n.\u7ea6\u4f1a,\u7ea6\u5b9a;\u5a5a\u7ea6,\u8ba2\u5a5a"

    aput-object v3, v0, v2

    const/16 v2, 0x11ec

    .line 4765
    const-string v3, "4589. management n.\u7ecf\u8425,\u7ba1\u7406;\u5904\u7406,\u64cd\u7eb5;\u7ba1\u7406\u90e8\u95e8"

    aput-object v3, v0, v2

    const/16 v2, 0x11ed

    .line 4766
    const-string v3, "4590. judgement n.(judgment)\u5ba1\u5224,\u5224\u51b3;\u5224\u65ad(\u529b);\u770b\u6cd5,\u610f\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x11ee

    .line 4767
    const-string v3, "4591. element n.\u5143\u7d20;\u8981\u7d20;\u6210\u5206;\u5143\u4ef6;\u81ea\u7136\u73af\u5883"

    aput-object v3, v0, v2

    const/16 v2, 0x11ef

    .line 4768
    const-string v3, "4592. implement n.(pl.)\u5de5\u5177,\u5668\u5177 v.\u8d2f\u5f7b,\u5b9e\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0x11f0

    .line 4769
    const-string v3, "4593. complement n.\u8865\u8db3\u7269\uff0c\u8239\u4e0a\u7684\u5b9a\u5458\uff1b\u8865\u8bed vt.\u8865\u5145\uff0c\u8865\u8db3"

    aput-object v3, v0, v2

    const/16 v2, 0x11f1

    .line 4770
    const-string v3, "4594. supplement n.\u8865\u9057;\u589e\u520a;\u9644\u5f55 v.\u589e\u520a,\u8865\u5145"

    aput-object v3, v0, v2

    const/16 v2, 0x11f2

    .line 4771
    const-string v3, "4595. settlement n.\u89e3\u51b3,\u51b3\u5b9a,\u8c03\u505c;\u5c45\u7559\u533a,\u4f4f\u5b85\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x11f3

    .line 4772
    const-string v3, "4596. requirement n.(for)\u9700\u8981,\u9700\u8981\u7684\u4e1c\u897f,\u8981\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x11f4

    .line 4773
    const-string v3, "4597. basement n.\u5efa\u7b51\u7269\u7684\u5e95\u90e8,\u5730\u4e0b\u5ba4,\u5730\u7a96"

    aput-object v3, v0, v2

    const/16 v2, 0x11f5

    .line 4774
    const-string v3, "4598. statement n.\u58f0\u660e,\u9648\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x11f6

    .line 4775
    const-string v3, "4599. excitement n.\u523a\u6fc0,\u6fc0\u52a8,\u5174\u594b"

    aput-object v3, v0, v2

    const/16 v2, 0x11f7

    .line 4776
    const-string v3, "4600. pavement n.\u4eba\u884c\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x11f8

    .line 4777
    const-string v3, "4601. movement n.\u8fd0\u52a8,\u6d3b\u52a8;\u79fb\u52a8,\u8fc1\u79fb"

    aput-object v3, v0, v2

    const/16 v2, 0x11f9

    .line 4778
    const-string v3, "4602. improvement n.\u6539\u8fdb,\u8fdb\u6b65,\u589e\u8fdb;\u6539\u8fdb\u63aa\u65bd"

    aput-object v3, v0, v2

    const/16 v2, 0x11fa

    .line 4779
    const-string v3, "4603. fragment n.\u788e\u7247,\u5c0f\u90e8\u5206,\u7247\u65ad"

    aput-object v3, v0, v2

    const/16 v2, 0x11fb

    .line 4780
    const-string v3, "4604. segment n.\u6bb5,\u7247,\u8282,\u90e8\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x11fc

    .line 4781
    const-string v3, "4605. augment vt.(\u4f7f)\u589e\u5927\uff0c\u589e\u52a0\uff0c\u589e\u957f\uff0c\u6269\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0x11fd

    .line 4782
    const-string v3, "4606. refreshment n.(pl.)\u70b9\u5fc3,\u996e\u6599;\u7cbe\u529b\u6062\u590d,\u723d\u5feb"

    aput-object v3, v0, v2

    const/16 v2, 0x11fe

    .line 4783
    const-string v3, "4607. establishment n.\u5efa\u7acb,\u8bbe\u7acb,\u5efa\u7acb\u7684\u673a\u6784(\u6216\u7ec4\u7ec7)"

    aput-object v3, v0, v2

    const/16 v2, 0x11ff

    .line 4784
    const-string v3, "4608. compliment n.(pl.)\u95ee\u5019,\u81f4\u610f n./v.\u79f0\u8d5e,\u606d\u7ef4"

    aput-object v3, v0, v2

    const/16 v2, 0x1200

    .line 4785
    const-string v3, "4609. experiment n.\u5b9e\u9a8c;\u8bd5\u9a8c v.(on)\u8fdb\u884c\u5b9e\u9a8c;\u505a\u8bd5\u9a8c"

    aput-object v3, v0, v2

    const/16 v2, 0x1201

    .line 4786
    const-string v3, "4610. sentiment n.\u611f\u60c5\uff0c\u67d4\u60c5\uff1b\u770b\u6cd5\uff1b\u611f\u89c9"

    aput-object v3, v0, v2

    const/16 v2, 0x1202

    .line 4787
    const-string v3, "4611. installment n.(instalment)\u5206\u671f\u4ed8\u6b3e\uff1b(\u8fde\u8f7d\u7684)\u4e00\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x1203

    .line 4788
    const-string v3, "4612. comment n.\u6ce8\u91ca,\u8bc4\u8bba,\u610f\u89c1 v.(on)\u6ce8\u91ca,\u8bc4\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x1204

    .line 4789
    const-string v3, "4613. assignment n.\u5206\u914d\uff0c\u6307\u6d3e\uff1b(\u6307\u5b9a\u7684)\u4f5c\u4e1a\uff0c(\u5206\u6d3e\u7684)\u4efb\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0x1205

    .line 4790
    const-string v3, "4614. entertainment n.\u62db\u5f85,\u6b3e\u5f85;\u8868\u6f14\u6587\u5a31\u8282\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0x1206

    .line 4791
    const-string v3, "4615. environment n.\u73af\u5883,\u5916\u754c"

    aput-object v3, v0, v2

    const/16 v2, 0x1207

    .line 4792
    const-string v3, "4616. government n.\u653f\u5e9c,\u5185\u9601;\u7ba1\u7406,\u652f\u914d;\u653f\u6cbb,\u653f\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x1208

    .line 4793
    const-string v3, "4617. moment n.\u7247\u523b,\u77ac\u95f4,\u65f6\u523b"

    aput-object v3, v0, v2

    const/16 v2, 0x1209

    .line 4794
    const-string v3, "4618. shipment n.\u88c5\u8239,\u88c5\u8fd0;\u88c5\u8f7d\u7684\u8d27\u7269,\u88c5\u8d27\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x120a

    .line 4795
    const-string v3, "4619. equipment n.\u8bbe\u5907,\u5668\u6750,\u88c5\u7f6e;\u624d\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0x120b

    .line 4796
    const-string v3, "4620. garment n.(\u4e00\u4ef6)\u8863\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0x120c

    .line 4797
    const-string v3, "4621. torment n.\u6298\u78e8\uff1b\u4ee4\u4eba\u75db\u82e6\u7684\u4e1c\u897f(\u4eba)vt.\u6298\u78e8\uff1b\u7ea0\u7f20"

    aput-object v3, v0, v2

    const/16 v2, 0x120d

    .line 4798
    const-string v3, "4622. harassment n.\u9a9a\u6270\uff0c\u6270\u4e71\uff1b\u70e6\u607c\uff0c\u70e6\u4e71"

    aput-object v3, v0, v2

    const/16 v2, 0x120e

    .line 4799
    const-string v3, "4623. appointment n.\u7ea6\u4f1a,\u7ea6\u5b9a\uff1b\u4efb\u547d,\u59d4\u6d3e;\u59d4\u4efb\u7684\u804c\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x120f

    .line 4800
    const-string v3, "4624. apartment n.[\u82f1]\u623f\u95f4\uff0c\u5957\u95f4\uff1b[\u7f8e]\u516c\u5bd3"

    aput-object v3, v0, v2

    const/16 v2, 0x1210

    .line 4801
    const-string v3, "4625. department n.\u90e8,\u5c40,\u5904,\u79d1,\u90e8\u95e8;\u7cfb,\u5b66\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x1211

    .line 4802
    const-string v3, "4626. compartment n.\u5367\u8f66\u5305\u623f,(\u5ba2\u8f66\u8f66\u53a2\u5185\u7684)\u9694\u95f4;\u5206\u9694\u7684\u7a7a\u95f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1212

    .line 4803
    const-string v3, "4627. investment n.\u6295\u8d44,\u6295\u8d44\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x1213

    .line 4804
    const-string v3, "4628. document n.\u516c\u6587,\u6587\u732e"

    aput-object v3, v0, v2

    const/16 v2, 0x1214

    .line 4805
    const-string v3, "4629. argument n.\u4e89\u8bba(\u5435)\uff0c\u8fa9\u8bba\uff1b\u7406\u7531;\u8bba\u8bc1"

    aput-object v3, v0, v2

    const/16 v2, 0x1215

    .line 4806
    const-string v3, "4630. monument n.\u7eaa\u5ff5\u7891,\u7eaa\u5ff5\u9986,\u9057\u8ff9,\u4e0d\u673d\u7684\u4e1a\u7ee9"

    aput-object v3, v0, v2

    const/16 v2, 0x1216

    .line 4807
    const-string v3, "4631. instrument n.\u5de5\u5177,\u4eea\u5668,\u5668\u68b0;\u4e50\u5668"

    aput-object v3, v0, v2

    const/16 v2, 0x1217

    .line 4808
    const-string v3, "4632. payment n.\u652f\u4ed8,\u4ed8\u6b3e\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x1218

    .line 4809
    const-string v3, "4633. employment n.\u96c7\u7528;\u4f7f\u7528;\u5de5\u4f5c,\u804c\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0x1219

    .line 4810
    const-string v3, "4634. unemployment n.\u5931\u4e1a,\u5931\u4e1a\u4eba\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x121a

    .line 4811
    const-string v3, "4635. permanent a.\u6c38\u4e45\u7684,\u6301\u4e45\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x121b

    .line 4812
    const-string v3, "4636. eminent a.\u663e\u8d6b\u7684;\u6770\u51fa\u7684;\u6709\u540d\u7684;\u4f18\u826f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x121c

    .line 4813
    const-string v3, "4637. prominent a.\u7a81\u8d77\u7684,\u51f8\u51fa\u7684;\u7a81\u51fa\u7684,\u6770\u51fa\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x121d

    .line 4814
    const-string v3, "4638. continent n.\u5927\u9646,\u6d32"

    aput-object v3, v0, v2

    const/16 v2, 0x121e

    .line 4815
    const-string v3, "4639. component n.\u7ec4\u6210\u90e8\u5206,\u6210\u5206,\u5143\u4ef6 a.\u7ec4\u6210\u7684,\u5408\u6210\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x121f

    .line 4816
    const-string v3, "4640. opponent n.\u5bf9\u624b,\u53cd\u5bf9\u8005,\u654c\u624b a.\u5bf9\u7acb\u7684,\u5bf9\u6297\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1220

    .line 4817
    const-string v3, "4641. rent v.\u79df,\u79df\u8d41 n.\u79df\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1221

    .line 4818
    const-string v3, "4642. parent n.\u7236\u6bcd,\u6bcd\u4eb2;(pl.)\u53cc\u4eb2;\u7236\u6bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x1222

    .line 4819
    const-string v3, "4643. apparent a.\u8868\u9762\u4e0a\u7684,\u8c8c\u4f3c\u771f\u5b9e\u7684\uff1b\u663e\u7136\u7684,\u660e\u660e\u767d\u767d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1223

    .line 4820
    const-string v3, "4644. transparent a.\u900f\u660e\u7684\uff0c\u900f\u5149\u7684\uff1b\u6613\u7406\u89e3\u7684\uff1b\u660e\u663e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1224

    .line 4821
    const-string v3, "4645. different a.\u5dee\u5f02\u7684,\u5dee\u5f02\u7684,\u4e0d\u540c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1225

    .line 4822
    const-string v3, "4646. indifferent a.\u51b7\u6f20\u7684,\u4e0d\u5173\u5fc3\u7684,\u4e0d\u79ef\u6781\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1226

    .line 4823
    const-string v3, "4647. inherent a.\u56fa\u6709\u7684,\u5185\u5728\u7684,\u5929\u751f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1227

    .line 4824
    const-string v3, "4648. coherent a.\u4e00\u81f4\u7684\uff0c\u534f\u8c03\u7684\uff1b(\u8bdd\u8bed\u7b49)\u6761\u7406\u6e05\u695a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1228

    .line 4825
    const-string v3, "4649. torrent n.\u6fc0\u6d41\uff0c\u6d2a\u6d41\uff1b\u7206\u53d1\uff0c(\u8bdd\u8bed\u7b49\u7684)\u8fde\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1229

    .line 4826
    const-string v3, "4650. current n.\u7535\u6d41,\u6c34\u6d41;\u6f6e\u6d41,\u8d8b\u52bf a.\u5f53\u524d\u7684;\u6d41\u901a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x122a

    .line 4827
    const-string v3, "4651. absent a.\u7f3a\u5e2d\u7684\uff1b\u7f3a\u4e4f\u7684,\u4e0d\u5b58\u5728\u7684;\u5fc3\u4e0d\u5728\u7109\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x122b

    .line 4828
    const-string v3, "4652. resent v.\u5bf9\u2026\u8868\u793a\u5fff\u6068,\u6028\u6068"

    aput-object v3, v0, v2

    const/16 v2, 0x122c

    .line 4829
    const-string v3, "4653. present a.\u51fa\u5e2d\u7684,\u73b0\u5728\u7684 n.\u73b0\u5728,\u793c\u7269 v.\u8d60\u9001,\u63d0\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x122d

    .line 4830
    const-string v3, "4654. represent v.\u63cf\u8ff0,\u8868\u793a;\u4ee3\u8868,\u4ee3\u7406;\u9610\u660e,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x122e

    .line 4831
    const-string v3, "4655. consent v./n.(to)\u540c\u610f,\u8d5e\u6210,\u7b54\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x122f

    .line 4832
    const-string v3, "4656. tent n.\u5e10\u7bf7"

    aput-object v3, v0, v2

    const/16 v2, 0x1230

    .line 4833
    const-string v3, "4657. latent a.\u6f5c\u5728\u7684,\u6f5c\u4f0f\u7684,\u4e0d\u6613\u5bdf\u89c9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1231

    .line 4834
    const-string v3, "4658. patent a.\u4e13\u5229\u7684,\u7279\u8bb8\u7684n.\u4e13\u5229(\u6743\u3001\u54c1)v.\u6279\u51c6\u4e13\u5229"

    aput-object v3, v0, v2

    const/16 v2, 0x1232

    .line 4835
    const-string v3, "4659. competent a.\u6709\u80fd\u529b\u7684\uff0c\u80fd\u80dc\u4efb\u7684\uff1b\u8db3\u591f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1233

    .line 4836
    const-string v3, "4660. content n.\u5bb9\u91cf,\u5185\u5bb9,(pl.)\u76ee\u5f55 a.(with)\u6ee1\u8db3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1234

    .line 4837
    const-string v3, "4661. consistent a.(in)\u524d\u540e\u4e00\u81f4\u7684\uff1b\uff08with\uff09\u4e00\u81f4\uff0c\u7b26\u5408"

    aput-object v3, v0, v2

    const/16 v2, 0x1235

    .line 4838
    const-string v3, "4662. intermittent a.\u95f4\u6b47\u7684,\u65ad\u65ad\u7eed\u7eed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1236

    .line 4839
    const-string v3, "4663. extent n.\u5e7f\u5ea6,\u5bbd\u5ea6,\u957f\u5ea6;\u7a0b\u5ea6,\u9650\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x1237

    .line 4840
    const-string v3, "4664. fluent a.\u6d41\u5229\u7684,\u6d41\u7545\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1238

    .line 4841
    const-string v3, "4665. affluent a.\u5bcc\u88d5\u7684\uff0c\u5bcc\u6709\u7684\uff0c\u4e30\u5bcc\u7684\uff0c\u5bcc\u9976\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1239

    .line 4842
    const-string v3, "4666. frequent a.\u65f6\u5e38\u53d1\u751f\u7684,\u9891\u7e41\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x123a

    .line 4843
    const-string v3, "4667. subsequent a.\u968f\u540e\u7684,\u540e\u6765\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x123b

    .line 4844
    const-string v3, "4668. eloquent a.\u96c4\u8fa9\u7684,\u6709\u8bf4\u670d\u529b\u7684;\u5584\u8fa9\u7684,\u53e3\u624d\u6d41\u5229\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x123c

    .line 4845
    const-string v3, "4669. constituent n.\u9009\u6c11\uff1b\u6210\u5206\uff0c\u7ec4\u5206a.\u7ec4\u6210\u7684\uff0c\u6784\u6210\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x123d

    .line 4846
    const-string v3, "4670. advent n.(\u91cd\u8981\u4e8b\u4ef6\u7b49\u7684)\u5230\u6765\uff0c\u6765\u4e34"

    aput-object v3, v0, v2

    const/16 v2, 0x123e

    .line 4847
    const-string v3, "4671. event n.\u4e8b\u4ef6,\u4e8b\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x123f

    .line 4848
    const-string v3, "4672. prevent v.(from)\u9884\u9632,\u9632\u6b62,\u963b\u6b62,\u5236\u6b62,\u59a8\u788d"

    aput-object v3, v0, v2

    const/16 v2, 0x1240

    .line 4849
    const-string v3, "4673. invent v.\u53d1\u660e,\u521b\u9020;\u634f\u9020,\u865a\u6784"

    aput-object v3, v0, v2

    const/16 v2, 0x1241

    .line 4850
    const-string v3, "4674. faint a.\u5fae\u5f31\u7684;\u4e0d\u660e\u663e\u7684;\u6697\u6de1\u7684 n./v.\u660f\u5012;\u660f\u6655"

    aput-object v3, v0, v2

    const/16 v2, 0x1242

    .line 4851
    const-string v3, "4675. complaint n.\u62b1\u6028\uff0c\u8bc9\u82e6\uff0c\u6028\u8a00\uff0c\u63a7\u544a\uff1b\u75be\u75c5"

    aput-object v3, v0, v2

    const/16 v2, 0x1243

    .line 4852
    const-string v3, "4676. paint n.\u6cb9\u6f06,\u989c\u6599 v.\u6cb9\u6f06;\u6d82,\u6d82\u6f06;\u753b;\u63cf\u7ed8,\u63cf\u8ff0"

    aput-object v3, v0, v2

    const/16 v2, 0x1244

    .line 4853
    const-string v3, "4677. restraint n.\u6291\u5236,\u5236\u6b62"

    aput-object v3, v0, v2

    const/16 v2, 0x1245

    .line 4854
    const-string v3, "4678. saint n.\u5723\u4eba,\u57fa\u7763\u6559\u5f92;(S-\u6216St.\u7528\u4e8e\u4eba,\u5730\u540d\u524d)\u5723"

    aput-object v3, v0, v2

    const/16 v2, 0x1246

    .line 4855
    const-string v3, "4679. acquaint vt.(with)\u4f7f\u8ba4\u8bc6\uff0c\u4f7f\u4e86\u89e3\uff0c\u4f7f\u719f\u6089"

    aput-object v3, v0, v2

    const/16 v2, 0x1247

    .line 4856
    const-string v3, "4680. hint n.\u6697\u793a,\u63d0\u793a,\u7ebf\u7d22 v.\u6697\u793a,\u793a\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x1248

    .line 4857
    const-string v3, "4681. joint n.\u63a5\u5408\u5904,\u63a5\u5934;\u5173\u8282a.\u8054\u5408\u7684,\u5171\u540c\u7684,\u8fde\u63a5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1249

    .line 4858
    const-string v3, "4682. point n.\u5c16;\u70b9;\u6761\u6b3e;\u5206\u6570,\u5f97\u5206;\u8bba\u70b9 v.(at,to)\u6307"

    aput-object v3, v0, v2

    const/16 v2, 0x124a

    .line 4859
    const-string v3, "4683. standpoint n.\u7acb\u573a,\u89c2\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x124b

    .line 4860
    const-string v3, "4684. appoint vt.\u4efb\u547d\uff0c\u59d4\u6d3e\uff1b\u6307\u5b9a\uff0c\u7ea6\u5b9a(\u65f6\u95f4\u3001\u5730\u70b9\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x124c

    .line 4861
    const-string v3, "4685. disappoint vt.\u5931\u671b\uff1b(\u5e0c\u671b\u7b49)\u7834\u706d\uff0c\u632b\u8d25(\u8ba1\u5212\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x124d

    .line 4862
    const-string v3, "4686. viewpoint n.\u89c2\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x124e

    .line 4863
    const-string v3, "4687. pint n.\u54c1\u8131"

    aput-object v3, v0, v2

    const/16 v2, 0x124f

    .line 4864
    const-string v3, "4688. print n.\u5370\u5237,\u5370\u5237\u54c1,\u5b57\u4f53 v.\u5370\u5237,\u51fa\u7248;\u6d17\u5370"

    aput-object v3, v0, v2

    const/16 v2, 0x1250

    .line 4865
    const-string v3, "4689. blueprint n.\u84dd\u56fe\uff0c\u8bbe\u8ba1\u56fe\uff0c\u8ba1\u5212 vt.\u5236\u6210\u84dd\u56fe\uff0c\u8ba1\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0x1251

    .line 4866
    const-string v3, "4690. front a.\u524d\u9762\u7684,\u524d\u90e8\u7684 n.\u6b63\u9762;\u524d\u7ebf,\u6218\u7ebf v.\u9762\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x1252

    .line 4867
    const-string v3, "4691. confront v.\u4f7f\u9762\u4e34,\u4f7f\u906d\u9047;\u9762\u5bf9(\u5371\u9669\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x1253

    .line 4868
    const-string v3, "4692. aunt n.\u59e8\u6bcd\uff0c\u59d1\u6bcd\uff0c\u4f2f\u6bcd\uff0c\u5a76\u6bcd\uff0c\u8205\u6bcd\uff0c\u963f\u59e8"

    aput-object v3, v0, v2

    const/16 v2, 0x1254

    .line 4869
    const-string v3, "4693. hunt v./n.\u6253\u730e,\u730e\u53d6;(for)\u641c\u7d22;\u5bfb\u627e"

    aput-object v3, v0, v2

    const/16 v2, 0x1255

    .line 4870
    const-string v3, "4694. blunt a.\u7387\u76f4\u7684;\u949d\u7684 v.(\u4f7f)\u949d;(\u4f7f)\u8fdf\u949d"

    aput-object v3, v0, v2

    const/16 v2, 0x1256

    .line 4871
    const-string v3, "4695. count v.\u6570,\u8ba1\u7b97;\u7b97\u5165;\u770b\u4f5c,\u8ba4\u4e3a n.\u8ba1\u6570,\u603b\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x1257

    .line 4872
    const-string v3, "4696. account a.\u53d9\u8ff0\uff0c\u8bf4\u660e\uff1b\u8d26\u76ee\uff0c\u8d26\u6237 vi.\u8bf4\u660e\uff0c\u89e3\u91ca"

    aput-object v3, v0, v2

    const/16 v2, 0x1258

    .line 4873
    const-string v3, "4697. discount n.\u6298\u6263\uff1b\u8d34\u73b0(\u7387) vt.\u6253\u6298\u6263;\u4e0d\u91cd\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x1259

    .line 4874
    const-string v3, "4698. mount v.\u767b\u4e0a;\u5b89\u88c5 n.\u652f\u67b6,\u5e95\u677f;(\u7528\u4e8e\u5c71\u540d\u524d)\u5c71\u5cf0"

    aput-object v3, v0, v2

    const/16 v2, 0x125a

    .line 4875
    const-string v3, "4699. amount n.\u603b\u6570\uff0c\u6570\u91cf\uff1b\u6570\u989d v.\u5171\u8ba1\uff1b\u7b49\u540c,\u63a5\u8fd1(to)"

    aput-object v3, v0, v2

    const/16 v2, 0x125b

    .line 4876
    const-string v3, "4700. robot n.\u673a\u5668\u4eba,\u81ea\u52a8\u673a\u68b0"

    aput-object v3, v0, v2

    const/16 v2, 0x125c

    .line 4877
    const-string v3, "4701. dot n.\u70b9,\u5706\u70b9 v.\u5728\u2026\u4e0a\u6253\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x125d

    .line 4878
    const-string v3, "4702. hot a.(\u708e)\u70ed\u7684\uff1b\u8fa3\u7684\uff1b\u6025\u8e81\u7684\uff1b\u6fc0\u52a8\u7684\uff1b\u70ed\u8877\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x125e

    .line 4879
    const-string v3, "4703. shot n.\u5f00\u67aa,\u5c04\u51fb;\u6295\u7bee;\u5f39\u4e38,\u70ae\u5f39,\u5b50\u5f39"

    aput-object v3, v0, v2

    const/16 v2, 0x125f

    .line 4880
    const-string v3, "4704. idiot n.\u767d\u75f4\uff1b\u6781\u8822\u7684\u4eba\uff1b\u7b28\u86cb"

    aput-object v3, v0, v2

    const/16 v2, 0x1260

    .line 4881
    const-string v3, "4705. riot n.\u66b4(\u9a9a)\u4e71,\u8513\u5ef6,\u5f69\u8272\u7f24\u7eb7 v.\u9a9a\u4e71,\u66b4\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x1261

    .line 4882
    const-string v3, "4706. lot n.\u8bb8\u591a\uff0c\u5927\u91cf\uff1b\u7b7e\uff0c\u62bd\u7b7e\uff1b\u547d\u8fd0\uff1b\u573a\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1262

    .line 4883
    const-string v3, "4707. pilot n.\u98de\u884c\u5458;\u9886\u6e2f\u5458 v.\u9a7e\u9a76(\u98de\u673a\u7b49);\u9886\u822a,\u5f15\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x1263

    .line 4884
    const-string v3, "4708. ballot n.(\u4e0d\u8bb0\u540d)\u6295\u7968\uff1b\u6295\u7968\u603b\u6570\uff1b\u6295\u7968\u6743 vi.\u6295\u7968"

    aput-object v3, v0, v2

    const/16 v2, 0x1264

    .line 4885
    const-string v3, "4709. plot n.\u79d8\u5bc6\u8ba1\u5212;\u60c5\u8282 v.\u6807\u7ed8,\u7ed8\u5236;\u5bc6\u8c0b,\u7b56\u5212"

    aput-object v3, v0, v2

    const/16 v2, 0x1265

    .line 4886
    const-string v3, "4710. slot n.\u72ed\u7f1d\uff1b\u7a7a\u4f4dvt.\u653e\u5165\u72ed\u7f1d\u4e2d\uff1b\u628a\u2026\u7eb3\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x1266

    .line 4887
    const-string v3, "4711. not ad.\u4e0d\uff0c\u4e0d\u662f\uff0c\u4e0d\u4f1a\uff1b\u6ca1\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x1267

    .line 4888
    const-string v3, "4712. knot n.(\u7ef3)\u7ed3;(\u6811)\u8282;\u8282(=\u6d77\u91cc/\u5c0f\u65f6) v.\u6253\u7ed3"

    aput-object v3, v0, v2

    const/16 v2, 0x1268

    .line 4889
    const-string v3, "4713. boot n.\u9774\uff1b(\u6c7d\u8f66\u540e\u90e8\u7684)\u884c\u674e\u7bb1\uff1b[the-]\u89e3\u96c7"

    aput-object v3, v0, v2

    const/16 v2, 0x1269

    .line 4890
    const-string v3, "4714. foot n.(pl.feet)\u811a\uff0c\u8db3\uff1b\u82f1\u5c3a\uff1b\u5e95\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x126a

    .line 4891
    const-string v3, "4715. shoot v.\u53d1\u5c04;\u63a0\u8fc7,\u75be\u9a70\u800c\u8fc7 n.\u5ae9\u679d,\u82d7,\u5c04\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0x126b

    .line 4892
    const-string v3, "4716. root n.\u6839,\u6839\u90e8;\u6839\u672c,\u6839\u6e90 v.(\u4f7f)\u751f\u6839,(\u4f7f)\u624e\u6839"

    aput-object v3, v0, v2

    const/16 v2, 0x126c

    .line 4893
    const-string v3, "4717. pot n.\u7f50,\u58f6"

    aput-object v3, v0, v2

    const/16 v2, 0x126d

    .line 4894
    const-string v3, "4718. spot n.\u6591\u70b9;\u5730\u70b9 v.\u8ba4\u51fa,\u8ba4\u6e05,\u53d1\u73b0;\u73b7\u6c61,\u5f04\u810f"

    aput-object v3, v0, v2

    const/16 v2, 0x126e

    .line 4895
    const-string v3, "4719. rot v.(\u4f7f)\u8150\u70c2,(\u4f7f)\u8150\u8d25,\u8150\u673d"

    aput-object v3, v0, v2

    const/16 v2, 0x126f

    .line 4896
    const-string v3, "4720. carrot n.\u80e1\u841d\u535c"

    aput-object v3, v0, v2

    const/16 v2, 0x1270

    .line 4897
    const-string v3, "4721. apt a.\u6070\u5f53\u7684\uff0c\u9002\u5f53\u7684\uff1b\u6613\u4e8e\u2026\u7684\uff0c\u6709\u2026\u503e\u5411\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1271

    .line 4898
    const-string v3, "4722. adapt vt.\u4f7f\u9002\u5e94\uff0c\u4f7f\u9002\u5408\uff1b\u6539\u7f16\uff1b\u6539\u5199 vi.\u9002\u5e94"

    aput-object v3, v0, v2

    const/16 v2, 0x1272

    .line 4899
    const-string v3, "4723. accept vt.\u63a5\u53d7\uff0c\u9886\u53d7\uff1b\u8ba4\u53ef\uff0c\u540c\u610f vi.\u540c\u610f\uff0c\u8ba4\u53ef"

    aput-object v3, v0, v2

    const/16 v2, 0x1273

    .line 4900
    const-string v3, "4724. concept n.\u6982\u5ff5\uff0c\u89c2\u5ff5\uff0c\u8bbe\u60f3"

    aput-object v3, v0, v2

    const/16 v2, 0x1274

    .line 4901
    const-string v3, "4725. except prep.\u9664\u2026\u4e4b\u5916 v.\u9664\u5916;\u53cd\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x1275

    .line 4902
    const-string v3, "4726. receipt n.\u6536\u636e,\u6536\u6761;\u6536\u5230,\u63a5\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x1276

    .line 4903
    const-string v3, "4727. script n.\u5267\u672c(\u539f\u7a3f)\uff1b\u624b\u7a3f\uff0c\u539f\u7a3f\uff1b\u7b14\u8ff9\uff0c\u624b\u8ff9"

    aput-object v3, v0, v2

    const/16 v2, 0x1277

    .line 4904
    const-string v3, "4728. manuscript n.\u624b\u7a3f,\u539f\u7a3f"

    aput-object v3, v0, v2

    const/16 v2, 0x1278

    .line 4905
    const-string v3, "4729. tempt v.\u8bf1\u60d1,\u5f15\u8bf1;\u5438\u5f15,\u4f7f\u611f\u5174\u8da3"

    aput-object v3, v0, v2

    const/16 v2, 0x1279

    .line 4906
    const-string v3, "4730. contempt n.\u8f7b\u89c6\uff0c\u85d0\u89c6\uff1b\u53d7\u8fb1\uff0c\u4e22\u8138"

    aput-object v3, v0, v2

    const/16 v2, 0x127a

    .line 4907
    const-string v3, "4731. attempt vt.\u4f01\u56fe\uff0c\u8bd5\u56fe n.\u52aa\u529b\uff0c\u5c1d\u8bd5\uff0c\u4f01\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x127b

    .line 4908
    const-string v3, "4732. exempt a.\u514d\u9664\u7684 v.\u514d\u9664 n.\u514d\u7a0e\u8005;\u88ab\u514d\u9664\u4e49\u52a1\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x127c

    .line 4909
    const-string v3, "4733. prompt a.\u654f\u6377\u7684,\u8fc5\u901f\u7684,\u5373\u523b\u7684 v.\u6fc0\u8d77,\u4fc3\u8fdb,\u63a8\u52a8"

    aput-object v3, v0, v2

    const/16 v2, 0x127d

    .line 4910
    const-string v3, "4734. opt vi.\u6289\u62e9\uff0c\u9009\u62e9"

    aput-object v3, v0, v2

    const/16 v2, 0x127e

    .line 4911
    const-string v3, "4735. adopt vt.\u91c7\u7528\uff0c\u91c7\u53d6(\u6001\u5ea6\u7b49)\uff1b\u9009\u5b9a\uff1b\u6536\u517b"

    aput-object v3, v0, v2

    const/16 v2, 0x127f

    .line 4912
    const-string v3, "4736. excerpt n./vt.\u6458\u5f55;\u5f15\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x1280

    .line 4913
    const-string v3, "4737. abrupt a.\u7a81\u7136\u7684\uff0c\u51fa\u5176\u4e0d\u610f\u7684\uff1b(\u884c\u4e3a\u7b49)\u7c97\u9c81\u65e0\u793c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1281

    .line 4914
    const-string v3, "4738. erupt v.(\u5c24\u6307\u706b\u5c71)\u7206\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1282

    .line 4915
    const-string v3, "4739. bankrupt a.\u7834\u4ea7\u7684\uff1b\u5f7b\u5e95\u7f3a\u4e4f\u7684 vt.\u4f7f\u7834\u4ea7n.\u7834\u4ea7\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x1283

    .line 4916
    const-string v3, "4740. interrupt v.\u4e2d\u65ad,\u906e\u65ad,\u963b\u788d;\u6253\u65ad(\u8bdd),\u6253\u6270"

    aput-object v3, v0, v2

    const/16 v2, 0x1284

    .line 4917
    const-string v3, "4741. corrupt v.\u8d3f\u8d42,\u6536\u4e70 a.\u8150\u8d25\u7684,\u8d2a\u6c61\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1285

    .line 4918
    const-string v3, "4742. disrupt vt.\u4f7f\u6df7\u4e71\uff0c\u4f7f\u5d29\u6e83\uff0c\u4f7f\u5206\u88c2\uff0c\u4f7f\u74e6\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1286

    .line 4919
    const-string v3, "4743. art n.\u827a\u672f\uff0c\u7f8e\u672f\uff1b\u6280\u672f\uff0c\u6280\u827a\uff1b\u6587\u79d1\uff0c\u4eba\u6587\u79d1\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1287

    .line 4920
    const-string v3, "4744. cart n.(\u4e8c\u8f6e\u8d27\u8fd0)\u9a6c\u8f66,\u624b\u63a8\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x1288

    .line 4921
    const-string v3, "4745. heart n.\u5fc3(\u810f)\uff1b\u5185\u5fc3\uff0c\u611f\u60c5\uff1b\u70ed\u5ff1\uff1b\u4e2d\u5fc3\uff0c\u8981\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x1289

    .line 4922
    const-string v3, "4746. chart n.\u56fe\u8868\uff1b\u822a\u6d77\u56fe\uff1b\u822a\u884c\u56fe vt.\u7ed8\u56fe\u8868\uff0c\u5236\u56fe\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x128a

    .line 4923
    const-string v3, "4747. smart a.\u6f02\u4eae\u7684;\u806a\u660e\u7684;\u5de7\u5999\u7684 v.\u5267\u75db,\u523a\u75bc"

    aput-object v3, v0, v2

    const/16 v2, 0x128b

    .line 4924
    const-string v3, "4748. part n.\u90e8\u5206,\u89d2\u8272,\u4e00\u65b9,\u96f6\u4ef6,\u5730\u533a,\u90e8,\u7bc7v.\u4f7f\u5206\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x128c

    .line 4925
    const-string v3, "4749. apart ad.\u5206\u79bb\uff0c\u79bb\u5f00\uff0c\u9694\u5f00 a.\u5206\u79bb\u7684\uff0c\u5206\u9694\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x128d

    .line 4926
    const-string v3, "4750. depart vi.\u79bb\u5f00,\u8d77\u7a0b  a.\u8fc7\u53bb\u7684,\u901d\u4e16\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x128e

    .line 4927
    const-string v3, "4751. impart vt.\u4f20\u6388\uff0c\u7ed9\u4e88\uff1b\u544a\u77e5\uff0c\u901a\u77e5"

    aput-object v3, v0, v2

    const/16 v2, 0x128f

    .line 4928
    const-string v3, "4752. counterpart n.\u5bf9\u5e94\u7684\u4eba(\u6216\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x1290

    .line 4929
    const-string v3, "4753. start v.\u5f00\u59cb;\u52a8\u8eab;\u5403\u60ca;\u5f00\u529e,\u5f00\u52a8 n.\u5f00\u7aef;\u60ca\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x1291

    .line 4930
    const-string v3, "4754. quart n.\u5938\u8131"

    aput-object v3, v0, v2

    const/16 v2, 0x1292

    .line 4931
    const-string v3, "4755. concert n.\u97f3\u4e50\u4f1a,\u6f14\u594f\u4f1a;\u4e00\u9f50,\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1293

    .line 4932
    const-string v3, "4756. alert a.\u673a\u8b66\u7684\uff0c\u8b66\u89c9\u7684\uff1b\u673a\u7075\u7684 vt.\u4f7f\u2026\u8b66\u89c9"

    aput-object v3, v0, v2

    const/16 v2, 0x1294

    .line 4933
    const-string v3, "4757. expert n.\u4e13\u5bb6,\u80fd\u624b a.\u719f\u7ec3\u7684,\u6709\u7ecf\u9a8c\u7684;\u4e13\u95e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1295

    .line 4934
    const-string v3, "4758. desert n.\u6c99\u6f20,\u4e0d\u6bdb\u4e4b\u5730 v.\u629b\u5f03,\u9057\u5f03;\u64c5\u79bb,\u5f00\u5c0f\u5dee"

    aput-object v3, v0, v2

    const/16 v2, 0x1296

    .line 4935
    const-string v3, "4759. insert v.\u63d2\u5165,\u5d4c\u5165;\u767b\u8f7d n.\u63d2\u5165\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1297

    .line 4936
    const-string v3, "4760. assert vt.\u65ad\u8a00,\u5ba3\u79f0\uff1b\u575a\u6301\uff1b\u4e3b\u5f20\uff08\u6743\u5229\u3001\u6743\u5a01\u7b49\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x1298

    .line 4937
    const-string v3, "4761. dessert n.\u6b63\u9910\u540e\u7684\u6c34\u679c\u6216\u751c\u98df"

    aput-object v3, v0, v2

    const/16 v2, 0x1299

    .line 4938
    const-string v3, "4762. avert v.\u9632\u6b62\uff0c\u907f\u514d \uff1b\u8f6c\u79fb(\u76ee\u5149\u3001\u6ce8\u610f\u529b\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x129a

    .line 4939
    const-string v3, "4763. divert vt.\u4f7f\u8f6c\u5411\uff0c\u4f7f\u6539\u9053\uff1b\u8f6c\u79fb(\u6ce8\u610f\u529b)\uff1b\u4f7f\u5a31\u4e50"

    aput-object v3, v0, v2

    const/16 v2, 0x129b

    .line 4940
    const-string v3, "4764. invert v.\u5012\u7f6e,\u5012\u8f6c,\u98a0\u5012"

    aput-object v3, v0, v2

    const/16 v2, 0x129c

    .line 4941
    const-string v3, "4765. convert v.\u53d8\u6362,\u8f6c\u6362\uff1b\u6539\u53d8\uff08\u4fe1\u4ef0\u7b49\uff09\uff1b\u5151\u6362\uff08\u94b1\uff09"

    aput-object v3, v0, v2

    const/16 v2, 0x129d

    .line 4942
    const-string v3, "4766. exert v.\u5c3d(\u529b),\u65bd\u52a0(\u538b\u529b\u7b49),\u52aa\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x129e

    .line 4943
    const-string v3, "4767. dirt n.\u6c61\u7269,\u6c61\u57a2"

    aput-object v3, v0, v2

    const/16 v2, 0x129f

    .line 4944
    const-string v3, "4768. shirt n.\u886c\u886b"

    aput-object v3, v0, v2

    const/16 v2, 0x12a0

    .line 4945
    const-string v3, "4769. skirt n.\u88d9\u5b50;\u8fb9\u7f18,\u90ca\u533a"

    aput-object v3, v0, v2

    const/16 v2, 0x12a1

    .line 4946
    const-string v3, "4770. escort vt.\u62a4\u9001(\u536b)\uff1b\u966a\u540c n.\u8b66\u536b\uff0c\u62a4\u9001\u8005\uff1b\u4eea\u4ed7\u5175"

    aput-object v3, v0, v2

    const/16 v2, 0x12a2

    .line 4947
    const-string v3, "4771. effort n.\u52aa\u529b;\u6210\u5c31;\u8270\u96be\u7684\u5c1d\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x12a3

    .line 4948
    const-string v3, "4772. comfort n.\u8212\u9002\uff0c\u5b89\u9038\uff1b\u5b89\u6170\uff0c\u6170\u95ee v.\u5b89\u6170\uff0c\u4f7f\u8212\u9002"

    aput-object v3, v0, v2

    const/16 v2, 0x12a4

    .line 4949
    const-string v3, "4773. short a.\u77ed\u7684,\u77ee\u7684;(of)\u7f3a\u4e4f,\u4e0d\u8db3 n.(pl.)\u77ed\u88e4"

    aput-object v3, v0, v2

    const/16 v2, 0x12a5

    .line 4950
    const-string v3, "4774. port n.\u6e2f\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x12a6

    .line 4951
    const-string v3, "4775. report n./v.\u62a5\u544a,\u6c47\u62a5;\u4f20\u8bf4,\u4f20\u9605"

    aput-object v3, v0, v2

    const/16 v2, 0x12a7

    .line 4952
    const-string v3, "4776. import v./n.\u8fdb\u53e3,\u8f93\u5165,(pl.)\u8fdb\u53e3\u5546\u54c1;\u8981\u65e8,\u542b\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x12a8

    .line 4953
    const-string v3, "4777. support n./vt.\u652f\u6491;\u652f\u6301;\u8d61\u517b;\u7ef4\u6301 n.\u652f\u6301\u8005;\u652f\u67f1"

    aput-object v3, v0, v2

    const/16 v2, 0x12a9

    .line 4954
    const-string v3, "4778. airport n.\u673a\u573a\uff0c\u822a\u7a7a\u7ad9\uff0c\u822a\u7a7a\u6e2f"

    aput-object v3, v0, v2

    const/16 v2, 0x12aa

    .line 4955
    const-string v3, "4779. sport n.(\u4f53\u80b2)\u8fd0\u52a8 (pl.)\u8fd0\u52a8\u4f1a vi.\u5f00\u73a9\u7b11\uff1b\u73a9\u800d"

    aput-object v3, v0, v2

    const/16 v2, 0x12ab

    .line 4956
    const-string v3, "4780. transport v.\u8fd0\u8f93,\u8fd0\u9001,\u642c\u8fd0n.\u8fd0\u8f93;\u8fd0\u8f93\u7cfb\u7edf,\u8fd0\u8f7d\u5de5\u5177"

    aput-object v3, v0, v2

    const/16 v2, 0x12ac

    .line 4957
    const-string v3, "4781. passport n.\u62a4\u7167,\u8fbe\u5230\u67d0\u79cd\u76ee\u7684\u7684\u624b\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0x12ad

    .line 4958
    const-string v3, "4782. export v./n.\u8f93\u51fa,\u51fa\u53e3 n.\u51fa\u53e3\u5546\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x12ae

    .line 4959
    const-string v3, "4783. sort n.\u79cd\u7c7b,\u7c7b\u522b v.\u5206\u7c7b,\u6574\u7406"

    aput-object v3, v0, v2

    const/16 v2, 0x12af

    .line 4960
    const-string v3, "4784. resort v.\u51ed\u501f,\u6c42\u52a9,\u8bc9\u8bf8n.\u5ea6\u5047\u80dc\u5730,\u5e38\u53bb\u4e4b\u5904,\u624b\u6bb5"

    aput-object v3, v0, v2

    const/16 v2, 0x12b0

    .line 4961
    const-string v3, "4785. retort n./v.\u62a5\u590d,\u53cd\u51fb,\u53cd\u9a73"

    aput-object v3, v0, v2

    const/16 v2, 0x12b1

    .line 4962
    const-string v3, "4786. distort v.\u5f04\u6b6a(\u5634\u8138\u7b49);\u626d\u66f2;\u6b6a\u66f2(\u771f\u7406\u3001\u4e8b\u5b9e\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x12b2

    .line 4963
    const-string v3, "4787. "

    aput-object v3, v0, v2

    const/16 v2, 0x12b3

    .line 4964
    const-string v3, "4788. hurt n.\u4f24\u75db,\u4f24\u5bb3 v.\u523a\u75db,\u4f24\u5bb3;\u4f24\u2026\u7684\u611f\u60c5"

    aput-object v3, v0, v2

    const/16 v2, 0x12b4

    .line 4965
    const-string v3, "4789. court n.\u6cd5\u9662,\u6cd5\u5ead;\u5bab\u5ef7,\u671d\u5ef7;\u9662\u5b50;\u7403\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x12b5

    .line 4966
    const-string v3, "4790. cast v.\u6295,\u6254,\u63b7,\u629b\uff1b\u94f8\u9020\uff1b\u6295\u7968\uff1bn.\u6f14\u5458\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x12b6

    .line 4967
    const-string v3, "4791. broadcast v./n.\u5e7f\u64ad(\u8282\u76ee)"

    aput-object v3, v0, v2

    const/16 v2, 0x12b7

    .line 4968
    const-string v3, "4792. forecast v./n.\u9884\u6d4b,\u9884\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x12b8

    .line 4969
    const-string v3, "4793. east n.\u4e1c,\u4e1c\u65b9,\u4e1c\u90e8 a.\u4e1c\u65b9\u7684,\u4e1c\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12b9

    .line 4970
    const-string v3, "4794. beast n.\u517d,\u7272\u755c;\u51f6\u6b8b\u7684\u4eba,\u4e3e\u6b62\u7c97\u9c81\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x12ba

    .line 4971
    const-string v3, "4795. feast n.\u8282\u65e5;\u5bb4\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x12bb

    .line 4972
    const-string v3, "4796. northeast n.\u4e1c\u5317 a.\u4e1c\u5317\u65b9\u7684 ad.\u5411\u4e1c\u5317,\u5728\u4e1c\u5317"

    aput-object v3, v0, v2

    const/16 v2, 0x12bc

    .line 4973
    const-string v3, "4797. southeast n./a.\u4e1c\u5357(\u7684),\u4e1c\u5357\u90e8(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x12bd

    .line 4974
    const-string v3, "4798. least a.\u6700\u5c0f\u7684;\u6700\u5c11\u7684 ad.\u6700\u5c0f;\u6700\u5c11"

    aput-object v3, v0, v2

    const/16 v2, 0x12be

    .line 4975
    const-string v3, "4799. breast n.\u80f8\u819b,\u4e73\u623f"

    aput-object v3, v0, v2

    const/16 v2, 0x12bf

    .line 4976
    const-string v3, "4800. fast a.\u5feb\u7684\uff0c\u8fc5\u901f\u7684\uff1b\u575a\u56fa\u7684 ad.\u7d27\u7d27\u5730\uff1b\u8fc5\u901f\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x12c0

    .line 4977
    const-string v3, "4801. breakfast n.\u65e9\u9910 v.(\u7ed9\u67d0\u4eba)\u5403\u65e9\u9910"

    aput-object v3, v0, v2

    const/16 v2, 0x12c1

    .line 4978
    const-string v3, "4802. last a.\u6700\u540e\u7684\uff0c\u521a\u8fc7\u53bb\u7684 ad.\u6700\u540e n.\u6700\u540e v.\u6301\u7eed"

    aput-object v3, v0, v2

    const/16 v2, 0x12c2

    .line 4979
    const-string v3, "4803. blast n.\u4e00\u9635(\u98ce);\u7206\u70b8\u51b2\u51fb\u6ce2;\u7ba1\u4e50\u5668\u58f0 v.\u7206\u70b8"

    aput-object v3, v0, v2

    const/16 v2, 0x12c3

    .line 4980
    const-string v3, "4804. boast v.(of,about)\u81ea\u5938,\u5938\u8000 n.\u81ea\u5938,\u5927\u8bdd"

    aput-object v3, v0, v2

    const/16 v2, 0x12c4

    .line 4981
    const-string v3, "4805. coast n.\u6d77\u5cb8,\u6d77\u6ee8"

    aput-object v3, v0, v2

    const/16 v2, 0x12c5

    .line 4982
    const-string v3, "4806. roast v.\u70e4,\u7099,\u70d8"

    aput-object v3, v0, v2

    const/16 v2, 0x12c6

    .line 4983
    const-string v3, "4807. toast n.\u70e4\u9762\u5305,\u5410\u53f8;\u795d\u9152(\u8bcd)v.\u70d8,\u70e4;(\u5411\u2026)\u795d\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0x12c7

    .line 4984
    const-string v3, "4808. past a.\u8fc7\u53bb\u7684 ad.\u8fc7 n.\u8fc7\u53bb\uff0c\u6614\u65e5 prep.(\u7ecf)\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x12c8

    .line 4985
    const-string v3, "4809. contrast n.\u5bf9\u6bd4\uff0c\u5bf9\u7167 vi.\u5f62\u6210\u5bf9\u6bd4 vt.\u628a\u2026\u4e0e\u2026\u5bf9\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0x12c9

    .line 4986
    const-string v3, "4810. vast a.\u5de8\u5927\u7684,\u8fbd\u9614\u7684,\u5927\u91cf\u7684;\u5de8\u989d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12ca

    .line 4987
    const-string v3, "4811. midst n.\u4e2d\u95f4,\u5f53\u4e2d"

    aput-object v3, v0, v2

    const/16 v2, 0x12cb

    .line 4988
    const-string v3, "4812. best a.\u6700\u597d\u7684(good\u548cwell\u6700\u9ad8\u7ea7) ad.\u6700\u597d\u5730\uff1b\u6700"

    aput-object v3, v0, v2

    const/16 v2, 0x12cc

    .line 4989
    const-string v3, "4813. modest a.\u8c26\u865a\u7684,\u6709\u8282\u5236\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12cd

    .line 4990
    const-string v3, "4814. manifest v.\u8868\u660e,\u8bc1\u660e,\u663e\u793a a.\u660e\u767d\u7684,\u660e\u4e86\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12ce

    .line 4991
    const-string v3, "4815. suggest v.\u5efa\u8bae,\u63d0\u51fa\uff1b\u4f7f\u8054\u60f3,\u4f7f\u60f3\u8d77\u2026\uff1b\u6697\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x12cf

    .line 4992
    const-string v3, "4816. digest vt.\u6d88\u5316\uff1b\u9886\u4f1a\uff0c\u878d\u4f1a\u8d2f\u901a n.\u6587\u6458\uff0c\u6458\u8981"

    aput-object v3, v0, v2

    const/16 v2, 0x12d0

    .line 4993
    const-string v3, "4817. chest n.\u80f8\u8154,\u80f8\u819b;\u7bb1,\u67dc"

    aput-object v3, v0, v2

    const/16 v2, 0x12d1

    .line 4994
    const-string v3, "4818. priest n.\u6559\u58eb,\u795e\u7236"

    aput-object v3, v0, v2

    const/16 v2, 0x12d2

    .line 4995
    const-string v3, "4819. lest conj.\u60df\u6050,\u514d\u5f97"

    aput-object v3, v0, v2

    const/16 v2, 0x12d3

    .line 4996
    const-string v3, "4820. nest n.\u7a9d,\u5de2 v.\u7b51\u5de2"

    aput-object v3, v0, v2

    const/16 v2, 0x12d4

    .line 4997
    const-string v3, "4821. honest a.\u8bda\u5b9e\u7684,\u6b63\u76f4\u7684,\u8001\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12d5

    .line 4998
    const-string v3, "4822. earnest a.\u70ed\u5fc3\u7684,\u8bda\u631a\u7684 n.\u70ed\u5fc3;\u771f\u631a;\u5b9a\u91d1;\u8ba4\u771f"

    aput-object v3, v0, v2

    const/16 v2, 0x12d6

    .line 4999
    const-string v3, "4823. pest n.\u5bb3\u866b"

    aput-object v3, v0, v2

    const/16 v2, 0x12d7

    .line 5000
    const-string v3, "4824. rest n.\u4f11\u606f\uff1b\u5269\u4f59\u90e8\u5206 v.\u4f11\u606f\uff1b\u7761\uff1b\u653e\uff0c\u9760\uff0c\u6401"

    aput-object v3, v0, v2

    const/16 v2, 0x12d8

    .line 5001
    const-string v3, "4825. interest n.(in)\u5174\u8da3,\u91cd\u8981\u6027;\u5229\u76cav.(in)\u4f7f\u53d1\u751f\u5174\u8da3"

    aput-object v3, v0, v2

    const/16 v2, 0x12d9

    .line 5002
    const-string v3, "4826. forest n.\u68ee\u6797"

    aput-object v3, v0, v2

    const/16 v2, 0x12da

    .line 5003
    const-string v3, "4827. arrest n.\u902e\u6355\uff0c\u6263\u7559 vt.\u902e\u6355\uff0c\u6263\u7559\uff1b\u963b\u6b62\uff1b\u5438\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x12db

    .line 5004
    const-string v3, "4828. test n./vt.\u8bd5\u9a8c\uff1b\u68c0\u9a8c\uff1b\u6d4b\u9a8c"

    aput-object v3, v0, v2

    const/16 v2, 0x12dc

    .line 5005
    const-string v3, "4829. contest n.\u7ade\u4e89,\u7ade\u8d5b,\u6bd4\u8d5b v.\u7ade\u4e89,\u6bd4\u8d5b,\u4e89\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x12dd

    .line 5006
    const-string v3, "4830. protest v./n.\u4e3b\u5f20,\u65ad\u8a00,\u6297\u8bae,\u53cd\u5bf9"

    aput-object v3, v0, v2

    const/16 v2, 0x12de

    .line 5007
    const-string v3, "4831. guest n.\u5ba2\u4eba,\u5bbe\u5ba2,\u65c5\u5ba2"

    aput-object v3, v0, v2

    const/16 v2, 0x12df

    .line 5008
    const-string v3, "4832. quest n.\u63a2\u5bfb\uff0c\u63a2\u6c42\uff1b\u5bfb\u6c42\uff0c\u8ffd\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x12e0

    .line 5009
    const-string v3, "4833. request v./n.\u8bf7\u6c42,\u8981\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x12e1

    .line 5010
    const-string v3, "4834. conquest n.\u5f81\u670d\uff0c\u5f81\u670d\u5730\uff0c\u63a0\u53d6\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x12e2

    .line 5011
    const-string v3, "4835. vest n.\u80cc\u5fc3,\u9a6c\u7532;\u6c57\u886b,\u5185\u8863"

    aput-object v3, v0, v2

    const/16 v2, 0x12e3

    .line 5012
    const-string v3, "4836. invest vt.\u6295\u8d44,\u6295\u5165(\u7cbe\u529b\u3001\u65f6\u95f4\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x12e4

    .line 5013
    const-string v3, "4837. harvest n.\u6536\u83b7,\u6536\u6210;\u6210\u679c,\u540e\u679c v.\u6536\u83b7,\u6536\u5272"

    aput-object v3, v0, v2

    const/16 v2, 0x12e5

    .line 5014
    const-string v3, "4838. west n./a.\u897f,\u897f\u65b9(\u7684),\u897f\u90e8(\u7684) ad.\u5411\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x12e6

    .line 5015
    const-string v3, "4839. northwest n.\u897f\u5317\u65b9,\u897f\u5317\u90e8a.\u897f\u5317\u7684ad.\u5411\u897f\u5317,\u5728\u897f\u5317"

    aput-object v3, v0, v2

    const/16 v2, 0x12e7

    .line 5016
    const-string v3, "4840. southwest n./a.\u897f\u5357(\u7684),\u897f\u5357\u90e8(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x12e8

    .line 5017
    const-string v3, "4841. waist n.\u8170,\u8170\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x12e9

    .line 5018
    const-string v3, "4842. physicist n.\u7269\u7406\u5b66\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0x12ea

    .line 5019
    const-string v3, "4843. fist n.\u62f3\u5934 vt.\u7528\u62f3\u5934\u6253\uff1b\u7d27\u63e1"

    aput-object v3, v0, v2

    const/16 v2, 0x12eb

    .line 5020
    const-string v3, "4844. list n.\u8868,\u76ee\u5f55,\u540d\u5355 v.\u628a\u2026\u7f16\u5217\u6210\u8868,\u5217\u5165\u8868\u5185"

    aput-object v3, v0, v2

    const/16 v2, 0x12ec

    .line 5021
    const-string v3, "4845. specialist n.\u4e13\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0x12ed

    .line 5022
    const-string v3, "4846. journalist n.\u8bb0\u8005,\u65b0\u95fb\u5de5\u4f5c\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x12ee

    .line 5023
    const-string v3, "4847. mist n.\u8584\u96fe,\u972d"

    aput-object v3, v0, v2

    const/16 v2, 0x12ef

    .line 5024
    const-string v3, "4848. chemist n.\u5316\u5b66\u5bb6;\u836f\u5242\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x12f0

    .line 5025
    const-string v3, "4849. hoist v.\u4e3e\u8d77,\u5347\u8d77,\u540a\u8d77"

    aput-object v3, v0, v2

    const/16 v2, 0x12f1

    .line 5026
    const-string v3, "4850. moist a.\u6f6e\u6e7f\u7684,\u6e7f\u6da6\u7684,\u591a\u96e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x12f2

    .line 5027
    const-string v3, "4851. typist n.\u6253\u5b57\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x12f3

    .line 5028
    const-string v3, "4852. Christ n.\u57fa\u7763\uff0c\u6551\u4e16\u4e3b\uff0c\u8036\u7a23"

    aput-object v3, v0, v2

    const/16 v2, 0x12f4

    .line 5029
    const-string v3, "4853. tourist n.\u65c5\u6e38\u8005\uff0c\u89c2\u5149\u5ba2\uff1b\u5de1\u56de\u6bd4\u8d5b\u7684\u8fd0\u52a8\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x12f5

    .line 5030
    const-string v3, "4854. wrist n.\u8155,\u8155\u5173\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x12f6

    .line 5031
    const-string v3, "4855. resist v.\u62b5\u6297,\u53cd\u6297;\u6297,\u5fcd\u5f97\u4f4f,\u62b5\u5236"

    aput-object v3, v0, v2

    const/16 v2, 0x12f7

    .line 5032
    const-string v3, "4856. insist vi.(on)\u575a\u6301\u8981\u6c42,\u575a\u51b3\u4e3b\u5f20,\u575a\u6301"

    aput-object v3, v0, v2

    const/16 v2, 0x12f8

    .line 5033
    const-string v3, "4857. consist v.(in)\u5728\u4e8e,\u5b58\u5728\u4e8e;(of)\u7531\u2026\u7ec4\u6210,\u7531\u2026\u6784\u6210"

    aput-object v3, v0, v2

    const/16 v2, 0x12f9

    .line 5034
    const-string v3, "4858. persist v.(in)\u575a\u6301,\u6301\u7eed"

    aput-object v3, v0, v2

    const/16 v2, 0x12fa

    .line 5035
    const-string v3, "4859. assist vt.\u534f\u52a9\uff0c\u5e2e\u52a9\uff0c\u4fc3\u8fdb vi.\u5e2e\u5fd9\uff0c\u53c2\u52a0"

    aput-object v3, v0, v2

    const/16 v2, 0x12fb

    .line 5036
    const-string v3, "4860. dentist n.\u7259\u533b"

    aput-object v3, v0, v2

    const/16 v2, 0x12fc

    .line 5037
    const-string v3, "4861. scientist n.\u79d1\u5b66\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0x12fd

    .line 5038
    const-string v3, "4862. artist n.\u827a\u672f\u5bb6\uff0c\u7f8e\u672f\u5bb6\uff1b(\u67d0\u65b9\u9762\u7684)\u80fd\u624b"

    aput-object v3, v0, v2

    const/16 v2, 0x12fe

    .line 5039
    const-string v3, "4863. twist v.\u637b;\u62e7;\u626d\u66f2;\u873f\u8712\u66f2\u6298\u800c\u884c n.\u62e7;\u6b6a\u66f2;\u66f2\u6298"

    aput-object v3, v0, v2

    const/16 v2, 0x12ff

    .line 5040
    const-string v3, "4864. exist v.\u5b58\u5728;\u751f\u5b58;\u751f\u6d3b"

    aput-object v3, v0, v2

    const/16 v2, 0x1300

    .line 5041
    const-string v3, "4865. Marxist a.\u9a6c\u514b\u601d\u4e3b\u4e49\u7684 n.\u9a6c\u514b\u601d\u4e3b\u4e49\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x1301

    .line 5042
    const-string v3, "4866. against prep.\u5bf9\u7740\uff0c\u9006\uff1b\u53cd\u5bf9\uff1b\u8fdd\u53cd\uff1b\u7d27\u9760\u7740\uff1b\u5bf9\u6bd4"

    aput-object v3, v0, v2

    const/16 v2, 0x1302

    .line 5043
    const-string v3, "4867. cost n.\u6210\u672c,\u8d39\u7528,\u4ee3\u4ef7 v.\u4ef7\u503c\u4e3a,\u82b1\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0x1303

    .line 5044
    const-string v3, "4868. host n.\u4e3b\u4eba;\u65c5\u5e97\u8001\u677f;\u8282\u76ee\u4e3b\u6301\u4eba;\u4e00\u5927\u7fa4,\u8bb8\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0x1304

    .line 5045
    const-string v3, "4869. ghost n.\u9b3c\u9b42,\u5e7d\u7075"

    aput-object v3, v0, v2

    const/16 v2, 0x1305

    .line 5046
    const-string v3, "4870. most a.\u6700\u591a\u7684\uff1b\u5927\u591a\u6570\u7684 ad.\u6700\uff1b\u6781\u5176 n.\u5927\u591a\u6570"

    aput-object v3, v0, v2

    const/16 v2, 0x1306

    .line 5047
    const-string v3, "4871. foremost a.\u6700\u5148\u7684;\u6700\u521d\u7684; \u4e3b\u8981\u7684 ad.\u9996\u8981\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1307

    .line 5048
    const-string v3, "4872. almost adv.\u51e0\u4e4e\uff0c\u5dee\u4e0d\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0x1308

    .line 5049
    const-string v3, "4873. utmost a.\u6700\u8fdc\u7684;\u6781\u5ea6\u7684 n.\u6781\u9650,\u6781\u5ea6,\u6700\u5927\u53ef\u80fd"

    aput-object v3, v0, v2

    const/16 v2, 0x1309

    .line 5050
    const-string v3, "4874. boost n./ vt.\u63d0\u5347\uff1b\u589e\u52a0\uff1b\u62ac\u9ad8\uff08\u4ef7\u683c\uff09\uff1b\u652f\u63f4\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x130a

    .line 5051
    const-string v3, "4875. post v.\u8d34\u51fa;\u516c\u544a;\u6295\u5bc4 n.(\u652f)\u67f1;\u90ae\u653f,\u90ae\u5bc4;\u804c\u4f4d"

    aput-object v3, v0, v2

    const/16 v2, 0x130b

    .line 5052
    const-string v3, "4876. frost n.\u971c,\u971c\u51bb,\u4e25\u5bd2"

    aput-object v3, v0, v2

    const/16 v2, 0x130c

    .line 5053
    const-string v3, "4877. first a./ad.\u7b2c\u4e00\uff1b\u6700\u521d;\u9996\u6b21 n.\u5f00\u59cbpron.\u7b2c\u4e00\u540d"

    aput-object v3, v0, v2

    const/16 v2, 0x130d

    .line 5054
    const-string v3, "4878. thirst n.\u6e34,\u53e3\u6e34;(for)\u6e34\u671b,\u70ed\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x130e

    .line 5055
    const-string v3, "4879. worst a./ad.\u6700\u574f(\u7684),\u6700\u5dee(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x130f

    .line 5056
    const-string v3, "4880. burst v.\u7206\u88c2,\u70b8\u7834;\u7a81\u7136\u53d1\u751f n.\u7a81\u7136\u7834\u88c2,\u7206\u53d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1310

    .line 5057
    const-string v3, "4881. exhaust v.\u4f7f\u7b4b\u75b2\u529b\u5c3d,\u8017\u5c3d;\u62bd\u5b8c n.\u6392\u6c14\u88c5\u7f6e;\u5e9f\u6c14"

    aput-object v3, v0, v2

    const/16 v2, 0x1311

    .line 5058
    const-string v3, "4882. robust a.\u5f3a\u5065\u7684,\u96c4\u58ee\u7684,\u7cbe\u529b\u5145\u6c9b\u7684,\u575a\u56fa\u7684,\u6d53\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1312

    .line 5059
    const-string v3, "4883. dust n.\u7070\u5c18,\u5c18\u571f v.\u62c2,\u63b8"

    aput-object v3, v0, v2

    const/16 v2, 0x1313

    .line 5060
    const-string v3, "4884. disgust n.\u538c\u6076,\u6076\u5fc3 v.\u4f7f\u538c\u6076"

    aput-object v3, v0, v2

    const/16 v2, 0x1314

    .line 5061
    const-string v3, "4885. August n.8\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x1315

    .line 5062
    const-string v3, "4886. just ad.\u6b63\u597d\u5730\uff1b\u521a\u624d\uff1b\u53ea\u4e0d\u8fc7 a.\u516c\u6b63\u7684\uff0c\u516c\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1316

    .line 5063
    const-string v3, "4887. adjust vt.\u8c03\u8282\uff1b\u6574\u987f\uff0c\u8c03\u6574 vi.\u9002\u5e94(to)\uff1b\u4f7f\u8c03\u8282"

    aput-object v3, v0, v2

    const/16 v2, 0x1317

    .line 5064
    const-string v3, "4888. must aux.&v.\u5fc5\u987b\uff1b\u5f88\u53ef\u80fd\uff1b\u4e00\u5b9a\u8981 n.\u5fc5\u987b\u505a\u7684\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x1318

    .line 5065
    const-string v3, "4889. rust n.\u94c1\u9508 v.(\u4f7f)\u751f\u9508"

    aput-object v3, v0, v2

    const/16 v2, 0x1319

    .line 5066
    const-string v3, "4890. crust n.\u5916\u76ae,\u58f3;\u5730\u58f3"

    aput-object v3, v0, v2

    const/16 v2, 0x131a

    .line 5067
    const-string v3, "4891. thrust vt.\u63d2\u5165\uff1b\u731b\u63a8 n.\u63d2\uff0c\u63a8\u529b vi.\u523a\uff0c\u6233\uff0c\u51b2"

    aput-object v3, v0, v2

    const/16 v2, 0x131b

    .line 5068
    const-string v3, "4892. trust vt.\u4fe1\u4efb;\u76fc\u671b;\u59d4\u6258 n.(in)\u4fe1\u4efb,\u4f9d\u8d56;\u59d4\u6258"

    aput-object v3, v0, v2

    const/16 v2, 0x131c

    .line 5069
    const-string v3, "4893. watt n.\u74e6,\u74e6\u7279"

    aput-object v3, v0, v2

    const/16 v2, 0x131d

    .line 5070
    const-string v3, "4894. boycott n./v.(\u8054\u5408)\u62b5\u5236,\u62d2\u7edd\u53c2\u4e0e"

    aput-object v3, v0, v2

    const/16 v2, 0x131e

    .line 5071
    const-string v3, "4895. astronaut n.\u592a\u7a7a\u4eba\uff0c\u592a\u7a7a\u65c5\u884c\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x131f

    .line 5072
    const-string v3, "4896. but conj.\u4f46\u662f prep.\u9664...\u4ee5\u5916 ad.\u53ea\uff0c\u624d\uff0c\u4ec5\u4ec5"

    aput-object v3, v0, v2

    const/16 v2, 0x1320

    .line 5073
    const-string v3, "4897. cut n./v.\u5207\uff0c\u5272\uff0c\u524a;\u524a\u51cf\uff0c\u5220\u8282 n.\u5207\u53e3\uff0c\u4f24\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1321

    .line 5074
    const-string v3, "4898. gut n.[pl.]\u80c6\u91cf\uff1b\u5185\u810fa.\u672c\u80fd\u7684vt.\u53d6\u51fa\u5185\u810f"

    aput-object v3, v0, v2

    const/16 v2, 0x1322

    .line 5075
    const-string v3, "4899. hut n.\u5c0f\u5c4b,\u68da\u5c4b"

    aput-object v3, v0, v2

    const/16 v2, 0x1323

    .line 5076
    const-string v3, "4900. shut v.\u5173,\u5173\u95ed"

    aput-object v3, v0, v2

    const/16 v2, 0x1324

    .line 5077
    const-string v3, "4901. nut n.\u575a\u679c;\u87ba\u6bcd,\u87ba\u5e3d"

    aput-object v3, v0, v2

    const/16 v2, 0x1325

    .line 5078
    const-string v3, "4902. peanut n.\u82b1\u751f"

    aput-object v3, v0, v2

    const/16 v2, 0x1326

    .line 5079
    const-string v3, "4903. out ad.\u51fa\u53bb\uff1b\u79bb\u5bb6\uff1b\u7a81\u51fa\u6765 a.\u5916\u9762\u7684\uff0c\u5f80\u5916\u53bb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1327

    .line 5080
    const-string v3, "4904. about ad.\u5728\u5468\u56f4\uff1b\u5927\u7ea6 prep.\u5173\u4e8e\uff1b\u5728\u5468\u56f4 a.\u51c6\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x1328

    .line 5081
    const-string v3, "4905. roundabout a.\u8fc2\u56de\u7684,\u8f6c\u5f2f\u62b9\u89d2\u7684 n.\u73af\u72b6\u4ea4\u53c9\u8def\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1329

    .line 5082
    const-string v3, "4906. scout n.\u4fa6\u5bdf\u5458,\u4fa6\u5bdf\u673a(\u8230) v.\u641c\u7d22,\u4fa6\u5bdf"

    aput-object v3, v0, v2

    const/16 v2, 0x132a

    .line 5083
    const-string v3, "4907. throughout prep.\u904d\u53ca\uff0c\u8d2f\u7a7f ad.\u5230\u5904\uff0c\u81ea\u59cb\u81f3\u7ec8\uff0c\u5f7b\u5e95"

    aput-object v3, v0, v2

    const/16 v2, 0x132b

    .line 5084
    const-string v3, "4908. shout v.\u5927\u58f0\u53eb\uff0c\u558a\uff0c\u547c\u51fa n.\u547c\u558a\uff0c\u53eb"

    aput-object v3, v0, v2

    const/16 v2, 0x132c

    .line 5085
    const-string v3, "4909. without prep.\u65e0\uff0c\u6ca1\u6709 n.\u5916\u9762\uff0c\u5916\u90e8"

    aput-object v3, v0, v2

    const/16 v2, 0x132d

    .line 5086
    const-string v3, "4910. sprout vi.\u53d1\u82bd\uff0c\u62bd\u6761 vt.\u4f7f\u53d1\u82bd n.\u65b0\u82bd\uff0c\u5ae9\u82d7"

    aput-object v3, v0, v2

    const/16 v2, 0x132e

    .line 5087
    const-string v3, "4911. layout n.\u5b89\u6392\uff0c\u5e03\u5c40\uff0c\u8bbe\u8ba1\uff1b\u89c4\u5212\u56fe\uff0c\u5e03\u5c40\u56fe"

    aput-object v3, v0, v2

    const/16 v2, 0x132f

    .line 5088
    const-string v3, "4912. put vt.\u653e\uff0c\u6401\uff0c\u7f6e\uff1b\u8868\u8fbe\uff1b\u4f7f\u5904\u4e8e...\u72b6\u6001\uff0c\u8bb0\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x1330

    .line 5089
    const-string v3, "4913. input n./v.\u8f93\u5165"

    aput-object v3, v0, v2

    const/16 v2, 0x1331

    .line 5090
    const-string v3, "4914. output n.\u4ea7\u91cf,\u8f93\u51fa(\u91cf)"

    aput-object v3, v0, v2

    const/16 v2, 0x1332

    .line 5091
    const-string v3, "4915. next a.\u7d27\u63a5\u7684\uff0c\u5176\u6b21\u7684\uff1b\u8d34\u8fd1\u7684 ad.\u5176\u6b21\uff1b\u5c45\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0x1333

    .line 5092
    const-string v3, "4916. text n.\u6b63\u6587\uff0c\u6587\u672c\uff1b\u539f\u6587\uff1b\u6559\u79d1\u4e66"

    aput-object v3, v0, v2

    const/16 v2, 0x1334

    .line 5093
    const-string v3, "4917. pretext n.\u501f\u53e3,\u6258\u8bcd"

    aput-object v3, v0, v2

    const/16 v2, 0x1335

    .line 5094
    const-string v3, "4918. context n.\uff08\u6587\u7ae0\u7b49\uff09\u524d\u540e\u5173\u7cfb\uff1b(\u4e8b\u4ef6\u7b49\u53d1\u751f\u7684)\u80cc\u666f"

    aput-object v3, v0, v2

    const/16 v2, 0x1336

    .line 5095
    const-string v3, "4919. bureau n.\u7f72,\u5c40,\u53f8,\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x1337

    .line 5096
    const-string v3, "4920. plateau n.\u9ad8\u539f,\u5e73\u7a33\u72b6\u6001[\u65f6\u671f]"

    aput-object v3, v0, v2

    const/16 v2, 0x1338

    .line 5097
    const-string v3, "4921. flu n.(influenza)\u6d41\u884c\u6027\u611f\u5192"

    aput-object v3, v0, v2

    const/16 v2, 0x1339

    .line 5098
    const-string v3, "4922. menu n.\u83dc\u5355"

    aput-object v3, v0, v2

    const/16 v2, 0x133a

    .line 5099
    const-string v3, "4923. you pron.\u4f60\uff1b\u4f60\u4eec\uff1b\u4e00\u4e2a\u4eba\uff0c\u4efb\u4f55\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x133b

    .line 5100
    const-string v3, "4924. TV n.(television)\u7535\u89c6\uff1b\u7535\u89c6\u673a"

    aput-object v3, v0, v2

    const/16 v2, 0x133c

    .line 5101
    const-string v3, "4925. jaw n.\u988c,\u989a"

    aput-object v3, v0, v2

    const/16 v2, 0x133d

    .line 5102
    const-string v3, "4926. law n.\u6cd5\u5f8b,\u6cd5\u89c4,\u6cd5\u5b66,\u89c4\u5f8b,\u5b9a\u5f8b"

    aput-object v3, v0, v2

    const/16 v2, 0x133e

    .line 5103
    const-string v3, "4927. claw n.\u722a,\u811a\u722a"

    aput-object v3, v0, v2

    const/16 v2, 0x133f

    .line 5104
    const-string v3, "4928. flaw n.\u88c2\u7f1d;\u7f3a\u9677 v.\u4f7f\u7834\u88c2;\u4f7f\u6709\u7f3a\u9677"

    aput-object v3, v0, v2

    const/16 v2, 0x1340

    .line 5105
    const-string v3, "4929. paw n.\u722a"

    aput-object v3, v0, v2

    const/16 v2, 0x1341

    .line 5106
    const-string v3, "4930. raw a.\u672a\u716e\u8fc7\u7684,\u751f\u7684;\u672a\u52a0\u5de5\u8fc7\u7684,\u672a\u7ecf\u8bad\u7ec3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1342

    .line 5107
    const-string v3, "4931. draw v.\u62c9;\u753b;\u6c72\u53d6;\u5f15\u51fa;(to)\u6328\u8fd1 n.\u5e73\u5c40;\u62d6\u66f3"

    aput-object v3, v0, v2

    const/16 v2, 0x1343

    .line 5108
    const-string v3, "4932. withdraw v.\u6536\u56de,\u64a4\u6d88;\u7f29\u56de,\u9000\u51fa;\u63d0\u53d6(\u94b1)"

    aput-object v3, v0, v2

    const/16 v2, 0x1344

    .line 5109
    const-string v3, "4933. straw n.\u7a3b\u8349,\u9ea6\u6746;\u5438\u7ba1"

    aput-object v3, v0, v2

    const/16 v2, 0x1345

    .line 5110
    const-string v3, "4934. saw n.\u952f\u5b50,\u952f\u5e8a v.\u952f,\u952f\u5f00"

    aput-object v3, v0, v2

    const/16 v2, 0x1346

    .line 5111
    const-string v3, "4935. dew n.\u9732\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x1347

    .line 5112
    const-string v3, "4936. few a.[\u8868\u80af\u5b9a]\u6709\u4e9b\uff0c\u51e0\u4e2a\uff1b[\u8868\u5426\u5b9a]\u51e0\u4e4e\u6ca1\u6709\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1348

    .line 5113
    const-string v3, "4937. chew v.\u5480\u56bc;\u601d\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1349

    .line 5114
    const-string v3, "4938. nephew n.\u4f84\u5b50,\u5916\u7525"

    aput-object v3, v0, v2

    const/16 v2, 0x134a

    .line 5115
    const-string v3, "4939. view n.\u89c6\u91ce;\u98ce\u666f;\u89c2\u5bdf;\u89c1\u89e3;\u7167\u7247 vt.\u89c2\u5bdf;\u8ba4\u4e3a"

    aput-object v3, v0, v2

    const/16 v2, 0x134b

    .line 5116
    const-string v3, "4940. review v.\u56de\u987e,\u590d\u4e60 n.\u56de\u987e,\u590d\u4e60;\u8bc4\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x134c

    .line 5117
    const-string v3, "4941. interview v./n.\u63a5\u89c1,\u4f1a\u89c1;\u91c7\u8bbf;\u9762\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x134d

    .line 5118
    const-string v3, "4942. new a.\u65b0(\u8fd1)\u7684\uff1b\u65b0\u6765\u7684\uff1b\u4e0d\u719f\u6089\u7684\uff1b\u6ca1\u7ecf\u9a8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x134e

    .line 5119
    const-string v3, "4943. renew v.(\u4f7f)\u66f4\u65b0,\u6062\u590d,\u91cd\u65b0\u5f00\u59cb,\u7ee7\u7eed"

    aput-object v3, v0, v2

    const/16 v2, 0x134f

    .line 5120
    const-string v3, "4944. crew n.\u5168\u4f53\u8239\u5458,\u5168\u4f53\u4e58\u52a1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x1350

    .line 5121
    const-string v3, "4945. screw n.\u87ba\u65cb,\u87ba\u4e1d(\u9489) v.\u62e7,\u62e7\u7d27"

    aput-object v3, v0, v2

    const/16 v2, 0x1351

    .line 5122
    const-string v3, "4946. sew v.\u7f1d,\u7f1d\u7eab"

    aput-object v3, v0, v2

    const/16 v2, 0x1352

    .line 5123
    const-string v3, "4947. bow v./n.\u97a0\u8eac,\u70b9\u5934 n.\u5f13(\u5f62);\u8774\u8776\u7ed3"

    aput-object v3, v0, v2

    const/16 v2, 0x1353

    .line 5124
    const-string v3, "4948. elbow n.\u8098\uff0c(\u8863\u670d\u7684)\u8098\u90e8vt.\u7528\u8098\u63a8\uff0c\u7528\u8098\u6324"

    aput-object v3, v0, v2

    const/16 v2, 0x1354

    .line 5125
    const-string v3, "4949. rainbow n.\u8679"

    aput-object v3, v0, v2

    const/16 v2, 0x1355

    .line 5126
    const-string v3, "4950. cow n.\u6bcd\u725b,\u5976\u725b"

    aput-object v3, v0, v2

    const/16 v2, 0x1356

    .line 5127
    const-string v3, "4951. meadow n.\u8349\u5730,\u7267\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x1357

    .line 5128
    const-string v3, "4952. shadow n.\u9634\u5f71,\u5f71\u5b50,\u836b;\u6697\u5904,\u9634\u6697"

    aput-object v3, v0, v2

    const/16 v2, 0x1358

    .line 5129
    const-string v3, "4953. widow n.\u5be1\u5987"

    aput-object v3, v0, v2

    const/16 v2, 0x1359

    .line 5130
    const-string v3, "4954. endow vt.\u8d44\u52a9\uff0c\u6350\u8d60\uff1b(with)\u7ed9\u4e88\uff0c\u8d4b\u4e88"

    aput-object v3, v0, v2

    const/16 v2, 0x135a

    .line 5131
    const-string v3, "4955. window n.\u7a97,\u7a97\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x135b

    .line 5132
    const-string v3, "4956. how ad.1.(\u8868\u793a\u65b9\u6cd5\u3001\u624b\u6bb5\u3001\u72b6\u6001)\u600e\u6837\uff1b\u5982\u4f55"

    aput-object v3, v0, v2

    const/16 v2, 0x135c

    .line 5133
    const-string v3, "4957. somehow ad.\u4ee5\u67d0\u79cd\u65b9\u5f0f\uff0c\u7528\u67d0\u79cd\u65b9\u6cd5\uff1b\u4e0d\u77e5\u600e\u4e48\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x135d

    .line 5134
    const-string v3, "4958. show n.\u8282\u76ee\uff0c\u8868\u6f14 v.\u4e0a\u6f14(\u620f\u5267\u7b49)\uff0c\u653e\u6620(\u7535\u5f71)"

    aput-object v3, v0, v2

    const/16 v2, 0x135e

    .line 5135
    const-string v3, "4959. anyhow ad.\u4e0d\u7ba1\u600e\u4e48\u8bf4\uff0c\u65e0\u8bba\u5982\u4f55\uff1b\u4e0d\u8bba\u7528\u4f55\u79cd\u65b9\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x135f

    .line 5136
    const-string v3, "4960. low a.\u4f4e\uff0c\u77ee\uff1b\u4f4e\u7ea7\u7684\uff0c\u4e0b\u5c42\u7684\uff0c\u5351\u8d31\u7684\uff1b\u4f4e\u58f0\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1360

    .line 5137
    const-string v3, "4961. blow vi.\u5439\uff0c\u5439\u6c14\uff0c\u6253\u6c14\uff1b\u5439\u594f\uff1b\u7206\u70b8\uff1bn.\u6253,\u6253\u51fb"

    aput-object v3, v0, v2

    const/16 v2, 0x1361

    .line 5138
    const-string v3, "4962. below prep.\u5728\u2026\u4e0b\u9762\uff0c\u5728\u2026\u4ee5\u4e0b ad.\u5728\u4e0b\u9762\uff0c\u5411\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x1362

    .line 5139
    const-string v3, "4963. flow v.\u6d41,\u6d41\u52a8 n.\u6d41\u91cf,\u6d41\u901f"

    aput-object v3, v0, v2

    const/16 v2, 0x1363

    .line 5140
    const-string v3, "4964. overflow v.(\u4f7f)\u5916\u6ea2,(\u4f7f)\u6ea2\u51fa;\u6ea2\u51fa,\u6d41\u51fa,\u6f2b\u51fa"

    aput-object v3, v0, v2

    const/16 v2, 0x1364

    .line 5141
    const-string v3, "4965. glow v.\u53d1\u70ed,\u53d1\u5149,\u53d1\u7ea2 n.\u767d\u70ed"

    aput-object v3, v0, v2

    const/16 v2, 0x1365

    .line 5142
    const-string v3, "4966. allow vt.\u5141\u8bb8\uff0c\u51c6\u8bb8\uff1b\u627f\u8ba4\uff1b\u7ed9\u4e88\uff1b(for)\u8003\u8651\u5230"

    aput-object v3, v0, v2

    const/16 v2, 0x1366

    .line 5143
    const-string v3, "4967. shallow a.\u6d45\u7684,\u6d45\u8584\u7684 n.\u6d45\u6ee9,\u6d45\u5904"

    aput-object v3, v0, v2

    const/16 v2, 0x1367

    .line 5144
    const-string v3, "4968. swallow n.\u71d5\u5b50;\u541e\u54bdvt.\u541e,\u54bd;\u8f7b\u4fe1;\u5fcd\u53d7;vi.\u54bd\u53e3\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x1368

    .line 5145
    const-string v3, "4969. fellow n.\u4eba,\u5bb6\u4f19;\u4f19\u4f34,\u540c\u4e8b a.\u540c\u6837\u7684,\u540c\u4e8b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1369

    .line 5146
    const-string v3, "4970. yellow a.\u9ec4\u7684\uff0c\u9ec4\u8272\u7684 n.\u9ec4\u8272"

    aput-object v3, v0, v2

    const/16 v2, 0x136a

    .line 5147
    const-string v3, "4971. pillow n.\u6795\u5934"

    aput-object v3, v0, v2

    const/16 v2, 0x136b

    .line 5148
    const-string v3, "4972. follow v.\u8ddf\u968f,\u63a5\u7740;\u9886\u4f1a;\u6cbf\u7740\u2026\u524d\u8fdb,\u9075\u5faa;\u7ed3\u679c\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x136c

    .line 5149
    const-string v3, "4973. hollow a.\u7a7a\u7684,\u4e2d\u7a7a\u7684;\u7a7a\u6d1e\u7684,\u7a7a\u865a\u7684 v.\u6316\u7a7a,\u51ff\u7a7a"

    aput-object v3, v0, v2

    const/16 v2, 0x136d

    .line 5150
    const-string v3, "4974. slow a.\u6162\u7684,\u4e0d\u6d3b\u8dc3\u7684 v.(down)(\u4f7f)\u653e\u6162,\u51cf\u901f"

    aput-object v3, v0, v2

    const/16 v2, 0x136e

    .line 5151
    const-string v3, "4975. now ad.\u73b0\u5728\uff0c\u5982\u4eca\uff0c\u76ee\u524d\uff1b\u5f53\u65f6\uff0c\u4e8e\u662f\uff0c\u7136\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0x136f

    .line 5152
    const-string v3, "4976. know vt.\u77e5\u9053\uff0c\u4e86\u89e3\uff1b\u8ba4\u8bc6\uff1b\u8bc6\u522b vi.\u77e5\u9053\uff0c\u4e86\u89e3"

    aput-object v3, v0, v2

    const/16 v2, 0x1370

    .line 5153
    const-string v3, "4977. snow n.\u96ea\uff0c\u4e0b\u96ea vi.\u4e0b\u96ea\uff1b\u5982\u96ea\u4e00\u822c\u5730\u843d\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x1371

    .line 5154
    const-string v3, "4978. row n.(\u4e00)\u6392\uff0c(\u4e00)\u884c\uff1b\u5435\u56b7 v.\u5212(\u8239\u7b49)\uff0c\u8361\u6868"

    aput-object v3, v0, v2

    const/16 v2, 0x1372

    .line 5155
    const-string v3, "4979. brow n.\u7709(\u6bdb);\u989d"

    aput-object v3, v0, v2

    const/16 v2, 0x1373

    .line 5156
    const-string v3, "4980. eyebrow n.\u7709\u6bdb"

    aput-object v3, v0, v2

    const/16 v2, 0x1374

    .line 5157
    const-string v3, "4981. crow n.\u4e4c\u9e26 v./n.\u9e21\u557c,\u9e23\u53eb"

    aput-object v3, v0, v2

    const/16 v2, 0x1375

    .line 5158
    const-string v3, "4982. grow v.\u751f\u957f\uff0c\u6210\u957f\uff1b\u6e10\u6e10\u53d8\u6210\uff1b\u683d\u57f9\uff0c\u79cd\u690d\uff1b\u53d1\u5c55"

    aput-object v3, v0, v2

    const/16 v2, 0x1376

    .line 5159
    const-string v3, "4983. throw vt.\u6254\uff1b\u4f7f\u7a81\u7136\u9677\u5165\uff1b\u4f7f\u56f0\u60d1n.\u6295\u63b7(\u8ddd\u79bb)"

    aput-object v3, v0, v2

    const/16 v2, 0x1377

    .line 5160
    const-string v3, "4984. overthrow v./n.\u63a8\u7ffb,\u98a0\u8986"

    aput-object v3, v0, v2

    const/16 v2, 0x1378

    .line 5161
    const-string v3, "4985. arrow n.\u7bad\uff0c\u77e2\uff0c\u7bad\u72b6\u7269\uff1b\u7bad\u5934\u7b26\u53f7"

    aput-object v3, v0, v2

    const/16 v2, 0x1379

    .line 5162
    const-string v3, "4986. narrow a.\u72ed\u7a84\u7684,\u72ed\u7684,\u72ed\u9698\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x137a

    .line 5163
    const-string v3, "4987. borrow vt.\u501f\uff0c\u501f\u5165\uff1b(\u601d\u60f3\u3001\u6587\u5b57\u7b49)\u91c7\u7528\uff0c\u6284\u88ad"

    aput-object v3, v0, v2

    const/16 v2, 0x137b

    .line 5164
    const-string v3, "4988. tomorrow n.\u660e\u5929\uff1b\u6765\u65e5\uff0c\u672a\u6765 ad.\u5728\u660e\u5929\uff0c\u5728\u660e\u65e5"

    aput-object v3, v0, v2

    const/16 v2, 0x137c

    .line 5165
    const-string v3, "4989. sorrow n.\u60b2\u8870,\u60b2\u75db"

    aput-object v3, v0, v2

    const/16 v2, 0x137d

    .line 5166
    const-string v3, "4990. sow v.\u64ad\u79cd"

    aput-object v3, v0, v2

    const/16 v2, 0x137e

    .line 5167
    const-string v3, "4991. tow vt.(\u7528\u7ef3\u3001\u94fe\u7b49)\u62d6(\u8f66\u3001\u8239\u7b49) n.\u62d6,\u7275\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x137f

    .line 5168
    const-string v3, "4992. fax n./v.\u4f20\u771f(\u673a)"

    aput-object v3, v0, v2

    const/16 v2, 0x1380

    .line 5169
    const-string v3, "4993. relax v.(\u4f7f)\u677e\u9a70,\u653e\u677e"

    aput-object v3, v0, v2

    const/16 v2, 0x1381

    .line 5170
    const-string v3, "4994. climax n.\u9876\u70b9,\u9ad8\u6f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x1382

    .line 5171
    const-string v3, "4995. tax n.\u7a0e(\u6b3e),\u8d1f\u62c5 v.\u5bf9\u2026\u5f81\u7a0e,\u4f7f\u8d1f\u91cd\u62c5"

    aput-object v3, v0, v2

    const/16 v2, 0x1383

    .line 5172
    const-string v3, "4996. wax n.\u8721,\u8702\u8721 v.\u6253\u8721"

    aput-object v3, v0, v2

    const/16 v2, 0x1384

    .line 5173
    const-string v3, "4997. index n.(pl.indexes,indices)\u7d22\u5f15 v.\u9644\u4ee5\u7d22\u5f15"

    aput-object v3, v0, v2

    const/16 v2, 0x1385

    .line 5174
    const-string v3, "4998. complex a.\u590d\u6742\u7684;\u5408\u6210\u7684,\u7efc\u5408\u7684 n.\u8054\u5408\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x1386

    .line 5175
    const-string v3, "4999. perplex v.\u4f7f\u56f0\u60d1,\u4f7f\u8d39\u89e3,\u4f7f\u590d\u6742\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x1387

    .line 5176
    const-string v3, "5000. sex n.\u6027\u522b,\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x1388

    .line 5177
    const-string v3, "5001. appendix n.\u9644\u5f55\uff0c\u9644\u5c5e\u7269\uff1b\u9611\u5c3e\uff0c\u76f2\u80a0"

    aput-object v3, v0, v2

    const/16 v2, 0x1389

    .line 5178
    const-string v3, "5002. fix v.(\u4f7f)\u56fa\u5b9a;\u4fee\u7406;\u5b89\u88c5;\u51b3\u5b9a;\u6ce8\u89c6 n.\u56f0\u5883"

    aput-object v3, v0, v2

    const/16 v2, 0x138a

    .line 5179
    const-string v3, "5003. mix v.\u4f7f\u6df7\u5408;\u6df7\u6dc6"

    aput-object v3, v0, v2

    const/16 v2, 0x138b

    .line 5180
    const-string v3, "5004. six num.\u516d pron./a.\u516d(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x138c

    .line 5181
    const-string v3, "5005. ox n.\u725b,\u516c\u725b"

    aput-object v3, v0, v2

    const/16 v2, 0x138d

    .line 5182
    const-string v3, "5006. box n.\u76d2\uff0c\u7bb1\uff1b\u5305\u53a2 v.\u628a\u2026\u88c5\u7bb1\uff1b\u62f3\u51fb\uff0c\u6253\u8033\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x138e

    .line 5183
    const-string v3, "5007. paradox n.\u4f3c\u975e\u800c\u662f\u7684\u8bdd,\u81ea\u76f8\u77db\u76fe\u7684\u8bdd,\u53cd\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x138f

    .line 5184
    const-string v3, "5008. orthodox a.\u4f20\u7edf\u7684,\u6b63\u7edf\u7684,\u4e60\u60ef\u7684,\u4fdd\u5b88\u7684,\u4e1c\u6b63\u6559\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1390

    .line 5185
    const-string v3, "5009. fox n.\u72d0\u72f8"

    aput-object v3, v0, v2

    const/16 v2, 0x1391

    .line 5186
    const-string v3, "5010. bay n.\u6d77\u6e7e,(\u6e2f)\u6e7e"

    aput-object v3, v0, v2

    const/16 v2, 0x1392

    .line 5187
    const-string v3, "5011. decay v./n.\u8150\u673d,\u8150\u70c2;\u8870\u51cf,\u8870\u9000"

    aput-object v3, v0, v2

    const/16 v2, 0x1393

    .line 5188
    const-string v3, "5012. day n.\u5929\uff0c\u4e00\u663c\u591c\uff1b\u767d\u663c\uff0c\u767d\u5929\uff1b\u65f6\u671f\uff0c\u65f6\u4ee3"

    aput-object v3, v0, v2

    const/16 v2, 0x1394

    .line 5189
    const-string v3, "5013. birthday n.\u751f\u65e5\uff1b(\u6210\u65b9)\u7eaa\u5ff5\u65e5"

    aput-object v3, v0, v2

    const/16 v2, 0x1395

    .line 5190
    const-string v3, "5014. holiday n.\u5047\u65e5,\u8282\u65e5,\u5047\u671f,\u4f11\u5047"

    aput-object v3, v0, v2

    const/16 v2, 0x1396

    .line 5191
    const-string v3, "5015. Friday n.\u661f\u671f\u4e94"

    aput-object v3, v0, v2

    const/16 v2, 0x1397

    .line 5192
    const-string v3, "5016. weekday n.\u5e73\u5e38\u65e5,\u5de5\u4f5c\u65e5"

    aput-object v3, v0, v2

    const/16 v2, 0x1398

    .line 5193
    const-string v3, "5017. Monday n.\u661f\u671f\u4e00"

    aput-object v3, v0, v2

    const/16 v2, 0x1399

    .line 5194
    const-string v3, "5018. Sunday n.\u661f\u671f\u65e5"

    aput-object v3, v0, v2

    const/16 v2, 0x139a

    .line 5195
    const-string v3, "5019. today ad.\u5728\u4eca\u5929\uff1b\u73b0\u4eca\uff0c\u5728\u5f53\u4ee3 n.\u4eca\u5929\uff1b\u73b0\u5728"

    aput-object v3, v0, v2

    const/16 v2, 0x139b

    .line 5196
    const-string v3, "5020. yesterday n.&ad.\u6628\u5929\uff1b\u524d\u4e0d\u4e45"

    aput-object v3, v0, v2

    const/16 v2, 0x139c

    .line 5197
    const-string v3, "5021. Saturday n.\u661f\u671f\u516d"

    aput-object v3, v0, v2

    const/16 v2, 0x139d

    .line 5198
    const-string v3, "5022. Wednesday n.\u661f\u671f\u4e09"

    aput-object v3, v0, v2

    const/16 v2, 0x139e

    .line 5199
    const-string v3, "5023. Tuesday n.\u661f\u671f\u4e8c"

    aput-object v3, v0, v2

    const/16 v2, 0x139f

    .line 5200
    const-string v3, "5024. Thursday n.\u661f\u671f\u56db"

    aput-object v3, v0, v2

    const/16 v2, 0x13a0

    .line 5201
    const-string v3, "5025. everyday adj.\u6bcf\u65e5\u7684\uff0c\u65e5\u5e38\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13a1

    .line 5202
    const-string v3, "5026. gay a.\u5feb\u4e50\u7684,\u6109\u5feb\u7684,\u8272\u5f69\u9c9c\u8273\u7684 n.\u540c\u6027\u604b"

    aput-object v3, v0, v2

    const/16 v2, 0x13a2

    .line 5203
    const-string v3, "5027. hay n.\u5e72\u8349"

    aput-object v3, v0, v2

    const/16 v2, 0x13a3

    .line 5204
    const-string v3, "5028. okay a.(okey\uff0cOK\uff0cO.K.)\u597d\uff0c\u884c\uff0c\u4e0d\u9519 n.\u540c\u610f"

    aput-object v3, v0, v2

    const/16 v2, 0x13a4

    .line 5205
    const-string v3, "5029. lay v.\u653e\uff0c\u6401\uff1b\u4e0b(\u86cb)\uff1b\u94fa\u8bbe\uff0c\u6577\u8bbe\uff1b\u8bbe\u7f6e\uff0c\u5e03\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x13a5

    .line 5206
    const-string v3, "5030. clay n.\u7c98\u571f,\u6ce5\u571f"

    aput-object v3, v0, v2

    const/16 v2, 0x13a6

    .line 5207
    const-string v3, "5031. delay v./n.\u803d\u6401,\u5ef6\u8fdf"

    aput-object v3, v0, v2

    const/16 v2, 0x13a7

    .line 5208
    const-string v3, "5032. relay v.\u4e2d\u7ee7,\u8f6c\u64ad,\u63a5\u529b n.\u63a5\u66ff\u4eba\u5458,\u66ff\u73ed"

    aput-object v3, v0, v2

    const/16 v2, 0x13a8

    .line 5209
    const-string v3, "5033. play v.\u73a9\uff0c\u505a\u6e38\u620f\uff1b\u53c2\u52a0\u6bd4\u8d5bn.\u6e38\u620f\uff1b\u73a9\u800d\uff1b\u5267\u672c"

    aput-object v3, v0, v2

    const/16 v2, 0x13a9

    .line 5210
    const-string v3, "5034. display v./n.\u9648\u5217,\u5c55\u89c8,\u663e\u793a(\u5668)"

    aput-object v3, v0, v2

    const/16 v2, 0x13aa

    .line 5211
    const-string v3, "5035. may aux.v.\u53ef\u80fd\uff0c\u4e5f\u8bb8\uff1b\u53ef\u4ee5\uff0c\u88ab\u5141\u8bb8\uff1b\u795d\uff0c\u613f"

    aput-object v3, v0, v2

    const/16 v2, 0x13ab

    .line 5212
    const-string v3, "5036. May n.\u4e94\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x13ac

    .line 5213
    const-string v3, "5037. dismay n./v.(\u4f7f)\u6cae\u4e27;(\u4f7f)\u60ca\u614c;(\u4f7f)\u5931\u671b,(\u4f7f)\u7edd\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x13ad

    .line 5214
    const-string v3, "5038. "

    aput-object v3, v0, v2

    const/16 v2, 0x13ae

    .line 5215
    const-string v3, "5039. "

    aput-object v3, v0, v2

    const/16 v2, 0x13af

    .line 5216
    const-string v3, "5040. pay v.\u4ed8\u6b3e,\u4ed8\u51fa\u4ee3\u4ef7,\u7ed9\u4e88\u6ce8\u610f n.\u5de5\u8d44,\u85aa\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x13b0

    .line 5217
    const-string v3, "5041. repay v.\u507f\u8fd8,\u62a5\u7b54"

    aput-object v3, v0, v2

    const/16 v2, 0x13b1

    .line 5218
    const-string v3, "5042. ray n.\u5149\u7ebf,\u5c04\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x13b2

    .line 5219
    const-string v3, "5043. X-ray n.X\u5c04\u7ebf,X\u5149"

    aput-object v3, v0, v2

    const/16 v2, 0x13b3

    .line 5220
    const-string v3, "5044. pray v.\u8bf7\u6c42,\u6073\u6c42;\u7948\u7977,\u7948\u6c42"

    aput-object v3, v0, v2

    const/16 v2, 0x13b4

    .line 5221
    const-string v3, "5045. spray n.\u55b7\u96fe,\u98de\u6cab,\u6d6a\u82b1,\u6c34\u82b1 v.\u55b7,\u55b7\u5c04"

    aput-object v3, v0, v2

    const/16 v2, 0x13b5

    .line 5222
    const-string v3, "5046. array n.\u5927\u91cf\uff1b\u6392\u5217\uff1b\u76db\u88c5 v.\u5217\u9635\uff1b\u88c5\u626e\uff1b\u6392\u5217"

    aput-object v3, v0, v2

    const/16 v2, 0x13b6

    .line 5223
    const-string v3, "5047. tray n.\u76d8,\u789f,\u6258\u76d8"

    aput-object v3, v0, v2

    const/16 v2, 0x13b7

    .line 5224
    const-string v3, "5048. betray v.\u80cc\u53db,\u51fa\u5356;\u66b4\u9732,\u6d41\u9732,\u6cc4\u9732"

    aput-object v3, v0, v2

    const/16 v2, 0x13b8

    .line 5225
    const-string v3, "5049. portray v.\u63cf\u5199\uff0c\u63cf\u8ff0\uff1b\u753b(\u4eba\u7269\u3001\u666f\u8c61\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x13b9

    .line 5226
    const-string v3, "5050. say vt.\u8bf4\uff0c\u8bb2\uff1b\u8bf4\u660e\uff1b\u6bd4\u5982\u8bf4 vi.\u8bf4\uff0c\u53d1\u8868\u610f\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x13ba

    .line 5227
    const-string v3, "5051. essay n.\u6587\u7ae0,\u77ed\u6587"

    aput-object v3, v0, v2

    const/16 v2, 0x13bb

    .line 5228
    const-string v3, "5052. stay vi.\u9017\u7559\uff1b\u4fdd\u6301vt.\u505c\u6b62\uff0c\u5ef6\u7f13n.\u9017\u7559\uff0c\u505c\u7559"

    aput-object v3, v0, v2

    const/16 v2, 0x13bc

    .line 5229
    const-string v3, "5053. way n.\u9053\u8def\uff0c\u8def\u7a0b\uff1b\u65b9\u6cd5/\u5f0f\uff0c\u624b\u6bb5\uff1b\u4e60\u60ef\uff1b\u72b6\u6001"

    aput-object v3, v0, v2

    const/16 v2, 0x13bd

    .line 5230
    const-string v3, "5054. away ad.\u5728\u8fdc\u5904\uff1b\u79bb\u5f00\uff1b\u6e10\u6e10\u8fdc\u53bb\uff1b\u4e00\u76f4\uff1b\u53bb\u6389"

    aput-object v3, v0, v2

    const/16 v2, 0x13be

    .line 5231
    const-string v3, "5055. subway n.\u5730\u94c1\uff1b\u5730\u4e0b\u884c\u4eba\u96a7\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x13bf

    .line 5232
    const-string v3, "5056. highway n.\u516c\u8def,\u5927\u8def"

    aput-object v3, v0, v2

    const/16 v2, 0x13c0

    .line 5233
    const-string v3, "5057. doorway n.\u95e8\u53e3"

    aput-object v3, v0, v2

    const/16 v2, 0x13c1

    .line 5234
    const-string v3, "5058. sway vi.\u6447\u52a8\uff1b\u503e\u659c vt.\u4f7f\u6447\u52a8 n.\u6447\u52a8\uff1b\u5f71\u54cd\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x13c2

    .line 5235
    const-string v3, "5059. anyway ad.\u4e0d\u7ba1\u600e\u4e48\u8bf4\uff0c\u65e0\u8bba\u5982\u4f55\uff1b\u4e0d\u8bba\u4ee5\u4f55\u79cd\u65b9\u5f0f"

    aput-object v3, v0, v2

    const/16 v2, 0x13c3

    .line 5236
    const-string v3, "5060. by prep.\u88ab\uff1b\u51ed\u501f\uff1b\u7ecf\u7531\uff1b\u7531\u4e8ead.\u5728\u8fd1\u65c1\uff1b\u7ecf\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x13c4

    .line 5237
    const-string v3, "5061. passer-by n.(pl.passers-by)\u8fc7\u8def\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x13c5

    .line 5238
    const-string v3, "5062. baby n.\u5a74\u513f\uff1b\u5e74\u9f84\u6700\u5c0f\u7684\u4eba\uff1b\u5c0f\u52a8\u7269 a.\u5a74\u513f\u4f3c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13c6

    .line 5239
    const-string v3, "5063. shabby a.\u7b80\u964b\u7684,\u7834\u65e7\u7684,\u5351\u9119\u7684,\u4e0d\u516c\u5e73\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13c7

    .line 5240
    const-string v3, "5064. hobby n.\u4e1a\u4f59\u7231\u597d,\u55dc\u597d,\u5174\u8da3"

    aput-object v3, v0, v2

    const/16 v2, 0x13c8

    .line 5241
    const-string v3, "5065. lobby n.\u95e8\u5eca,\u95e8\u5385,(\u4f1a\u8bae)\u4f11\u606f\u5385"

    aput-object v3, v0, v2

    const/16 v2, 0x13c9

    .line 5242
    const-string v3, "5066. goodby int.(goodbye)\u518d\u89c1"

    aput-object v3, v0, v2

    const/16 v2, 0x13ca

    .line 5243
    const-string v3, "5067. thereby ad.\u56e0\u6b64,\u4ece\u800c"

    aput-object v3, v0, v2

    const/16 v2, 0x13cb

    .line 5244
    const-string v3, "5068. nearby a.\u9644\u8fd1\u7684 ad.\u5728\u9644\u8fd1 prep.\u5728\u2026\u9644\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0x13cc

    .line 5245
    const-string v3, "5069. ruby n.\u7ea2\u5b9d\u77f3"

    aput-object v3, v0, v2

    const/16 v2, 0x13cd

    .line 5246
    const-string v3, "5070. legacy n.\u9057\u4ea7\uff0c\u9057\u8d60\uff1b\u5148\u4eba(\u6216\u8fc7\u53bb)\u7559\u4e0b\u7684\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x13ce

    .line 5247
    const-string v3, "5071. pharmacy n.\u836f\u623f,\u836f\u5242\u5b66,\u5236\u836f\u4e1a,\u914d\u836f\u4e1a,\u4e00\u6279\u5907\u7528\u836f\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x13cf

    .line 5248
    const-string v3, "5072. democracy n.\u6c11\u4e3b,\u6c11\u4e3b\u5236,\u6c11\u4e3b\u56fd\u5bb6"

    aput-object v3, v0, v2

    const/16 v2, 0x13d0

    .line 5249
    const-string v3, "5073. bureaucracy n.\u5b98\u50da\u4e3b\u4e49\uff0c\u5b98\u50da\u673a\u6784\uff1b(\u975e\u6c11\u9009\u7684)\u59d4\u4efb\u5b98\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x13d1

    .line 5250
    const-string v3, "5074. literacy n.\u6709\u6587\u5316,\u6709\u6559\u517b,\u6709\u8bfb\u5199\u80fd\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x13d2

    .line 5251
    const-string v3, "5075. conspiracy n.\u9634\u8c0b\uff0c\u5bc6\u8c0b\uff0c\u5171\u8c0b"

    aput-object v3, v0, v2

    const/16 v2, 0x13d3

    .line 5252
    const-string v3, "5076. accuracy n.\u51c6\u786e\uff08\u6027\uff09\uff1b\u7cbe\u786e\uff1b\u51c6\u786e\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x13d4

    .line 5253
    const-string v3, "5077. privacy n.(\u4e0d\u53d7\u5e72\u6270\u7684)\u72ec\u5904\uff0c\u81ea\u7531\uff0c\u9690\u79c1\uff1b\u79c1\u751f\u6d3b"

    aput-object v3, v0, v2

    const/16 v2, 0x13d5

    .line 5254
    const-string v3, "5078. policy n.\u653f\u7b56,\u65b9\u9488"

    aput-object v3, v0, v2

    const/16 v2, 0x13d6

    .line 5255
    const-string v3, "5079. spicy a.\u52a0\u5f88\u591a\u9999\u6599\u7684\uff1b(\u53e3\u5473)\u6d53\u90c1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13d7

    .line 5256
    const-string v3, "5080. fancy n.\u7231\u597d,\u8ff7\u604b v.\u60f3\u8c61,\u5e7b\u60f3 a.\u82b1\u5f0f\u7684,\u5947\u7279\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13d8

    .line 5257
    const-string v3, "5081. discrepancy n.\u76f8\u5dee;\u5dee\u5f02;\u77db\u76fe;"

    aput-object v3, v0, v2

    const/16 v2, 0x13d9

    .line 5258
    const-string v3, "5082. tendency n.\u8d8b\u52bf\uff0c\u8d8b\u5411\uff1b\u503e\u5411"

    aput-object v3, v0, v2

    const/16 v2, 0x13da

    .line 5259
    const-string v3, "5083. agency n.\u4ee3\u7406(\u5904)\uff1b\u4ee3\u529e\u5904\uff1b[\u7f8e](\u653f\u5e9c\u7684)\u673a\u5173\uff0c\u5385"

    aput-object v3, v0, v2

    const/16 v2, 0x13db

    .line 5260
    const-string v3, "5084. emergency n.\u7d27\u6025\u60c5\u51b5,\u7a81\u7136\u4e8b\u4ef6,\u975e\u5e38\u65f6\u523b"

    aput-object v3, v0, v2

    const/16 v2, 0x13dc

    .line 5261
    const-string v3, "5085. deficiency n.\u7f3a\u4e4f,\u4e0d\u8db3;\u7f3a\u70b9,\u7f3a\u9677"

    aput-object v3, v0, v2

    const/16 v2, 0x13dd

    .line 5262
    const-string v3, "5086. efficiency n.\u6548\u7387;\u529f\u6548"

    aput-object v3, v0, v2

    const/16 v2, 0x13de

    .line 5263
    const-string v3, "5087. proficiency n.(in)\u719f\u7ec3,\u7cbe\u901a"

    aput-object v3, v0, v2

    const/16 v2, 0x13df

    .line 5264
    const-string v3, "5088. currency n.\u6d41\u4f20,\u6d41\u901a\uff1b\u901a\u8d27,\u8d27\u5e01"

    aput-object v3, v0, v2

    const/16 v2, 0x13e0

    .line 5265
    const-string v3, "5089. frequency n.\u9891\u7387,\u5468\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x13e1

    .line 5266
    const-string v3, "5090. mercy n.\u4ec1\u6148,\u601c\u60af,\u5bbd\u6055"

    aput-object v3, v0, v2

    const/16 v2, 0x13e2

    .line 5267
    const-string v3, "5091. ready a.(for)\u51c6\u5907\u597d\u7684,\u73b0\u6210\u7684;\u7518\u5fc3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13e3

    .line 5268
    const-string v3, "5092. already ad.\u5df2\uff0c\u5df2\u7ecf\uff0c\u65e9\u5df2"

    aput-object v3, v0, v2

    const/16 v2, 0x13e4

    .line 5269
    const-string v3, "5093. steady a.\u7a33\u5b9a\u7684,\u4e0d\u53d8\u7684;\u575a\u5b9a\u7684v.(\u4f7f)\u7a33\u56fa/\u7a33\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x13e5

    .line 5270
    const-string v3, "5094. shady a.\u6210\u836b\u7684,\u591a\u836b\u7684;\u53ef\u7591\u7684,\u9760\u4e0d\u4f4f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13e6

    .line 5271
    const-string v3, "5095. lady n.\u5973\u58eb,\u592b\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x13e7

    .line 5272
    const-string v3, "5096. landlady n.\u5973\u623f\u4e1c,\u5973\u5730\u4e3b"

    aput-object v3, v0, v2

    const/16 v2, 0x13e8

    .line 5273
    const-string v3, "5097. greedy a.\u8d2a\u5403\u7684,\u8d2a\u5a6a\u7684,\u6e34\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13e9

    .line 5274
    const-string v3, "5098. tragedy n.\u60b2\u5267;\u60e8\u4e8b,\u707e\u96be"

    aput-object v3, v0, v2

    const/16 v2, 0x13ea

    .line 5275
    const-string v3, "5099. remedy n.\u836f\u54c1;\u6cbb\u7597\u63aa\u65bd v.\u6cbb\u7597,\u533b\u6cbb;\u7ea0\u6b63,\u8865\u6551"

    aput-object v3, v0, v2

    const/16 v2, 0x13eb

    .line 5276
    const-string v3, "5100. comedy n.\u559c\u5267;\u559c\u5267\u6027\u4e8b\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x13ec

    .line 5277
    const-string v3, "5101. subsidy n.\u8865\u52a9\u91d1\uff1b\u6d25\u8d34\u8d39"

    aput-object v3, v0, v2

    const/16 v2, 0x13ed

    .line 5278
    const-string v3, "5102. tidy a.\u6574\u6d01\u7684,\u6574\u9f50\u7684 v.\u6574\u7406,\u6536\u62fe"

    aput-object v3, v0, v2

    const/16 v2, 0x13ee

    .line 5279
    const-string v3, "5103. candy n.\u7cd6\u679c"

    aput-object v3, v0, v2

    const/16 v2, 0x13ef

    .line 5280
    const-string v3, "5104. handy a.\u624b\u8fb9\u7684,\u8fd1\u4fbf\u7684;\u65b9\u4fbf\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13f0

    .line 5281
    const-string v3, "5105. brandy n.\u767d\u5170\u5730\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0x13f1

    .line 5282
    const-string v3, "5106. body n.\u8eab\u4f53,\u672c\u4f53;\u4e3b\u4f53;\u5c38\u4f53;\u7269\u4f53;(\u4e00)\u7fa4,\u6279,\u5806"

    aput-object v3, v0, v2

    const/16 v2, 0x13f2

    .line 5283
    const-string v3, "5107. somebody pron.\u67d0\u4eba\uff0c\u6709\u4eba n.\u91cd\u8981\u4eba\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x13f3

    .line 5284
    const-string v3, "5108. embody vt.\u5177\u4f53\u8868\u8fbe,\u4f7f\u5177\u4f53\u5316;\u5305\u542b,\u6536\u5f55"

    aput-object v3, v0, v2

    const/16 v2, 0x13f4

    .line 5285
    const-string v3, "5109. nobody pron.\u8c01\u4e5f\u4e0d,\u65e0\u4eba n.\u5c0f\u4eba\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x13f5

    .line 5286
    const-string v3, "5110. anybody pron.(\u5426\u5b9a\u53e5)\u4efb\u4f55\u4eba\uff1b(\u80af\u5b9a\u53e5)\u968f\u4fbf\u54ea\u4e2a\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x13f6

    .line 5287
    const-string v3, "5111. everybody pron.(everyone)\u6bcf\u4eba\uff0c\u4eba\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x13f7

    .line 5288
    const-string v3, "5112. melody n.\u65cb\u5f8b\uff0c\u66f2\u8c03\uff1b\u60a6\u8033\u7684\u97f3\u4e50"

    aput-object v3, v0, v2

    const/16 v2, 0x13f8

    .line 5289
    const-string v3, "5113. bloody a.\u6d41\u8840\u7684,\u8840\u8165\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13f9

    .line 5290
    const-string v3, "5114. sturdy a.\u575a\u5b9a\u7684\uff0c\u4e0d\u5c48\u4e0d\u6320\u7684\uff1b\u5f3a\u5065\u7684\uff0c\u7ed3\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13fa

    .line 5291
    const-string v3, "5115. cloudy a.\u591a\u4e91\u7684,\u9634(\u5929)\u7684;\u6df7\u6d4a\u7684,\u6a21\u7cca\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13fb

    .line 5292
    const-string v3, "5116. study vt.\u5b66\u4e60\uff1b\u7814\u7a76\uff1b\u7ec6\u770b vi.\u8bfb\u4e66 n.\u5b66\u4e60\uff1b\u7814\u7a76"

    aput-object v3, v0, v2

    const/16 v2, 0x13fc

    .line 5293
    const-string v3, "5117. obey v.\u670d\u4ece, \u987a\u4ece"

    aput-object v3, v0, v2

    const/16 v2, 0x13fd

    .line 5294
    const-string v3, "5118. they \u5546\u5e97\u3002(\u4e00\u822c\u4eba\u7ecf\u5e38\u7528\u590d\u6570they\u6765\u6307\u4e00\u5bb6\u5546\u5e97)"

    aput-object v3, v0, v2

    const/16 v2, 0x13fe

    .line 5295
    const-string v3, "5119. key n.\u94a5\u5319\uff1b\u7b54\u6848\uff1b\u5173\u952e\uff1b\u952e a.\u4e3b\u8981\u7684\uff0c\u5173\u952e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x13ff

    .line 5296
    const-string v3, "5120. donkey n.\u9a74\u5b50\uff1b\u8822\u4eba\uff1b\u987d\u56fa\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x1400

    .line 5297
    const-string v3, "5121. monkey n.\u7334\u5b50"

    aput-object v3, v0, v2

    const/16 v2, 0x1401

    .line 5298
    const-string v3, "5122. turkey n.\u706b\u9e21(\u8089)"

    aput-object v3, v0, v2

    const/16 v2, 0x1402

    .line 5299
    const-string v3, "5123. valley n.(\u5c71)\u8c37;\u6d41\u57df"

    aput-object v3, v0, v2

    const/16 v2, 0x1403

    .line 5300
    const-string v3, "5124. trolley n.\u624b\u63a8\u8f66;(\u82f1)\u65e0\u8f68\u7535\u8f66,(\u7f8e)\u6709\u8f68\u7535\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x1404

    .line 5301
    const-string v3, "5125. kidney n.\u80be,\u80be\u810f"

    aput-object v3, v0, v2

    const/16 v2, 0x1405

    .line 5302
    const-string v3, "5126. chimney n.\u70df\u56f1"

    aput-object v3, v0, v2

    const/16 v2, 0x1406

    .line 5303
    const-string v3, "5127. honey n.\u871c,\u8702\u871c"

    aput-object v3, v0, v2

    const/16 v2, 0x1407

    .line 5304
    const-string v3, "5128. money n.\u8d27\u5e01,\u94b1"

    aput-object v3, v0, v2

    const/16 v2, 0x1408

    .line 5305
    const-string v3, "5129. attorney n.(\u4e1a\u52a1\u6216\u6cd5\u5f8b\u4e8b\u52a1\u4e0a\u7684)\u4ee3\u7406\u4eba\uff1b\u8fa9\u62a4\u5f8b\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x1409

    .line 5306
    const-string v3, "5130. journey n.\u65c5\u884c,\u65c5\u7a0b v.\u65c5\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x140a

    .line 5307
    const-string v3, "5131. grey n./a.(gray)\u7070\u8272(\u7684)"

    aput-object v3, v0, v2

    const/16 v2, 0x140b

    .line 5308
    const-string v3, "5132. storey n.(story)\u697c,\u5c42"

    aput-object v3, v0, v2

    const/16 v2, 0x140c

    .line 5309
    const-string v3, "5133. prey n.\u88ab\u63a0\u98df\u8005,\u727a\u7272\u8005,\u63a0\u98df v.\u6355\u98df,\u63a0\u593a,\u6298\u78e8"

    aput-object v3, v0, v2

    const/16 v2, 0x140d

    .line 5310
    const-string v3, "5134. convey v.\u8fd0\u9001,\u642c\u8fd0,\u8f6c\u8fd0;\u4f20\u8fbe,\u4f20\u64ad"

    aput-object v3, v0, v2

    const/16 v2, 0x140e

    .line 5311
    const-string v3, "5135. survey v./n.\u4fef\u77b0,\u773a\u671b;\u5168\u9762\u5ba1\u89c6,\u8c03\u67e5;\u6d4b\u91cf\u56fe,\u52d8\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x140f

    .line 5312
    const-string v3, "5136. defy v.(\u516c\u7136)\u8fdd\u6297,\u53cd\u6297;\u8511\u89c6"

    aput-object v3, v0, v2

    const/16 v2, 0x1410

    .line 5313
    const-string v3, "5137. specify v.\u6307\u5b9a,\u8be6\u7ec6\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x1411

    .line 5314
    const-string v3, "5138. modify v.\u66f4\u6539,\u4fee\u6539,\u4fee\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x1412

    .line 5315
    const-string v3, "5139. qualify v.(\u4f7f)\u5177\u6709\u8d44\u683c,\u8bc1\u660e\u5408\u683c;\u9650\u5236,\u9650\u5b9a;\u4fee\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x1413

    .line 5316
    const-string v3, "5140. amplify vt.\u653e\u5927\uff0c\u589e\u5f3a\uff1b\u8be6\u8ff0\uff0c\u8be6\u52a0\u89e3\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x1414

    .line 5317
    const-string v3, "5141. exemplify v.\u4e3e\u4f8b\u8bc1\u660e;\u793a\u8303;\u4f5c...\u7684\u8303\u4f8b[\u699c\u6837]"

    aput-object v3, v0, v2

    const/16 v2, 0x1415

    .line 5318
    const-string v3, "5142. simplify v.\u7b80\u5316,\u4f7f\u5355\u7eaf"

    aput-object v3, v0, v2

    const/16 v2, 0x1416

    .line 5319
    const-string v3, "5143. magnify vt.\u653e\u5927,\u6269\u5927,\u5938\u5927,\u5938\u5f20"

    aput-object v3, v0, v2

    const/16 v2, 0x1417

    .line 5320
    const-string v3, "5144. signify v.\u8868\u793a,\u610f\u5473;\u8981\u7d27,\u6709\u91cd\u8981\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x1418

    .line 5321
    const-string v3, "5145. unify v.\u4f7f\u8054\u5408,\u7edf\u4e00;\u4f7f\u76f8\u540c,\u4f7f\u4e00\u81f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1419

    .line 5322
    const-string v3, "5146. clarify v.\u6f84\u6e05,\u9610\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x141a

    .line 5323
    const-string v3, "5147. verify vt.\u8bc1\u5b9e,\u67e5\u8bc1;\u8bc1\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x141b

    .line 5324
    const-string v3, "5148. terrify v.\u4f7f\u5bb3\u6015,\u4f7f\u60ca\u6050"

    aput-object v3, v0, v2

    const/16 v2, 0x141c

    .line 5325
    const-string v3, "5149. purify v.\u4f7f\u7eaf\u51c0,\u63d0\u7eaf"

    aput-object v3, v0, v2

    const/16 v2, 0x141d

    .line 5326
    const-string v3, "5150. classify v.\u5206\u7c7b,\u5206\u7b49(\u7ea7)"

    aput-object v3, v0, v2

    const/16 v2, 0x141e

    .line 5327
    const-string v3, "5151. rectify v.\u7ea0\u6b63,\u6574\u987f, [\u5316]\u7cbe\u998f"

    aput-object v3, v0, v2

    const/16 v2, 0x141f

    .line 5328
    const-string v3, "5152. quantify v.\u786e\u5b9a\u6570\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1420

    .line 5329
    const-string v3, "5153. identify v.\u8bc6\u522b,\u9274\u522b;(with)\u628a\u2026\u548c\u2026\u770b\u6210\u4e00\u6837"

    aput-object v3, v0, v2

    const/16 v2, 0x1421

    .line 5330
    const-string v3, "5154. notify v.\u901a\u77e5,\u544a\u77e5,\u62a5\u544a"

    aput-object v3, v0, v2

    const/16 v2, 0x1422

    .line 5331
    const-string v3, "5155. certify vt.\u8bc1\u660e\uff0c\u8bc1\u5b9e\uff1b\u53d1\u8bc1\u4e66(\u6216\u6267\u7167)\u7ed9"

    aput-object v3, v0, v2

    const/16 v2, 0x1423

    .line 5332
    const-string v3, "5156. testify v.\u4f5c\u8bc1\uff0c\u8bc1\u660e\uff1b(to)\u8868\u660e\uff0c\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x1424

    .line 5333
    const-string v3, "5157. justify v.\u8bc1\u660e...\u6b63\u5f53(\u6216\u6709\u7406\u3001\u6b63\u786e)\uff0c\u4e3a...\u8fa9\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x1425

    .line 5334
    const-string v3, "5158. satisfy v.\u6ee1\u610f,\u4f7f\u6ee1\u610f,\u4f7f\u76f8\u4fe1,\u8bf4\u670d"

    aput-object v3, v0, v2

    const/16 v2, 0x1426

    .line 5335
    const-string v3, "5159. strategy n.\u6218\u7565\uff0c\u7b56\u7565\uff1b\u5bf9\u7b56\uff0c\u653f\u7b56"

    aput-object v3, v0, v2

    const/16 v2, 0x1427

    .line 5336
    const-string v3, "5160. analogy n.\u7c7b\u4f3c\uff0c\u76f8\u4f3c\uff0c\u7c7b\u6bd4\uff0c\u7c7b\u63a8"

    aput-object v3, v0, v2

    const/16 v2, 0x1428

    .line 5337
    const-string v3, "5161. ecology n.\u751f\u6001\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1429

    .line 5338
    const-string v3, "5162. ideology n.\u610f\u8bc6\u5f62\u6001\uff0c(\u653f\u6cbb\u6216\u793e\u4f1a\u7684)\u601d\u60f3\u610f\u8bc6"

    aput-object v3, v0, v2

    const/16 v2, 0x142a

    .line 5339
    const-string v3, "5163. geology n.\u5730\u8d28(\u5b66)"

    aput-object v3, v0, v2

    const/16 v2, 0x142b

    .line 5340
    const-string v3, "5164. psychology n.\u5fc3\u7406,\u5fc3\u7406\u5b66,\u5fc3\u7406\u72b6\u6001"

    aput-object v3, v0, v2

    const/16 v2, 0x142c

    .line 5341
    const-string v3, "5165. biology n.\u751f\u7269\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x142d

    .line 5342
    const-string v3, "5166. sociology n.\u793e\u4f1a\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x142e

    .line 5343
    const-string v3, "5167. technology n.\u79d1\u5b66\u6280\u672f\uff1b\u5de5\u4e1a\u6280\u672f\uff1b\u5e94\u7528\u79d1\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x142f

    .line 5344
    const-string v3, "5168. apology n.\u9053\u6b49\uff0c\u8ba4\u9519\uff0c\u8fa9\u89e3\uff0c\u8fa9\u62a4"

    aput-object v3, v0, v2

    const/16 v2, 0x1430

    .line 5345
    const-string v3, "5169. clergy n.[\u603b\u79f0]\u7267\u5e08\uff0c\u795e\u804c\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x1431

    .line 5346
    const-string v3, "5170. energy n.\u6d3b\u529b,\u7cbe\u529b;\u80fd,\u80fd\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1432

    .line 5347
    const-string v3, "5171. hierarchy n.\u7b49\u7ea7\u5236\u5ea6\uff1b\u7edf\u6cbb\u96c6\u56e2\uff0c\u9886\u5bfc\u5c42"

    aput-object v3, v0, v2

    const/16 v2, 0x1433

    .line 5348
    const-string v3, "5172. geography n.\u5730\u7406(\u5b66)"

    aput-object v3, v0, v2

    const/16 v2, 0x1434

    .line 5349
    const-string v3, "5173. biography n.\u4f20\u8bb0\uff1b\u4f20\u8bb0\u6587\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1435

    .line 5350
    const-string v3, "5174. bibliography n.(\u6709\u5173\u67d0\u4e00\u4e13\u9898\u7684)\u4e66\u76ee\uff1b\u53c2\u8003\u4e66\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0x1436

    .line 5351
    const-string v3, "5175. philosophy n.\u54f2\u5b66,\u54f2\u7406,\u4eba\u751f\u89c2,\u4ef7\u503c\u89c2,\u4e16\u754c\u89c2"

    aput-object v3, v0, v2

    const/16 v2, 0x1437

    .line 5352
    const-string v3, "5176. shy a.\u6015\u7f9e\u7684\uff0c\u817c\u8146\u7684\uff1b\u80c6\u602f\u7684vi.\u60ca\u9000\uff0c\u754f\u7f29"

    aput-object v3, v0, v2

    const/16 v2, 0x1438

    .line 5353
    const-string v3, "5177. sympathy n.\u540c\u60c5\uff0c\u540c\u60c5\u5fc3\uff1b\u8d5e\u540c\uff0c\u540c\u611f\uff1b\u6170\u95ee"

    aput-object v3, v0, v2

    const/16 v2, 0x1439

    .line 5354
    const-string v3, "5178. healthy a.\u5065\u5eb7\u7684,\u5065\u58ee\u7684;\u6709\u76ca\u5065\u5eb7\u7684,\u536b\u751f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x143a

    .line 5355
    const-string v3, "5179. wealthy a.\u5bcc\u6709\u7684,\u4e30\u88d5\u7684,\u5145\u5206\u7684 n.\u5bcc\u4eba,\u6709\u94b1\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x143b

    .line 5356
    const-string v3, "5180. worthy a.(of)\u503c\u5f97\u2026\u7684,\u914d\u5f97\u4e0a\u2026\u7684;\u6709\u4ef7\u503c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x143c

    .line 5357
    const-string v3, "5181. why ad./conj.\u4e3a\u4ec0\u4e48\uff1b\u2026\u7684\u7406\u7531 int.\u54b3\uff0c\u54ce\u5440"

    aput-object v3, v0, v2

    const/16 v2, 0x143d

    .line 5358
    const-string v3, "5182. sticky a.\u7c98\u7684\uff0c\u7c98\u6027\u7684\uff1b\u68d8\u624b\u7684\uff1b(\u9053\u8def)\u6ce5\u6cde\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x143e

    .line 5359
    const-string v3, "5183. lucky a.\u5e78\u8fd0\u7684,\u4fa5\u5e78\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x143f

    .line 5360
    const-string v3, "5184. sky n.\u5929\u7a7a\uff1b[pl.]\u5929\u8272\uff1b\u6c14\u5019"

    aput-object v3, v0, v2

    const/16 v2, 0x1440

    .line 5361
    const-string v3, "5185. whisky n.\u5a01\u58eb\u5fcc\u9152"

    aput-object v3, v0, v2

    const/16 v2, 0x1441

    .line 5362
    const-string v3, "5186. invariably ad.\u4e0d\u53d8\u5730\uff0c\u6c38\u6052\u5730\uff0c\u603b\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x1442

    .line 5363
    const-string v3, "5187. presumably ad.\u63a8\u6d4b\u8d77\u6765,\u5927\u6982"

    aput-object v3, v0, v2

    const/16 v2, 0x1443

    .line 5364
    const-string v3, "5188. possibly ad.\u53ef\u80fd\u5730\uff0c\u4e5f\u8bb8\uff1b\u65e0\u8bba\u5982\u4f55"

    aput-object v3, v0, v2

    const/16 v2, 0x1444

    .line 5365
    const-string v3, "5189. assembly n.\u96c6\u5408\uff1b\u4f1a\u8bae\uff1b\u88c5\u914d\uff1b(\u7f8e)\u6d32\u8bae\u4f1a\u7684\u4f17\u8bae\u9662"

    aput-object v3, v0, v2

    const/16 v2, 0x1445

    .line 5366
    const-string v3, "5190. badly ad.\u975e\u5e38\uff0c\u4e25\u91cd\u5730\uff1b\u574f\u5730\uff0c\u5dee\u5730\uff0c\u62d9\u52a3\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1446

    .line 5367
    const-string v3, "5191. deadly a.\u81f4\u547d\u7684;\u52bf\u4e0d\u4e24\u7acb\u7684; \u6781\u5ea6\u7684;\u5fc5\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1447

    .line 5368
    const-string v3, "5192. repeatedly ad.\u91cd\u590d\u5730,\u518d\u4e09\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1448

    .line 5369
    const-string v3, "5193. undoubtedly ad.\u65e0\u7591,\u5fc5\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x1449

    .line 5370
    const-string v3, "5194. friendly a.\u53cb\u597d\u7684,\u53cb\u8c0a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x144a

    .line 5371
    const-string v3, "5195. hardly ad.\u51e0\u4e4e\u4e0d,\u7b80\u76f4\u4e0d;\u4ec5\u4ec5"

    aput-object v3, v0, v2

    const/16 v2, 0x144b

    .line 5372
    const-string v3, "5196. scarcely ad.\u51e0\u4e4e\u4e0d,\u7b80\u76f4\u6ca1\u6709,\u52c9\u5f3a"

    aput-object v3, v0, v2

    const/16 v2, 0x144c

    .line 5373
    const-string v3, "5197. largely ad.\u4e3b\u8981\u5730,\u57fa\u672c\u4e0a;\u5927\u91cf\u5730,\u5927\u89c4\u6a21\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x144d

    .line 5374
    const-string v3, "5198. likely a.\u5f88\u53ef\u80fd\u7684,\u6709\u5e0c\u671b\u7684 ad.\u5927\u6982,\u591a\u534a"

    aput-object v3, v0, v2

    const/16 v2, 0x144e

    .line 5375
    const-string v3, "5199. unlikely a.\u672a\u5fc5\u7684,\u9760\u4e0d\u4f4f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x144f

    .line 5376
    const-string v3, "5200. namely ad.\u5373,\u4e5f\u5c31\u662f"

    aput-object v3, v0, v2

    const/16 v2, 0x1450

    .line 5377
    const-string v3, "5201. timely a.\u53ca\u65f6\u7684,\u9002\u65f6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1451

    .line 5378
    const-string v3, "5202. lonely a.\u5b64\u72ec\u7684\uff0c\u5bc2\u5bde\u7684\uff1b\u8352\u51c9\u7684\uff0c\u4eba\u8ff9\u7a00\u5c11\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1452

    .line 5379
    const-string v3, "5203. rely v.(on)\u4f9d\u8d56,\u4f9d\u9760;\u4fe1\u8d56,\u4fe1\u4efb"

    aput-object v3, v0, v2

    const/16 v2, 0x1453

    .line 5380
    const-string v3, "5204. barely ad.\u8d64\u88f8\u88f8\u5730,\u65e0\u906e\u853d\u5730;\u4ec5\u4ec5,\u52c9\u5f3a,\u51e0\u4e4e\u6ca1\u6709"

    aput-object v3, v0, v2

    const/16 v2, 0x1454

    .line 5381
    const-string v3, "5205. rarely ad.\u5f88\u5c11,\u96be\u5f97,\u975e\u5e38\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1455

    .line 5382
    const-string v3, "5206. merely adv.\u4ec5\u4ec5\uff0c\u53ea\u4e0d\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x1456

    .line 5383
    const-string v3, "5207. conversely ad.\u76f8\u53cd\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1457

    .line 5384
    const-string v3, "5208. lately ad.\u6700\u8fd1,\u4e0d\u4e45\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0x1458

    .line 5385
    const-string v3, "5209. unfortunately ad.\u4e0d\u5e78\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1459

    .line 5386
    const-string v3, "5210. lively a.\u6d3b\u6cfc\u7684,\u6d3b\u8dc3\u7684;\u6829\u6829\u5982\u751f\u7684,\u771f\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x145a

    .line 5387
    const-string v3, "5211. lovely a.\u53ef\u7231\u7684,\u597d\u770b\u7684;\u4ee4\u4eba\u6109\u5feb\u7684,\u7f8e\u597d\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x145b

    .line 5388
    const-string v3, "5212. fly n.\u98de\u884c;\u82cd\u8747  v\u98de\u884c;\u98d8\u6768 a.\u673a\u654f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x145c

    .line 5389
    const-string v3, "5213. butterfly n.\u8774\u8776"

    aput-object v3, v0, v2

    const/16 v2, 0x145d

    .line 5390
    const-string v3, "5214. exceedingly ad.\u6781\u7aef\u5730,\u975e\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0x145e

    .line 5391
    const-string v3, "5215. accordingly ad.\u76f8\u5e94\u5730\uff0c\u7167\u7740\u529e\uff0c\u6309\u7167\uff1b\u4e8e\u662f\uff0c\u56e0\u6b64"

    aput-object v3, v0, v2

    const/16 v2, 0x145f

    .line 5392
    const-string v3, "5216. seemingly ad.\u5916\u89c2\u4e0a\uff0c\u8868\u9762\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x1460

    .line 5393
    const-string v3, "5217. increasingly ad.\u4e0d\u65ad\u589e\u52a0\u5730,\u65e5\u76ca"

    aput-object v3, v0, v2

    const/16 v2, 0x1461

    .line 5394
    const-string v3, "5218. ugly a.\u4e11\u964b\u7684,\u96be\u770b\u7684;\u4e11\u6076\u7684,\u8ba8\u538c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1462

    .line 5395
    const-string v3, "5219. highly ad.\u9ad8\u5ea6\u5730,\u5f88,\u975e\u5e38;\u8d5e\u8bb8\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1463

    .line 5396
    const-string v3, "5220. monthly a.\u6bcf\u6708\u7684 ad.\u6bcf\u6708\u4e00\u6b21,\u6309\u6708 n.\u6708\u520a"

    aput-object v3, v0, v2

    const/16 v2, 0x1464

    .line 5397
    const-string v3, "5221. daily a.\u6bcf\u65e5\u7684 ad.\u6bcf\u65e5,\u5929\u5929 n.\u65e5\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x1465

    .line 5398
    const-string v3, "5222. readily ad.\u5bb9\u6613\u5730;\u4e50\u610f\u5730,\u6b23\u7136\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1466

    .line 5399
    const-string v3, "5223. family n.\u5bb6,\u5bb6\u5ead\u6210\u5458;\u6c0f\u65cf,\u5bb6\u5ead;\u65cf,\u79d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1467

    .line 5400
    const-string v3, "5224. weekly a.\u6bcf\u661f\u671f\u7684,\u4e00\u5468\u7684ad.\u6bcf\u5468\u4e00\u6b21 n.\u5468\u520a,\u5468\u62a5"

    aput-object v3, v0, v2

    const/16 v2, 0x1468

    .line 5401
    const-string v3, "5225. ally n.\u540c\u76df\u8005\uff0c\u540c\u76df\u56fd\uff0cvt.\u4f7f\u7ed3\u76df\uff1b\u4e0e\u2026\u6709\u5173\u8054"

    aput-object v3, v0, v2

    const/16 v2, 0x1469

    .line 5402
    const-string v3, "5226. practically ad.\u51e0\u4e4e,\u5b9e\u9645\u4e0a,\u7b80\u76f4"

    aput-object v3, v0, v2

    const/16 v2, 0x146a

    .line 5403
    const-string v3, "5227. really ad.\u786e\u5b9e,\u5b9e\u5728,\u771f\u6b63\u5730,\u679c\u7136"

    aput-object v3, v0, v2

    const/16 v2, 0x146b

    .line 5404
    const-string v3, "5228. especially ad.\u7279\u522b\uff0c\u5c24\u5176\uff0c\u683c\u5916\uff1b\u4e13\u95e8\u5730\uff0c\u4e3b\u8981\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x146c

    .line 5405
    const-string v3, "5229. finally ad.\u6700\u540e,\u6700\u7ec8;\u51b3\u5b9a\u6027\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x146d

    .line 5406
    const-string v3, "5230. rally v.\u91cd\u6574,\u6062\u590d,\u632f\u4f5c n.\u805a\u96c6,\u96c6\u4f1a,\u62c9\u529b\u8d5b"

    aput-object v3, v0, v2

    const/16 v2, 0x146e

    .line 5407
    const-string v3, "5231. literally ad.\u7167\u5b57\u9762\u610f\u4e49,\u9010\u5b57\u5730;\u786e\u5b9e"

    aput-object v3, v0, v2

    const/16 v2, 0x146f

    .line 5408
    const-string v3, "5232. incidentally ad.\u9644\u5e26\u5730,\u987a\u4fbf\u63d0\u53ca"

    aput-object v3, v0, v2

    const/16 v2, 0x1470

    .line 5409
    const-string v3, "5233. usually ad.\u901a\u5e38,\u5e73\u5e38"

    aput-object v3, v0, v2

    const/16 v2, 0x1471

    .line 5410
    const-string v3, "5234. eventually ad.\u7ec8\u4e8e,\u6700\u540e"

    aput-object v3, v0, v2

    const/16 v2, 0x1472

    .line 5411
    const-string v3, "5235. belly n.\u809a\u5b50\uff0c\u8179\u90e8\uff1b(\u50cf\u809a\u5b50\u4e00\u6837)\u9f13\u8d77\u7684\u90e8\u5206\uff0c\u819b"

    aput-object v3, v0, v2

    const/16 v2, 0x1473

    .line 5412
    const-string v3, "5236. silly a.\u50bb\u7684,\u7cca\u6d82\u7684,\u611a\u8822\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1474

    .line 5413
    const-string v3, "5237. wholly ad.\u5b8c\u5168\u5730,\u5168\u90e8,\u4e00\u6982"

    aput-object v3, v0, v2

    const/16 v2, 0x1475

    .line 5414
    const-string v3, "5238. jolly a.\u6b22\u4e50\u7684,\u9ad8\u5174\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1476

    .line 5415
    const-string v3, "5239. bully n.\u6043\u5f3a\u6b3a\u5f31\u8005\uff0c\u5c0f\u6d41\u6c13 vt.\u5a01\u80c1\uff0c\u6b3a\u4fae"

    aput-object v3, v0, v2

    const/16 v2, 0x1477

    .line 5416
    const-string v3, "5240. certainly ad.\u4e00\u5b9a,\u5fc5\u5b9a,\u65e0\u7591;\u5f53\u7136,\u884c"

    aput-object v3, v0, v2

    const/16 v2, 0x1478

    .line 5417
    const-string v3, "5241. only ad.\u4ec5\u4ec5\uff0c\u53ea\u4e0d\u8fc7 a.\u552f\u4e00\u7684 conj.\u53ef\u662f\uff0c\u4e0d\u8fc7"

    aput-object v3, v0, v2

    const/16 v2, 0x1479

    .line 5418
    const-string v3, "5242. holy a.\u795e\u5723\u7684,\u5723\u6d01\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x147a

    .line 5419
    const-string v3, "5243. monopoly n.\u5784\u65ad,\u4e13\u5356,\u4e13\u5229\u6743,\u4e13\u5229\u4e8b\u4e1a"

    aput-object v3, v0, v2

    const/16 v2, 0x147b

    .line 5420
    const-string v3, "5244. reply v./n.(to)\u56de\u7b54,\u7b54\u590d,\u4ee5\u2026\u4f5c\u7b54"

    aput-object v3, v0, v2

    const/16 v2, 0x147c

    .line 5421
    const-string v3, "5245. multiply v.(by)\u4e58,\u4f7f\u76f8\u4e58;\u500d\u589e,\u589e\u52a0,\u7e41\u6b96"

    aput-object v3, v0, v2

    const/16 v2, 0x147d

    .line 5422
    const-string v3, "5246. imply v.\u610f\u6307,\u542b\u2026\u610f\u601d,\u6697\u793a"

    aput-object v3, v0, v2

    const/16 v2, 0x147e

    .line 5423
    const-string v3, "5247. simply ad.\u7b80\u5355\u5730;\u5b8c\u5168,\u7b80\u76f4;\u4ec5\u4ec5,\u53ea\u4e0d\u8fc7;\u6734\u7d20\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x147f

    .line 5424
    const-string v3, "5248. comply v.(with)\u9075\u7167\uff0c\u7167\u505a\uff0c\u5e94\u5141\uff1b\u987a\u4ece\uff0c\u670d\u4ece"

    aput-object v3, v0, v2

    const/16 v2, 0x1480

    .line 5425
    const-string v3, "5249. apply vi.(\u4ee5\u4e66\u9762\u5f62\u5f0f)\u7533\u8bf7\uff1b\u8bf7\u6c42 vt.\u5e94\u7528\uff1b\u5b9e\u65bd"

    aput-object v3, v0, v2

    const/16 v2, 0x1481

    .line 5426
    const-string v3, "5250. supply v.(with,to)\u4f9b\u7ed9,\u4f9b\u5e94,\u8865\u8db3 n.\u4f9b\u5e94,\u4f9b\u5e94\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1482

    .line 5427
    const-string v3, "5251. early a.\u65e9\u7684,\u65e9\u671f\u7684,\u53ca\u65e9\u7684 ad.\u65e9,\u5728\u521d\u671f"

    aput-object v3, v0, v2

    const/16 v2, 0x1483

    .line 5428
    const-string v3, "5252. nearly ad.\u5dee\u4e0d\u591a,\u51e0\u4e4e"

    aput-object v3, v0, v2

    const/16 v2, 0x1484

    .line 5429
    const-string v3, "5253. yearly a.\u6bcf\u5e74\u7684\uff0c\u4e00\u5e74\u4e00\u5ea6\u7684 ad.\u6bcf\u5e74\uff0c\u4e00\u5e74\u4e00\u6b21\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1485

    .line 5430
    const-string v3, "5254. elderly a.\u8f83\u8001\u7684\uff0c\u5e74\u957f\u7684n.[the\uff5e]\u5230\u4e86\u665a\u5e74\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x1486

    .line 5431
    const-string v3, "5255. orderly a.\u6574\u9f50\u7684,\u6709\u79e9\u5e8f\u7684,\u6709\u6761\u7406\u7684 n.\u52e4\u52a1\u5175"

    aput-object v3, v0, v2

    const/16 v2, 0x1487

    .line 5432
    const-string v3, "5256. quarterly a.\u6bcf\u5b63\u7684 ad.\u6bcf\u5b63\u4e00\u6b21 n.\u5b63\u520a"

    aput-object v3, v0, v2

    const/16 v2, 0x1488

    .line 5433
    const-string v3, "5257. fairly ad.\u516c\u6b63\u5730,\u6b63\u5f53\u5730;\u76f8\u5f53,\u8fd8\u7b97"

    aput-object v3, v0, v2

    const/16 v2, 0x1489

    .line 5434
    const-string v3, "5258. sly a.\u72e1\u733e\u7684,\u5077\u5077\u6478\u6478\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x148a

    .line 5435
    const-string v3, "5259. directly ad.\u76f4\u63a5\u5730,\u5f84\u76f4\u5730;\u9a6c\u4e0a,\u7acb\u5373"

    aput-object v3, v0, v2

    const/16 v2, 0x148b

    .line 5436
    const-string v3, "5260. gently ad.\u6587\u96c5\u5730,\u6709\u793c\u8c8c\u5730;\u8f7b\u8f7b\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x148c

    .line 5437
    const-string v3, "5261. presently ad.\u4e00\u4f1a\u513f,\u4e0d\u4e45;\u73b0\u5728,\u76ee\u524d"

    aput-object v3, v0, v2

    const/16 v2, 0x148d

    .line 5438
    const-string v3, "5262. consequently ad.\u7ed3\u679c\uff0c\u56e0\u6b64\uff0c\u6240\u4ee5"

    aput-object v3, v0, v2

    const/16 v2, 0x148e

    .line 5439
    const-string v3, "5263. partly ad.\u90e8\u5206\u5730,\u4e0d\u5b8c\u5168\u5730,\u5728\u4e00\u5b9a\u7a0b\u5ea6\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x148f

    .line 5440
    const-string v3, "5264. shortly ad.\u7acb\u523b\uff0c\u4e0d\u4e45\uff1b\u4e0d\u8010\u70e6\u5730\uff0c\u7b80\u6162\u5730"

    aput-object v3, v0, v2

    const/16 v2, 0x1490

    .line 5441
    const-string v3, "5265. costly a.\u6602\u8d35\u7684,\u4ef7\u503c\u9ad8\u7684,\u8c6a\u534e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1491

    .line 5442
    const-string v3, "5266. mostly ad.\u51e0\u4e4e\u5168\u90e8\u5730;\u4e3b\u8981\u5730,\u5927\u90e8\u5206,\u57fa\u672c\u4e0a"

    aput-object v3, v0, v2

    const/16 v2, 0x1492

    .line 5443
    const-string v3, "5267. July n.\u4e03\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x1493

    .line 5444
    const-string v3, "5268. my pron.(I\u7684\u6240\u6709\u683c)\u6211\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1494

    .line 5445
    const-string v3, "5269. academy n.(\u9ad8\u7b49)\u4e13\u79d1\u9662\u6821\uff1b\u5b66\u672f\u793e\u56e2\uff0c\u534f\u4f1a\uff0c\u7814\u7a76\u9662"

    aput-object v3, v0, v2

    const/16 v2, 0x1495

    .line 5446
    const-string v3, "5270. enemy n.\u654c\u4eba\uff0c\u4ec7\u654c\uff0c\u53cd\u5bf9\u8005\uff1b\u654c\u4eba\uff0c\u654c\u519b\uff0c\u654c\u56fd"

    aput-object v3, v0, v2

    const/16 v2, 0x1496

    .line 5447
    const-string v3, "5271. economy n.\u8282\u7ea6;\u7ecf\u6d4e"

    aput-object v3, v0, v2

    const/16 v2, 0x1497

    .line 5448
    const-string v3, "5272. astronomy n\uff0e\u5929\u6587\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1498

    .line 5449
    const-string v3, "5273. autonomy n.\u81ea\u6cbb\uff0c\u81ea\u6cbb\u6743\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x1499

    .line 5450
    const-string v3, "5274. gloomy a.\u9634\u6697\u7684,\u9634\u6c89\u7684,\u4ee4\u4eba\u6cae\u4e27\u7684,\u9634\u90c1\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x149a

    .line 5451
    const-string v3, "5275. army n.\u519b\u961f\uff0c\u9646\u519b\uff0c\u519b\uff1b\u5927\u7fa4\uff0c\u5927\u6279"

    aput-object v3, v0, v2

    const/16 v2, 0x149b

    .line 5452
    const-string v3, "5276. any a.(\u7528\u4e8e\u5426\u5b9a\u53e5\u3001\u7591\u95ee\u53e5\u7b49)\u4ec0\u4e48,\u4e00\u4e9b;\u4efb\u4f55\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x149c

    .line 5453
    const-string v3, "5277. many a.\u8bb8\u591a\u7684\uff0c\u591a\u7684 pron.\u8bb8\u591a\u4eba\u6216\u7269\uff0c\u8bb8\u591a"

    aput-object v3, v0, v2

    const/16 v2, 0x149d

    .line 5454
    const-string v3, "5278. company n.\u516c\u53f8;\u966a\u4f34;\u5bbe\u5ba2;\u8fde(\u961f),(\u4e00)\u7fa4,\u961f,\u4f19"

    aput-object v3, v0, v2

    const/16 v2, 0x149e

    .line 5455
    const-string v3, "5279. accompany v.\u966a\u4f34\uff0c\u966a\u540c\uff1b\u4f34\u968f\uff0c\u548c...\u4e00\u8d77\u53d1\u751f\uff0c\u4f34\u594f"

    aput-object v3, v0, v2

    const/16 v2, 0x149f

    .line 5456
    const-string v3, "5280. deny v.\u5426\u8ba4,\u5426\u5b9a;\u62d2\u7edd"

    aput-object v3, v0, v2

    const/16 v2, 0x14a0

    .line 5457
    const-string v3, "5281. tiny a.\u6781\u5c0f\u7684,\u5fae\u5c0f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14a1

    .line 5458
    const-string v3, "5282. destiny n.\u547d\u8fd0;\u5929\u6570,\u5929\u547d"

    aput-object v3, v0, v2

    const/16 v2, 0x14a2

    .line 5459
    const-string v3, "5283. scrutiny n.\u5468\u5bc6\u7684\u8c03\u67e5\uff1b\u4ed4\u7ec6\u770b\uff1b\u76d1\u89c6\uff1b\u9009\u7968\u590d\u67e5"

    aput-object v3, v0, v2

    const/16 v2, 0x14a3

    .line 5460
    const-string v3, "5284. penny n.\u4fbf\u58eb,\u7f8e\u5206"

    aput-object v3, v0, v2

    const/16 v2, 0x14a4

    .line 5461
    const-string v3, "5285. funny a.\u6ed1\u7a3d\u7684,\u53ef\u7b11\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14a5

    .line 5462
    const-string v3, "5286. balcony n.\u9633\u53f0\uff1b(\u7535\u5f71\u9662\u7b49\u7684)\u697c\u5385\uff0c\u697c\u5ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x14a6

    .line 5463
    const-string v3, "5287. agony n.(\u7cbe\u795e\u6216\u8089\u4f53\u7684)\u6781\u5927\u75db\u82e6\uff0c\u521b\u4f24"

    aput-object v3, v0, v2

    const/16 v2, 0x14a7

    .line 5464
    const-string v3, "5288. symphony n.\u4ea4\u54cd\u4e50,\u4ea4\u54cd\u66f2"

    aput-object v3, v0, v2

    const/16 v2, 0x14a8

    .line 5465
    const-string v3, "5289. colony n.\u6b96\u6c11\u5730\uff1b\u4fa8\u6c11\uff1b\u805a\u5c45\u533a\uff1b(\u52a8\u690d\u7269\u7684)\u7fa4\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x14a9

    .line 5466
    const-string v3, "5290. "

    aput-object v3, v0, v2

    const/16 v2, 0x14aa

    .line 5467
    const-string v3, "5291. ceremony n.\u5178\u793c,\u4eea\u5f0f;\u793c\u8282,\u793c\u4eea"

    aput-object v3, v0, v2

    const/16 v2, 0x14ab

    .line 5468
    const-string v3, "5292. testimony n.\u8bc1\u636e,\u8bc1\u8bcd;\u8868\u660e,\u8bf4\u660e"

    aput-object v3, v0, v2

    const/16 v2, 0x14ac

    .line 5469
    const-string v3, "5293. harmony n.\u534f\u8c03,\u548c\u8c10;\u878d\u6d3d"

    aput-object v3, v0, v2

    const/16 v2, 0x14ad

    .line 5470
    const-string v3, "5294. irony n.\u53cd\u8bdd, \u8bbd\u523a, \u8bbd\u523a\u4e4b\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x14ae

    .line 5471
    const-string v3, "5295. boy n.\u7537\u5b69\u5b50\uff0c\u513f\u5b50\uff1b\u7537\u6027\u670d\u52a1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x14af

    .line 5472
    const-string v3, "5296. joy n.\u6b22\u4e50,\u559c\u60a6;\u4e50\u4e8b,\u4e50\u8da3"

    aput-object v3, v0, v2

    const/16 v2, 0x14b0

    .line 5473
    const-string v3, "5297. enjoy vt.\u4eab\u53d7\u2026\u7684\u4e50\u8da3\uff1b\u6b23\u8d4f\uff1b\u559c\u7231"

    aput-object v3, v0, v2

    const/16 v2, 0x14b1

    .line 5474
    const-string v3, "5298. alloy n.\u5408\u91d1vt.\u5c06\u2026\u94f8\u6210\u5408\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x14b2

    .line 5475
    const-string v3, "5299. employ n./v.\u96c7\u7528;\u7528,\u4f7f\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x14b3

    .line 5476
    const-string v3, "5300. annoy vt.\u4f7f\u607c\u6012\uff0c\u4f7f\u751f\u6c14\uff1b\u6253\u6270 vi.\u62db\u4eba\u8ba8\u538c"

    aput-object v3, v0, v2

    const/16 v2, 0x14b4

    .line 5477
    const-string v3, "5301. destroy v.\u7834\u574f,\u6467\u6bc1,\u6d88\u706d"

    aput-object v3, v0, v2

    const/16 v2, 0x14b5

    .line 5478
    const-string v3, "5302. toy n.\u73a9\u5177 vi.(with)\u6f2b\u4e0d\u7ecf\u5fc3\u5730\u8003\u8651\uff1b\u6446\u5f04"

    aput-object v3, v0, v2

    const/16 v2, 0x14b6

    .line 5479
    const-string v3, "5303. therapy n.\u6cbb\u7597\uff0c(\u4e0d\u9700\u8981\u836f\u7269\u6216\u624b\u672f\u7684)\u7269\u7406\u7597\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x14b7

    .line 5480
    const-string v3, "5304. copy n.\u6284\u672c\uff0c\u6479\u672c\uff1b(\u4e00)\u672c vt.\u6284\u5199\uff1b\u8003\u8bd5\u4e2d\u6284\u88ad"

    aput-object v3, v0, v2

    const/16 v2, 0x14b8

    .line 5481
    const-string v3, "5305. happy a.\u5feb\u4e50\u7684\uff0c\u5e78\u798f\u7684\uff1b\u4e50\u610f\u7684\uff1b\u4ee4\u4eba\u6ee1\u610f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14b9

    .line 5482
    const-string v3, "5306. spy n.\u95f4\u8c0d v.\u5f53\u95f4\u8c0d,\u523a\u63a2;\u5bdf\u89c9,\u53d1\u73b0"

    aput-object v3, v0, v2

    const/16 v2, 0x14ba

    .line 5483
    const-string v3, "5307. occupy v.\u5360,\u5360\u7528;\u5360\u636e,\u5360\u9886;\u4f7f\u5fd9\u788c,\u4f7f\u4ece\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x14bb

    .line 5484
    const-string v3, "5308. secondary a.\u6b21\u8981\u7684,\u4e8c\u7ea7\u7684;\u4e2d\u7ea7\u7684,\u7b2c\u4e8c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14bc

    .line 5485
    const-string v3, "5309. boundary n.\u5206\u754c\u7ebf,\u8fb9\u754c"

    aput-object v3, v0, v2

    const/16 v2, 0x14bd

    .line 5486
    const-string v3, "5310. weary a.\u75b2\u5026\u7684;\u4ee4\u4eba\u538c\u70e6\u7684 v.\u4f7f\u75b2\u5026,\u4f7f\u538c\u5026"

    aput-object v3, v0, v2

    const/16 v2, 0x14be

    .line 5487
    const-string v3, "5311. diary n.\u65e5\u8bb0,\u65e5\u8bb0\u7c3f"

    aput-object v3, v0, v2

    const/16 v2, 0x14bf

    .line 5488
    const-string v3, "5312. auxiliary a.\u8f85\u52a9\u7684\uff0c\u652f\u63f4\u7684 n.\u8f85\u52a9\u8005\uff0c\u8f85\u52a9\u8bbe\u5907"

    aput-object v3, v0, v2

    const/16 v2, 0x14c0

    .line 5489
    const-string v3, "5313. salary n.\u85aa\u91d1,\u85aa\u6c34"

    aput-object v3, v0, v2

    const/16 v2, 0x14c1

    .line 5490
    const-string v3, "5314. vocabulary n.\u8bcd\u6c47,\u8bcd\u6c47\u91cf;\u8bcd\u6c47\u8868"

    aput-object v3, v0, v2

    const/16 v2, 0x14c2

    .line 5491
    const-string v3, "5315. primary a.\u6700\u521d\u7684,\u521d\u7ea7\u7684;\u9996\u8981\u7684,\u4e3b\u8981\u7684,\u57fa\u672c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c3

    .line 5492
    const-string v3, "5316. summary n.\u6458\u8981,\u6982\u8981 a.\u6982\u62ec\u7684,\u7b80\u7565\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c4

    .line 5493
    const-string v3, "5317. customary a.\u4e60\u60ef\u7684,\u60ef\u4f8b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c5

    .line 5494
    const-string v3, "5318. ordinary a.\u666e\u901a\u7684,\u5e73\u51e1\u7684,\u5e73\u5e38\u7684;\u5e73\u5eb8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c6

    .line 5495
    const-string v3, "5319. extraordinary a.\u975e\u5e38\u7684;\u683c\u5916\u7684;\u610f\u5916\u7684;\u79bb\u5947\u7684;\u4e34\u65f6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c7

    .line 5496
    const-string v3, "5320. imaginary a.\u60f3\u8c61\u7684,\u865a\u6784\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c8

    .line 5497
    const-string v3, "5321. preliminary a.\u9884\u5907\u7684,\u521d\u6b65\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14c9

    .line 5498
    const-string v3, "5322. missionary a.\u6559\u4f1a\u7684\uff0c\u4f20\u6559(\u58eb)\u7684 n.\u4f20\u6559\u58eb"

    aput-object v3, v0, v2

    const/16 v2, 0x14ca

    .line 5499
    const-string v3, "5323. stationary a.\u9759\u6b62\u7684,\u56fa\u5b9a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14cb

    .line 5500
    const-string v3, "5324. dictionary n.\u8bcd\u5178,\u5b57\u5178"

    aput-object v3, v0, v2

    const/16 v2, 0x14cc

    .line 5501
    const-string v3, "5325. revolutionary a.\u9769\u547d\u7684,\u9769\u65b0\u7684 n.\u9769\u547d\u8005"

    aput-object v3, v0, v2

    const/16 v2, 0x14cd

    .line 5502
    const-string v3, "5326. library n.\u56fe\u4e66\u9986;\u85cf\u4e66\u5ba4;\u85cf\u4e66,\u4e1b\u4e66,\u6587\u5e93"

    aput-object v3, v0, v2

    const/16 v2, 0x14ce

    .line 5503
    const-string v3, "5327. literary a.\u6587\u5b66\u4e0a\u7684,\u6587\u5b66\u7684;\u7cbe\u901a\u6587\u5b66\u7684,\u4ece\u4e8b\u5199\u4f5c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14cf

    .line 5504
    const-string v3, "5328. temporary a.\u6682\u65f6\u7684,\u4e34\u65f6\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d0

    .line 5505
    const-string v3, "5329. contemporary a.\u73b0\u4ee3\u7684,\u5f53\u4ee3\u7684;\u540c\u65f6\u4ee3\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d1

    .line 5506
    const-string v3, "5330. arbitrary a.\u4efb\u610f\u7684\uff0c\u4efb\u6027\u7684\uff0c\u4e3b\u89c2\u7684\uff1b\u4e13\u65ad\u7684\uff0c\u6b66\u65ad\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d2

    .line 5507
    const-string v3, "5331. contrary a.(to)\u76f8\u53cd\u7684,\u77db\u76fe\u7684 n.\u53cd\u5bf9,\u77db\u76fe;\u76f8\u53cd"

    aput-object v3, v0, v2

    const/16 v2, 0x14d3

    .line 5508
    const-string v3, "5332. anniversary n.\u5468\u5e74\uff0c\u5468\u5e74\u7eaa\u5ff5\u65e5"

    aput-object v3, v0, v2

    const/16 v2, 0x14d4

    .line 5509
    const-string v3, "5333. necessary a.\u5fc5\u9700\u7684,\u5fc5\u8981\u7684;\u5fc5\u7136\u7684 n.\u5fc5\u9700\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x14d5

    .line 5510
    const-string v3, "5334. monetary a.\u91d1\u878d\u7684,\u8d27\u5e01\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d6

    .line 5511
    const-string v3, "5335. secretary n.\u79d8\u4e66,\u4e66\u8bb0;\u90e8\u957f,\u5927\u81e3"

    aput-object v3, v0, v2

    const/16 v2, 0x14d7

    .line 5512
    const-string v3, "5336. military a.\u519b\u4e8b\u7684,\u519b\u7528\u7684,\u519b\u961f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d8

    .line 5513
    const-string v3, "5337. solitary a.(\u597d)\u5b64\u72ec\u7684\uff1b\u504f\u50fb\u7684\uff1b\u5355\u4e00\u7684\uff0c\u552f\u4e00\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14d9

    .line 5514
    const-string v3, "5338. elementary a.\u521d\u6b65\u7684;\u57fa\u672c\u7684;[\u5316]\u5143\u7d20\u7684;\u81ea\u7136\u529b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14da

    .line 5515
    const-string v3, "5339. documentary a.\u6587\u732e\u7684 n.\u8bb0\u5f55\u7247"

    aput-object v3, v0, v2

    const/16 v2, 0x14db

    .line 5516
    const-string v3, "5340. voluntary a.\u81ea\u613f\u7684,\u5fd7\u613f\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14dc

    .line 5517
    const-string v3, "5341. rotary a.\u65cb\u8f6c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14dd

    .line 5518
    const-string v3, "5342. January n.\u4e00\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x14de

    .line 5519
    const-string v3, "5343. February n.\u4e8c\u6708"

    aput-object v3, v0, v2

    const/16 v2, 0x14df

    .line 5520
    const-string v3, "5344. vary vt.\u6539\u53d8,\u53d8\u5316;\u4f7f\u591a\u6837\u5316"

    aput-object v3, v0, v2

    const/16 v2, 0x14e0

    .line 5521
    const-string v3, "5345. cry n.&v.\u53eb\uff0c\u558a\uff0c\u54ed\uff1b(\u9e1f\u517d)\u53eb\uff0c\u557c\uff0c\u9e23\uff0c\u55e5"

    aput-object v3, v0, v2

    const/16 v2, 0x14e1

    .line 5522
    const-string v3, "5346. dry a.\u5e72(\u65f1)\u7684\uff1b\u5e72\u6e34\u7684\uff1b\u67af\u71e5 vt.\u4f7f\u5e72\u71e5\uff0c\u6652\u5e72"

    aput-object v3, v0, v2

    const/16 v2, 0x14e2

    .line 5523
    const-string v3, "5347. laundry n.\u6d17\u8863\u623f(\u5e97);\u5f85\u6d17\u8863\u7269,\u6240\u6d17\u8863\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x14e3

    .line 5524
    const-string v3, "5348. surgery n.\u5916\u79d1,\u5916\u79d1\u5b66;\u624b\u672f\u5ba4,\u8bca\u7597\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x14e4

    .line 5525
    const-string v3, "5349. gallery n.\u957f\u5eca,\u753b\u5eca,\u7f8e\u672f\u9986"

    aput-object v3, v0, v2

    const/16 v2, 0x14e5

    .line 5526
    const-string v3, "5350. scenery n.\u98ce\u666f,\u821e\u53f0\u5e03\u666f"

    aput-object v3, v0, v2

    const/16 v2, 0x14e6

    .line 5527
    const-string v3, "5351. machinery n.(\u603b\u79f0)\u673a\u5668,\u673a\u68b0"

    aput-object v3, v0, v2

    const/16 v2, 0x14e7

    .line 5528
    const-string v3, "5352. stationery n.\u6587\u5177"

    aput-object v3, v0, v2

    const/16 v2, 0x14e8

    .line 5529
    const-string v3, "5353. slippery a.\u6ed1\u7684,\u6ed1\u6e9c\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14e9

    .line 5530
    const-string v3, "5354. misery n.\u75db\u82e6,\u60b2\u60e8,\u4e0d\u5e78"

    aput-object v3, v0, v2

    const/16 v2, 0x14ea

    .line 5531
    const-string v3, "5355. nursery n.\u6258\u513f\u6240"

    aput-object v3, v0, v2

    const/16 v2, 0x14eb

    .line 5532
    const-string v3, "5356. cemetery n.\u575f\u5893\uff0c\u5893\u5730\uff0c\u575f\u573a"

    aput-object v3, v0, v2

    const/16 v2, 0x14ec

    .line 5533
    const-string v3, "5357. artery n.\u52a8\u8109\uff1b\u5e72\u7ebf\uff0c\u8981\u9053"

    aput-object v3, v0, v2

    const/16 v2, 0x14ed

    .line 5534
    const-string v3, "5358. mystery n.\u795e\u79d8,\u795e\u79d8\u7684\u4e8b\u7269;\u795e\u79d8\u5c0f\u8bf4,\u4fa6\u63a2\u5c0f\u8bf4"

    aput-object v3, v0, v2

    const/16 v2, 0x14ee

    .line 5535
    const-string v3, "5359. battery n.\u7535\u6c60(\u7ec4)\uff1b(\u5668\u5177\u7b49\u7684)\u4e00\u7ec4\uff0c\u4e00\u5957\uff1b\u70ae\u5175\u8fde"

    aput-object v3, v0, v2

    const/16 v2, 0x14ef

    .line 5536
    const-string v3, "5360. lottery n.\u62bd\u5f69\uff1b\u78b0\u8fd0\u6c14\u7684\u4e8b\uff0c\u96be\u4e8e\u7b97\u8ba1\u7684\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x14f0

    .line 5537
    const-string v3, "5361. very ad.\u5f88\uff0c\u975e\u5e38\uff1b\u5b8c\u5168 a.\u6b63\u662f\u7684\uff1b\u771f\u6b63\uff0c\u771f\u5b9e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14f1

    .line 5538
    const-string v3, "5362. every a.\u6bcf\u4e00\u4e2a\u7684\uff0c\u6bcf\u4e2a\u7684\uff1b\u6bcf\u9694\u2026\u7684\uff1b\u5168\u90e8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14f2

    .line 5539
    const-string v3, "5363. delivery n.\u9012\u9001;\u4ea4\u4ed8;\u5206\u5a29;\u4ea4\u8d27;\u5f15\u6e21"

    aput-object v3, v0, v2

    const/16 v2, 0x14f3

    .line 5540
    const-string v3, "5364. recovery n.\u75ca\u6108,\u590d\u5143;\u91cd\u83b7,\u6062\u590d"

    aput-object v3, v0, v2

    const/16 v2, 0x14f4

    .line 5541
    const-string v3, "5365. discovery n.\u53d1\u73b0;\u88ab\u53d1\u73b0\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x14f5

    .line 5542
    const-string v3, "5366. fry v.\u6cb9\u714e,\u6cb9\u70b8"

    aput-object v3, v0, v2

    const/16 v2, 0x14f6

    .line 5543
    const-string v3, "5367. angry a.\u751f\u6c14\u7684\uff0c\u6124\u6012\u7684\uff1b(\u5929\u6c14)\u98ce\u96e8\u4ea4\u52a0\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14f7

    .line 5544
    const-string v3, "5368. hungry a.\u9965\u997f\u7684,\u6e34\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x14f8

    .line 5545
    const-string v3, "5369. dairy n.\u725b\u5976\u573a,\u5976\u5e97"

    aput-object v3, v0, v2

    const/16 v2, 0x14f9

    .line 5546
    const-string v3, "5370. fairy a.\u5e7b\u60f3\u4e2d\u7684;\u865a\u6784\u7684;\u4f18\u96c5\u7684 n.\u4ed9\u5973;\u7cbe\u7075"

    aput-object v3, v0, v2

    const/16 v2, 0x14fa

    .line 5547
    const-string v3, "5371. inquiry n.(enquiry)\u8be2\u95ee,\u6253\u542c,\u8c03\u67e5"

    aput-object v3, v0, v2

    const/16 v2, 0x14fb

    .line 5548
    const-string v3, "5372. jewelry n.(jewllery)(\u603b\u79f0)\u73e0\u5b9d"

    aput-object v3, v0, v2

    const/16 v2, 0x14fc

    .line 5549
    const-string v3, "5373. theory n.\u7406\u8bba,\u539f\u7406;\u5b66\u8bf4,\u89c1\u89e3,\u770b\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x14fd

    .line 5550
    const-string v3, "5374. category n.\u79cd\u7c7b\uff0c\u90e8\u5c5e\uff0c\u7c7b\u76ee\uff1b\u8303\u7574\uff0c\u7c7b\u578b"

    aput-object v3, v0, v2

    const/16 v2, 0x14fe

    .line 5551
    const-string v3, "5375. glory n.\u5149\u8363,\u8363\u8a89"

    aput-object v3, v0, v2

    const/16 v2, 0x14ff

    .line 5552
    const-string v3, "5376. memory n.\u8bb0\u5fc6,\u8bb0\u5fc6\u529b;\u56de\u5fc6;\u5b58\u50a8(\u5668)"

    aput-object v3, v0, v2

    const/16 v2, 0x1500

    .line 5553
    const-string v3, "5377. compulsory a.\u5fc5\u987b\u505a\u7684\uff0c\u5f3a\u5236\u6027\u7684\uff0c(\u8bfe\u7a0b)\u5fc5\u4fee\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1501

    .line 5554
    const-string v3, "5378. accessory n.\u9644\u4ef6,\u9644\u5c5e\u54c1;(\u4e3a\u5168\u5957\u8863\u670d\u589e\u52a0\u7f8e\u611f\u7684)\u670d\u9970"

    aput-object v3, v0, v2

    const/16 v2, 0x1502

    .line 5555
    const-string v3, "5379. lavatory n.\u5395\u6240,\u76e5\u6d17\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x1503

    .line 5556
    const-string v3, "5380. factory n.\u5de5\u5382"

    aput-object v3, v0, v2

    const/16 v2, 0x1504

    .line 5557
    const-string v3, "5381. satisfactory a.\u4ee4\u4eba\u6ee1\u610f\u7684,\u5706\u6ee1\u7684,\u826f\u597d\u7684,\u7b26\u5408\u8981\u6c42\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1505

    .line 5558
    const-string v3, "5382. directory n.\u4eba\u540d\u5730\u5740\u5f55,(\u7535\u8bdd)\u53f7\u7801\u7c3f"

    aput-object v3, v0, v2

    const/16 v2, 0x1506

    .line 5559
    const-string v3, "5383. victory n.\u80dc\u5229"

    aput-object v3, v0, v2

    const/16 v2, 0x1507

    .line 5560
    const-string v3, "5384. territory n.\u9886\u571f;\u7248\u56fe;\u9886\u57df,\u8303\u56f4"

    aput-object v3, v0, v2

    const/16 v2, 0x1508

    .line 5561
    const-string v3, "5385. inventory n.\u8be6\u7ec6\u76ee\u5f55,\u5b58\u8d27,\u8d22\u4ea7\u6e05\u518c,\u603b\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1509

    .line 5562
    const-string v3, "5386. story n.\u6545\u4e8b,\u4f20\u8bf4,\u5c0f\u8bf4;(=storey)\u697c\u5c42"

    aput-object v3, v0, v2

    const/16 v2, 0x150a

    .line 5563
    const-string v3, "5387. history n.\u5386\u53f2,\u5386\u53f2\u5b66;\u6765\u5386,\u7ecf\u5386"

    aput-object v3, v0, v2

    const/16 v2, 0x150b

    .line 5564
    const-string v3, "5388. carry v.\u8fd0\u9001,\u642c\u8fd0;\u4f20\u9001,\u4f20\u64ad;\u9886,\u5e26"

    aput-object v3, v0, v2

    const/16 v2, 0x150c

    .line 5565
    const-string v3, "5389. marry v.\u7ed3\u5a5a,\u5ac1,\u5a36"

    aput-object v3, v0, v2

    const/16 v2, 0x150d

    .line 5566
    const-string v3, "5390. strawberry n.\u8349\u8393"

    aput-object v3, v0, v2

    const/16 v2, 0x150e

    .line 5567
    const-string v3, "5391. ferry n.\u6446\u6e21;\u6e21\u8239;\u6e21\u53e3v.\u6446\u6e21;\u6e21\u8fd0(\u4eba,\u8f66\u6216\u7269\u7b49)"

    aput-object v3, v0, v2

    const/16 v2, 0x150f

    .line 5568
    const-string v3, "5392. cherry n.\u6a31\u6843(\u6811)"

    aput-object v3, v0, v2

    const/16 v2, 0x1510

    .line 5569
    const-string v3, "5393. merry a.\u6b22\u4e50\u7684,\u6109\u5feb\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1511

    .line 5570
    const-string v3, "5394. lorry n.\u5361\u8f66,\u8fd0\u8d27\u6c7d\u8f66"

    aput-object v3, v0, v2

    const/16 v2, 0x1512

    .line 5571
    const-string v3, "5395. sorry a.\u5bf9\u4e0d\u8d77\uff0c\u62b1\u6b49\u7684\uff1b\u96be\u8fc7\uff0c\u6094\u6068\u7684\uff1b\u4f7f\u4eba\u4f24\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x1513

    .line 5572
    const-string v3, "5396. worry v.\u70e6\u607c;(about)\u5bf9\u2026\u611f\u5230\u70e6\u607c n.\u70e6\u607c,\u7126\u8651"

    aput-object v3, v0, v2

    const/16 v2, 0x1514

    .line 5573
    const-string v3, "5397. hurry vi.\u5306\u5fd9 vt.\u50ac\u4fc3;\u6025\u8fd0(\u6d3e) n.\u6025(\u5306)\u5fd9"

    aput-object v3, v0, v2

    const/16 v2, 0x1515

    .line 5574
    const-string v3, "5398. try v.\u5c1d\u8bd5\uff0c\u8bd5\u56fe\uff1b\u8bd5\u9a8c\uff0c\u8bd5\u7528\uff1b\u5ba1\u8baf n.\u5c1d\u8bd5"

    aput-object v3, v0, v2

    const/16 v2, 0x1516

    .line 5575
    const-string v3, "5399. psychiatry n.\u7cbe\u795e\u75c5\u5b66\uff0c\u7cbe\u795e\u75c5\u7597\u6cd5"

    aput-object v3, v0, v2

    const/16 v2, 0x1517

    .line 5576
    const-string v3, "5400. symmetry n.\u5bf9\u79f0(\u6027);\u5300\u79f0,\u6574\u9f50"

    aput-object v3, v0, v2

    const/16 v2, 0x1518

    .line 5577
    const-string v3, "5401. geometry n.\u51e0\u4f55(\u5b66)"

    aput-object v3, v0, v2

    const/16 v2, 0x1519

    .line 5578
    const-string v3, "5402. poetry n.\u8bd7\u6b4c,\u8bd7\u96c6"

    aput-object v3, v0, v2

    const/16 v2, 0x151a

    .line 5579
    const-string v3, "5403. poultry n.\u5bb6\u79bd"

    aput-object v3, v0, v2

    const/16 v2, 0x151b

    .line 5580
    const-string v3, "5404. entry n.\u8fdb\u5165,\u5165\u53e3;\u901a\u9053;\u8bb0\u8f7d,\u6761\u76ee"

    aput-object v3, v0, v2

    const/16 v2, 0x151c

    .line 5581
    const-string v3, "5405. country n.\u56fd\u5bb6;\u519c\u6751,\u4e61\u4e0b"

    aput-object v3, v0, v2

    const/16 v2, 0x151d

    .line 5582
    const-string v3, "5406. chemistry n.\u5316\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x151e

    .line 5583
    const-string v3, "5407. ministry n.(\u653f\u5e9c\u7684)\u90e8;\u7267\u5e08"

    aput-object v3, v0, v2

    const/16 v2, 0x151f

    .line 5584
    const-string v3, "5408. industry n.\u5de5\u4e1a,\u4ea7\u4e1a;\u52e4\u52b3,\u52e4\u594b"

    aput-object v3, v0, v2

    const/16 v2, 0x1520

    .line 5585
    const-string v3, "5409. bury v.\u57cb(\u846c),\u5b89\u846c;\u57cb\u85cf,\u906e\u76d6"

    aput-object v3, v0, v2

    const/16 v2, 0x1521

    .line 5586
    const-string v3, "5410. mercury n.\u6c34\u94f6,\u6c5e"

    aput-object v3, v0, v2

    const/16 v2, 0x1522

    .line 5587
    const-string v3, "5411. jury n.\u966a\u5ba1\u56e2;\u5168\u4f53\u8bc4\u5ba1\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x1523

    .line 5588
    const-string v3, "5412. injury n.\u4f24\u5bb3\uff0c\u635f\u5bb3"

    aput-object v3, v0, v2

    const/16 v2, 0x1524

    .line 5589
    const-string v3, "5413. century n.\u4e16\u7eaa,(\u4e00)\u767e\u5e74"

    aput-object v3, v0, v2

    const/16 v2, 0x1525

    .line 5590
    const-string v3, "5414. luxury n.\u5962\u4f88,\u534e\u8d35;\u5962\u4f88\u54c1 a.\u5962\u534e\u7684,\u8c6a\u534e\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1526

    .line 5591
    const-string v3, "5415. easy a.\u5bb9\u6613\u7684\uff0c\u4e0d\u8d39\u529b\u7684\uff0c\u5b89\u9038\u7684\uff0c\u5bbd\u88d5\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1527

    .line 5592
    const-string v3, "5416. uneasy a.\u4e0d\u5b89\u7684,\u7126\u8651\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1528

    .line 5593
    const-string v3, "5417. fantasy n.\u5e7b\u60f3\uff0c\u7a7a\u60f3\uff1b\u7a7a\u60f3\u7684\u4ea7\u7269\uff0c\u5e7b\u60f3\u4f5c\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x1529

    .line 5594
    const-string v3, "5418. courtesy n.\u8c26\u606d\u6709\u793c;\u6709\u793c\u8c8c\u7684\u4e3e\u6b62(\u6216\u8a00\u8bcd)"

    aput-object v3, v0, v2

    const/16 v2, 0x152a

    .line 5595
    const-string v3, "5419. noisy a.\u5435\u95f9\u7684,\u55a7\u95f9\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x152b

    .line 5596
    const-string v3, "5420. hypocrisy n.\u4f2a\u5584\uff0c\u865a\u4f2a"

    aput-object v3, v0, v2

    const/16 v2, 0x152c

    .line 5597
    const-string v3, "5421. clumsy a.\u7b28\u62d9\u7684,\u611a\u7b28\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x152d

    .line 5598
    const-string v3, "5422. cosy a.\u6696\u548c\u8212\u670d\u7684\uff1b\u8212\u9002\u7684 [\u53cd]uncomfortable"

    aput-object v3, v0, v2

    const/16 v2, 0x152e

    .line 5599
    const-string v3, "5423. controversy n.\u4e89\u8bba\uff0c\u8fa9\u8bba\uff0c\u4e89\u5435"

    aput-object v3, v0, v2

    const/16 v2, 0x152f

    .line 5600
    const-string v3, "5424. embassy n.\u5927\u4f7f\u9986;\u5927\u4f7f\u53ca\u5176\u968f\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x1530

    .line 5601
    const-string v3, "5425. busy a.\u5fd9\uff0c\u5fd9\u788c\u7684\uff1b\u70ed\u95f9\u7684\uff0c\u7e41\u5fd9\u7684\uff1b(\u7535\u8bdd)\u5360\u7ebf"

    aput-object v3, v0, v2

    const/16 v2, 0x1531

    .line 5602
    const-string v3, "5426. treaty n.\u6761\u7ea6\uff0c\u534f\u8bae\uff0c\u534f\u5546"

    aput-object v3, v0, v2

    const/16 v2, 0x1532

    .line 5603
    const-string v3, "5427. safety n.\u5b89\u5168,\u4fdd\u9669;\u5b89\u5168\u8bbe\u5907,\u4fdd\u9669\u88c5\u7f6e"

    aput-object v3, v0, v2

    const/16 v2, 0x1533

    .line 5604
    const-string v3, "5428. society n.\u793e\u4f1a;\u793e\u56e2,\u534f\u4f1a,\u793e;\u793e\u4ea4\u754c,\u4e0a\u6d41\u793e\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x1534

    .line 5605
    const-string v3, "5429. variety n.\u79cd\u79cd,\u591a\u79cd\u591a\u6837;\u79cd\u7c7b,\u54c1\u79cd"

    aput-object v3, v0, v2

    const/16 v2, 0x1535

    .line 5606
    const-string v3, "5430. anxiety n.\u6302\u5ff5\uff0c\u7126\u8651\uff0c\u7126\u6025\uff0c\u5fe7\u8651\uff1b\u6e34\u671b\uff0c\u70ed\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x1536

    .line 5607
    const-string v3, "5431. ninety num.\u4e5d\u5341\uff0c\u4e5d\u5341\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0x1537

    .line 5608
    const-string v3, "5432. fifty num.\u4e94\u5341\uff0c\u4e94\u5341\u4e2a"

    aput-object v3, v0, v2

    const/16 v2, 0x1538

    .line 5609
    const-string v3, "5433. lofty a.\u5d07\u9ad8\u7684\uff0c\u9ad8\u5c1a\u7684\uff1b\u9ad8\u50b2\u7684\uff1b\u6781\u9ad8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1539

    .line 5610
    const-string v3, "5434. eighty num./a.\u516b\u5341 pron.\u516b\u5341(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x153a

    .line 5611
    const-string v3, "5435. naughty a.\u987d\u76ae\u7684,\u6dd8\u6c14\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x153b

    .line 5612
    const-string v3, "5436. city n\uff0e\u57ce\u5e02\uff1b\u90fd\u5e02\uff1b\u5e02"

    aput-object v3, v0, v2

    const/16 v2, 0x153c

    .line 5613
    const-string v3, "5437. capacity n.\u5bb9\u91cf,\u5bb9\u79ef;\u80fd\u91cf,\u80fd\u529b;\u63a5\u53d7\u529b"

    aput-object v3, v0, v2

    const/16 v2, 0x153d

    .line 5614
    const-string v3, "5438. publicity n.\u516c\u5f00,\u5ba3\u4f20,\u5e7f\u544a,\u63a8\u9500"

    aput-object v3, v0, v2

    const/16 v2, 0x153e

    .line 5615
    const-string v3, "5439. simplicity n.\u7b80\u5355,\u7b80\u6613;\u6734\u7d20;\u76f4\u7387,\u5355\u7eaf"

    aput-object v3, v0, v2

    const/16 v2, 0x153f

    .line 5616
    const-string v3, "5440. electricity n.\u7535,\u7535\u6d41;\u7535\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1540

    .line 5617
    const-string v3, "5441. velocity n.\u901f\u5ea6,\u901f\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x1541

    .line 5618
    const-string v3, "5442. humidity n.\u6e7f\u6c14,\u6e7f\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x1542

    .line 5619
    const-string v3, "5443. commodity n.(pl.)\u65e5\u7528\u54c1\uff1b\u5546\u54c1\uff1b\u519c/\u77ff\u4ea7\u54c1\uff1b\u6709\u7528\u4e4b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1543

    .line 5620
    const-string v3, "5444. locality n.\u4f4d\u7f6e,\u5730\u70b9"

    aput-object v3, v0, v2

    const/16 v2, 0x1544

    .line 5621
    const-string v3, "5445. reality n.\u73b0\u5b9e,\u5b9e\u9645;\u771f\u5b9e"

    aput-object v3, v0, v2

    const/16 v2, 0x1545

    .line 5622
    const-string v3, "5446. speciality n.(specialty)\u7279\u6027\uff0c\u6027\u8d28\uff1b\u4e13\u4e1a/\u957f\uff1b\u7279\u4ea7"

    aput-object v3, v0, v2

    const/16 v2, 0x1546

    .line 5623
    const-string v3, "5447. nationality n.\u56fd\u7c4d,\u6c11\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1547

    .line 5624
    const-string v3, "5448. personality n.\u4eba\u683c,\u4e2a\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x1548

    .line 5625
    const-string v3, "5449. morality n.\u9053\u5fb7,\u7f8e\u5fb7"

    aput-object v3, v0, v2

    const/16 v2, 0x1549

    .line 5626
    const-string v3, "5450. hospitality n.\u597d\u5ba2,\u6bb7\u52e4,\u6b3e\u5f85"

    aput-object v3, v0, v2

    const/16 v2, 0x154a

    .line 5627
    const-string v3, "5451. quality n.\u8d28\u91cf,\u54c1\u8d28,\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x154b

    .line 5628
    const-string v3, "5452. equality n.\u540c\u7b49;\u5e73\u7b49;\u76f8\u7b49;\u7b49\u5f0f;\u7b49\u540c\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x154c

    .line 5629
    const-string v3, "5453. ability n.\u80fd\u529b\uff1b\u672c\u9886\uff1b\u624d\u80fd\uff0c\u624d\u5e72\uff1b\u4e13\u95e8\u6280\u80fd\uff0c\u5929\u8d44"

    aput-object v3, v0, v2

    const/16 v2, 0x154d

    .line 5630
    const-string v3, "5454. probability n.\u53ef\u80fd\u6027,\u6216\u7136\u6027,\u6982\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x154e

    .line 5631
    const-string v3, "5455. liability n.\u8d23\u4efb,\u4e49\u52a1;(pl.)\u503a\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0x154f

    .line 5632
    const-string v3, "5456. stability n.\u7a33\u5b9a,\u5b89\u5b9a"

    aput-object v3, v0, v2

    const/16 v2, 0x1550

    .line 5633
    const-string v3, "5457. responsibility n.\u8d23\u4efb,\u8d23\u4efb\u5fc3;\u804c\u8d23,\u4efb\u52a1"

    aput-object v3, v0, v2

    const/16 v2, 0x1551

    .line 5634
    const-string v3, "5458. possibility n.\u53ef\u80fd,\u53ef\u80fd\u6027;\u53ef\u80fd\u7684\u4e8b,\u5e0c\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x1552

    .line 5635
    const-string v3, "5459. facility n.\u7075\u5de7,\u719f\u7ec3;(pl.)\u8bbe\u5907,\u8bbe\u65bd,\u4fbf\u5229\u6761\u4ef6"

    aput-object v3, v0, v2

    const/16 v2, 0x1553

    .line 5636
    const-string v3, "5460. humanity n.\u4eba\u7c7b,\u4eba\u6027,\u4eba\u60c5;(pl.)\u4eba\u6587\u79d1\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x1554

    .line 5637
    const-string v3, "5461. vanity n.\u865a\u8363\u5fc3,\u6d6e\u534e"

    aput-object v3, v0, v2

    const/16 v2, 0x1555

    .line 5638
    const-string v3, "5462. dignity n.(\u4e3e\u6b62,\u6001\u5ea6\u7b49\u7684)\u5e84\u4e25,\u7aef\u5e84;\u5c0a\u8d35,\u9ad8\u8d35"

    aput-object v3, v0, v2

    const/16 v2, 0x1556

    .line 5639
    const-string v3, "5463. vicinity n.\u90bb\u8fd1,\u9644\u8fd1"

    aput-object v3, v0, v2

    const/16 v2, 0x1557

    .line 5640
    const-string v3, "5464. unity n.\u56e2\u7ed3;\u7edf\u4e00,\u4e00\u81f4,\u6574\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x1558

    .line 5641
    const-string v3, "5465. community n.\u540c\u4e00\u5730\u533a\u7684\u5168\u4f53\u5c45\u6c11,\u793e\u4f1a,\u793e\u533a;\u5171\u540c\u4f53"

    aput-object v3, v0, v2

    const/16 v2, 0x1559

    .line 5642
    const-string v3, "5466. opportunity n.\u673a\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x155a

    .line 5643
    const-string v3, "5467. pity v.(\u89c9\u5f97)\u53ef\u601c,\u60cb\u60dc n.\u61be\u4e8b,\u601c\u60af"

    aput-object v3, v0, v2

    const/16 v2, 0x155b

    .line 5644
    const-string v3, "5468. solidarity n.\u56e2\u7ed3\uff1b\u4f11\u621a\u76f8\u5173"

    aput-object v3, v0, v2

    const/16 v2, 0x155c

    .line 5645
    const-string v3, "5469. charity n.\u6148\u5584(\u56e2\u4f53),\u4ec1\u6148,\u65bd\u820d"

    aput-object v3, v0, v2

    const/16 v2, 0x155d

    .line 5646
    const-string v3, "5470. clarity n.\u6e05\u6670,\u660e\u6670"

    aput-object v3, v0, v2

    const/16 v2, 0x155e

    .line 5647
    const-string v3, "5471. celebrity n.\u540d\u4eba\uff0c\u540d\u6d41\uff1b\u8457\u540d\uff0c\u540d\u58f0\uff0c\u540d\u671b"

    aput-object v3, v0, v2

    const/16 v2, 0x155f

    .line 5648
    const-string v3, "5472. prosperity n.\u7e41\u8363,\u5174\u65fa"

    aput-object v3, v0, v2

    const/16 v2, 0x1560

    .line 5649
    const-string v3, "5473. integrity n.\u6b63\u76f4,\u8bda\u5b9e;\u5b8c\u6574,\u5b8c\u5168"

    aput-object v3, v0, v2

    const/16 v2, 0x1561

    .line 5650
    const-string v3, "5474. authority n.\u6743\u529b\uff0c\u6743\u5a01\uff1b\u6743\u5a01\u4eba\u58eb\uff1b(pl.)\u5b98\u65b9\uff0c\u5f53\u5c40"

    aput-object v3, v0, v2

    const/16 v2, 0x1562

    .line 5651
    const-string v3, "5475. superiority n.\u4f18\u8d8a(\u6027)\uff0c\u4f18\u52bf\uff0c\u4f18\u7b49\uff1b\u9ad8\u50b2\uff0c\u50b2\u6162"

    aput-object v3, v0, v2

    const/16 v2, 0x1563

    .line 5652
    const-string v3, "5476. priority n.\u5148,\u524d;\u4f18\u5148,\u91cd\u70b9,\u4f18\u5148\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x1564

    .line 5653
    const-string v3, "5477. majority n.\u591a\u6570,\u5927\u591a\u6570,\u6210\u5e74,\u6cd5\u5b9a\u5e74\u9f84"

    aput-object v3, v0, v2

    const/16 v2, 0x1565

    .line 5654
    const-string v3, "5478. minority n.\u5c11\u6570,\u5c11\u6570\u6d3e,\u5c11\u6570\u6c11\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1566

    .line 5655
    const-string v3, "5479. security n.\u5b89\u5168(\u611f),\u9632\u5fa1(\u7269),\u4fdd\u8bc1(\u4eba),(pl.)\u8bc1\u5238"

    aput-object v3, v0, v2

    const/16 v2, 0x1567

    .line 5656
    const-string v3, "5480. density n.\u5bc6\u96c6,\u5bc6\u5ea6,\u6d53\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x1568

    .line 5657
    const-string v3, "5481. intensity n.\u5f3a\u70c8,\u5267\u70c8;\u5f3a\u5ea6"

    aput-object v3, v0, v2

    const/16 v2, 0x1569

    .line 5658
    const-string v3, "5482. curiosity n.\u597d\u5947\u5fc3;\u53e4\u8463,\u53e4\u73a9"

    aput-object v3, v0, v2

    const/16 v2, 0x156a

    .line 5659
    const-string v3, "5483. university n.(\u7efc\u5408)\u5927\u5b66"

    aput-object v3, v0, v2

    const/16 v2, 0x156b

    .line 5660
    const-string v3, "5484. necessity n.\u5fc5\u8981\u6027,\u9700\u8981;\u5fc5\u7136\u6027;(pl.)\u5fc5\u9700\u54c1"

    aput-object v3, v0, v2

    const/16 v2, 0x156c

    .line 5661
    const-string v3, "5485. quantity n.\u91cf,\u6570\u91cf;\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x156d

    .line 5662
    const-string v3, "5486. entity n.\u5b9e\u4f53;\u5b58\u5728(\u7269);\u7ec4\u7ec7,\u673a\u6784;\u672c\u8d28"

    aput-object v3, v0, v2

    const/16 v2, 0x156e

    .line 5663
    const-string v3, "5487. identity n.\u8eab\u4efd;\u672c\u4f53;\u7279\u5f81;\u540c\u4e00(\u6027);\u4e00\u81f4;\u56fd\u7c4d;\u7b49\u5f0f"

    aput-object v3, v0, v2

    const/16 v2, 0x156f

    .line 5664
    const-string v3, "5488. gravity n.\u91cd\u529b,\u5f15\u529b;\u4e25\u8083,\u5e84\u91cd"

    aput-object v3, v0, v2

    const/16 v2, 0x1570

    .line 5665
    const-string v3, "5489. relativity n.\u76f8\u5173(\u6027);\u76f8\u5bf9\u8bba"

    aput-object v3, v0, v2

    const/16 v2, 0x1571

    .line 5666
    const-string v3, "5490. activity n.\u6d3b\u52a8\uff1b\u6d3b\u529b\uff1b\u80fd\u52a8\u6027\uff1b"

    aput-object v3, v0, v2

    const/16 v2, 0x1572

    .line 5667
    const-string v3, "5491. productivity n.\u751f\u4ea7\u7387"

    aput-object v3, v0, v2

    const/16 v2, 0x1573

    .line 5668
    const-string v3, "5492. penalty n.\u5904\u7f5a,\u5211\u7f5a,\u60e9\u7f5a,\u7f5a\u91d1"

    aput-object v3, v0, v2

    const/16 v2, 0x1574

    .line 5669
    const-string v3, "5493. casualty n.\u4f24\u4ea1\u4eba\u5458\uff1b\u53d7\u5bb3\u4eba\uff1b\u635f\u5931\u7684\u4e1c\u897f\uff1b\u6025\u8bca\u5ba4"

    aput-object v3, v0, v2

    const/16 v2, 0x1575

    .line 5670
    const-string v3, "5494. loyalty n.\u5fe0\u8bda,\u5fe0\u5fc3"

    aput-object v3, v0, v2

    const/16 v2, 0x1576

    .line 5671
    const-string v3, "5495. royalty n.\u7687\u5bb6,\u7687\u65cf"

    aput-object v3, v0, v2

    const/16 v2, 0x1577

    .line 5672
    const-string v3, "5496. novelty n.\u65b0\u5947,\u65b0\u9896,\u65b0\u5947\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1578

    .line 5673
    const-string v3, "5497. guilty a.(of)\u6709\u7f6a\u7684,\u5185\u759a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1579

    .line 5674
    const-string v3, "5498. faulty a.\u6709\u9519\u8bef\u7684\uff0c\u6709\u7f3a\u70b9\u7684\uff0c\u4e0d\u5b8c\u5584\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x157a

    .line 5675
    const-string v3, "5499. faculty n.\u624d\u80fd;\u5b66\u9662,\u7cfb;(\u5b66\u9662\u6216\u7cfb\u7684)\u5168\u4f53\u6559\u5b66\u4eba\u5458"

    aput-object v3, v0, v2

    const/16 v2, 0x157b

    .line 5676
    const-string v3, "5500. difficulty n.\u56f0\u96be,\u56f0\u5883,\u96be\u9898"

    aput-object v3, v0, v2

    const/16 v2, 0x157c

    .line 5677
    const-string v3, "5501. plenty n.\u4e30\u5bcc,\u5927\u91cf"

    aput-object v3, v0, v2

    const/16 v2, 0x157d

    .line 5678
    const-string v3, "5502. twenty num.\u4e8c\u5341 pron./a.\u4e8c\u5341(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x157e

    .line 5679
    const-string v3, "5503. certainty n.\u5fc5\u7136,\u80af\u5b9a;\u5fc5\u7136\u7684\u4e8b"

    aput-object v3, v0, v2

    const/16 v2, 0x157f

    .line 5680
    const-string v3, "5504. county n.(\u82f1\u56fd)\u90e1,(\u7f8e\u56fd)\u53bf"

    aput-object v3, v0, v2

    const/16 v2, 0x1580

    .line 5681
    const-string v3, "5505. empty a.\u7a7a\u7684;\u7a7a\u6d1e\u7684 v.\u5012\u7a7a,\u4f7f\u6210\u4e3a\u7a7a\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1581

    .line 5682
    const-string v3, "5506. party n.\u805a\u4f1a,\u653f\u515a,\u5f53\u4e8b\u4eba v.\u4e3e\u884c(\u53c2\u52a0)\u793e\u4ea4\u805a\u4f1a"

    aput-object v3, v0, v2

    const/16 v2, 0x1582

    .line 5683
    const-string v3, "5507. liberty n.\u81ea\u7531\uff0c\u81ea\u7531\u6743\uff1b\u7279\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x1583

    .line 5684
    const-string v3, "5508. property n.\u8d22\u4ea7,\u8d44\u4ea7,\u5730\u4ea7,\u623f\u5730\u4ea7,\u6240\u6709\u7269;\u6027\u8d28,\u7279\u6027"

    aput-object v3, v0, v2

    const/16 v2, 0x1584

    .line 5685
    const-string v3, "5509. poverty n.\u8d2b\u7a77,\u8d2b\u56f0"

    aput-object v3, v0, v2

    const/16 v2, 0x1585

    .line 5686
    const-string v3, "5510. dirty a.\u5f04\u810f\u7684;\u4e0b\u6d41\u7684 v.\u5f04\u810f,\u73b7\u6c61"

    aput-object v3, v0, v2

    const/16 v2, 0x1586

    .line 5687
    const-string v3, "5511. thirty num.\u4e09\u5341\uff0c\u4e09\u5341\u4e2a(\u4eba\u6216\u7269)"

    aput-object v3, v0, v2

    const/16 v2, 0x1587

    .line 5688
    const-string v3, "5512. forty num./a.\u56db\u5341 pron.\u56db\u5341(\u4e2a\uff0c\u53ea...)"

    aput-object v3, v0, v2

    const/16 v2, 0x1588

    .line 5689
    const-string v3, "5513. hasty a.\u5306\u5fd9\u7684,\u4ed3\u4fc3\u7684;\u8349\u7387\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1589

    .line 5690
    const-string v3, "5514. nasty a.\u80ae\u810f\u7684,\u5351\u52a3\u7684,\u4e0b\u6d41\u7684;\u4ee4\u4eba\u538c\u6076\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x158a

    .line 5691
    const-string v3, "5515. dynasty n.\u738b\u671d,\u671d\u4ee3"

    aput-object v3, v0, v2

    const/16 v2, 0x158b

    .line 5692
    const-string v3, "5516. majesty n.\u96c4\u4f1f,\u58ee\u4e3d,\u5e84\u4e25,\u5a01\u4e25;\u6700\u9ad8\u6743\u5a01,\u738b\u6743"

    aput-object v3, v0, v2

    const/16 v2, 0x158c

    .line 5693
    const-string v3, "5517. thirsty a.\u53e3\u6e34\u7684;(for)\u6e34\u671b\u7684,\u70ed\u671b\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x158d

    .line 5694
    const-string v3, "5518. petty a.\u5c0f(\u5668\u3001\u89c4\u6a21)\u7684,\u4e0d\u91cd\u8981\u7684,\u7ec6\u5fae\u7684,\u5351\u9119\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x158e

    .line 5695
    const-string v3, "5519. pretty ad.\u76f8\u5f53\uff0c\u5f88a.\u6f02\u4eae\u7684\uff0c\u4fca\u4fcf\u7684\uff0c\u6807\u81f4\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x158f

    .line 5696
    const-string v3, "5520. beauty n.\u7f8e\uff0c\u7f8e\u4e3d\uff1b\u7f8e\u4eba\uff0c\u7f8e\u4e3d\u7684\u4e8b\u7269"

    aput-object v3, v0, v2

    const/16 v2, 0x1590

    .line 5697
    const-string v3, "5521. duty n.\u4e49\u52a1,\u8d23\u4efb;\u804c\u52a1;\u7a0e"

    aput-object v3, v0, v2

    const/16 v2, 0x1591

    .line 5698
    const-string v3, "5522. deputy n.\u4ee3\u7406\u4eba,\u4ee3\u8868 a.\u526f\u7684,\u4ee3\u7406\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1592

    .line 5699
    const-string v3, "5523. buy vt.\u4e70\uff0c\u4e70\u5f97\uff1b\u5411\u2026\u884c\u8d3f\uff0c\u6536\u4e70vi.\u8d2d\u4e70\u4e1c\u897f"

    aput-object v3, v0, v2

    const/16 v2, 0x1593

    .line 5700
    const-string v3, "5524. guy n.\u5bb6\u4f19, \u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x1594

    .line 5701
    const-string v3, "5525. heavy a.\u91cd\u7684,\u91cd\u578b\u7684;\u6c89\u91cd\u7684,\u5927\u91cf\u7684,\u731b\u70c8\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x1595

    .line 5702
    const-string v3, "5526. navy n.\u6d77\u519b"

    aput-object v3, v0, v2

    const/16 v2, 0x1596

    .line 5703
    const-string v3, "5527. levy n.\u5f81\u6536,\u5f81\u7a0e,\u5f81\u5175 v.\u5f81\u6536,\u5f81\u96c6,\u5f81\u7528"

    aput-object v3, v0, v2

    const/16 v2, 0x1597

    .line 5704
    const-string v3, "5528. envy v./n.\u7fa1\u6155,\u5fcc\u5992"

    aput-object v3, v0, v2

    const/16 v2, 0x1598

    .line 5705
    const-string v3, "5529. galaxy n.\u661f\u7cfb;(the Galaxy)\u94f6\u6cb3(\u7cfb);\u4e00\u7fa4\u663e\u8d6b\u7684\u4eba"

    aput-object v3, v0, v2

    const/16 v2, 0x1599

    .line 5706
    const-string v3, "5530. lazy a.\u61d2\u60f0\u7684,\u61d2\u6563\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x159a

    .line 5707
    const-string v3, "5531. crazy a.\u75af\u72c2\u7684,\u53e4\u602a\u7684,\u8822\u7684;(about)\u72c2\u70ed\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x159b

    .line 5708
    const-string v3, "5532. dizzy a.\u5934\u6655\u76ee\u7729\u7684,\u7729\u6655\u7684;(\u53ef\u80fd)\u4f7f\u4eba\u5934\u6655\u7684"

    aput-object v3, v0, v2

    const/16 v2, 0x159c

    .line 5709
    const-string v3, "5533. quiz n.\u5c0f\u578b\u8003\u8bd5,\u6d4b\u9a8c,\u95ee\u7b54\u6bd4\u8d5b"

    aput-object v3, v0, v2

    const/16 v2, 0x159d

    .line 5710
    const-string v3, "5534. quartz n.\u77f3\u82f1"

    aput-object v3, v0, v2

    const/16 v2, 0x159e

    .line 5711
    const-string v3, "5535. jazz n.\u7235\u58eb\u4e50"

    aput-object v3, v0, v2

    .line 5714
    .restart local v0       #array:[Ljava/lang/String;
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    .line 5715
    .local v1, lst:Ljava/util/List;,"Ljava/util/List<Ljava/lang/String;>;"
    invoke-static {v1}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    .line 5716
    invoke-interface {v1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p0

    .end local p0
    check-cast p0, [Ljava/lang/String;

    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .locals 5
    .parameter "savedInstanceState"

    .prologue
    .line 52
    invoke-super {p0, p1}, Landroid/app/Activity;->onCreate(Landroid/os/Bundle;)V

    .line 53
    const v3, 0x7f030001

    invoke-virtual {p0, v3}, Lcom/toni/android/english/englishword;->setContentView(I)V

    .line 55
    const/high16 v3, 0x7f05

    invoke-virtual {p0, v3}, Lcom/toni/android/english/englishword;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/admob/android/ads/AdView;

    .line 56
    .local v0, adView:Lcom/admob/android/ads/AdView;
    invoke-virtual {v0}, Lcom/admob/android/ads/AdView;->requestFreshAd()V

    .line 58
    const v3, 0x7f050001

    invoke-virtual {p0, v3}, Lcom/toni/android/english/englishword;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/ListView;

    .line 61
    .local v2, lv:Landroid/widget/ListView;
    new-instance v1, Landroid/widget/ArrayAdapter;

    const/high16 v3, 0x7f03

    invoke-virtual {p0}, Lcom/toni/android/english/englishword;->getWords()[Ljava/lang/String;

    move-result-object v4

    invoke-direct {v1, p0, v3, v4}, Landroid/widget/ArrayAdapter;-><init>(Landroid/content/Context;I[Ljava/lang/Object;)V

    .line 63
    .local v1, adapter:Landroid/widget/ArrayAdapter;,"Landroid/widget/ArrayAdapter<Ljava/lang/String;>;"
    invoke-virtual {v2, v1}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 64
    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setTextFilterEnabled(Z)V

    .line 65
    new-instance v3, Lcom/toni/android/english/englishword$1;

    invoke-direct {v3, p0}, Lcom/toni/android/english/englishword$1;-><init>(Lcom/toni/android/english/englishword;)V

    invoke-virtual {v2, v3}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 95
    return-void
.end method
