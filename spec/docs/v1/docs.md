

# Group Comments


## Comments [/comments]


### Get all comments [GET /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/1/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
            
              ]
            }

### Create a comment [POST /api/v1/tasks/{task_id}/comments]

+ Parameters
    + task_id: `57` (integer, required)
    + body: `etaliquidtemporeharumveniam` (string, required)
    + image: `ActionDispatch%3A%3AHttp%3A%3AUploadedFile` (image, optional)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/tasks/4/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=nequehicexpeditaaliasculpapariatursitetautofficiis

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "4",
                "type": "comment",
                "attributes": {
                  "body": "maximenequeidquamnon",
                  "image": {
                    "name": "image",
                    "record": {
                      "task_id": 4,
                      "body": "maximenequeidquamnon",
                      "id": 4,
                      "created_at": "2019-09-03T11:43:11.622Z",
                      "updated_at": "2019-09-03T11:43:11.624Z"
                    },
                    "dependent": "purge_later"
                  }
                },
                "relationships": {
                  "task": {
                    "data": {
                      "id": "4",
                      "type": "task"
                    }
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/tasks/7/comments`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            comment[body]=123

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "comments.body": [
                  "is too short (minimum is 10 characters)"
                ]
              }
            }

### Destroy the comment [DELETE /api/v1/comments/{id}]

+ Parameters
    + id: `57` (integer, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/comments/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/comments/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: text/html

# Group Projects


## Projects [/projects]


### Get all projects [GET /api/v1/projects]


+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "project",
                  "attributes": {
                    "name": "est"
                  },
                  "relationships": {
                    "user": {
                      "data": {
                        "id": "2",
                        "type": "user"
                      }
                    },
                    "tasks": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show project [GET /api/v1/projects/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "project",
                "attributes": {
                  "name": "qui"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "4",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html

### Create a project [POST /api/v1/projects]

+ Parameters
    + name: `modialias` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=explicaboquisquam

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "project",
                "attributes": {
                  "name": "explicaboquisquam"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "8",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the project [PUT /api/v1/projects/{id}]

+ Parameters
    + id: `61` (integer, required)
    + name: `magnamaliquam` (string, required)

+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/projects/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]=sedamet

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "project",
                "attributes": {
                  "name": "sedamet"
                },
                "relationships": {
                  "user": {
                    "data": {
                      "id": "12",
                      "type": "user"
                    }
                  },
                  "tasks": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PUT**&nbsp;&nbsp;`/api/v1/projects/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            project[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Destroy project [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `9` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/9`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request not_found
**DELETE**&nbsp;&nbsp;`/api/v1/projects/999`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: text/html

###  [DELETE /api/v1/projects/{id}]

+ Parameters
    + id: `11` (number, required)

+ Request success
**DELETE**&nbsp;&nbsp;`/api/v1/projects/11`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 403

    + Headers

            Content-Type: text/html

# Group Registrations


## Registrations [/registrations]


### Create user [POST /api/v1/auth/registrations]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)
    + password_confirmation: `elpsykongru` (string, required)

+ Request created
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]=vitaeut&user[password]=1KdJ2p4e7By_AYlo&user[password_confirmation]=1KdJ2p4e7By_AYlo

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "O7GbYsrtXuQpxA2aa8w076S106DrXrfoB59x3FHNehXkK+X8fht2vwtkIFSqYRPq1vyQlmlCbiRPTCGkMkI/uA=="
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/auth/registrations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            user[username]&user[password]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "username": [
                  "can't be blank",
                  "is too short (minimum is 3 characters)"
                ],
                "password": [
                  "can't be blank",
                  "is too short (minimum is 8 characters)"
                ]
              }
            }

# Group Sessions


## Sessions [/sessions]


### Update session [PUT /api/v1/auth/sessions]


+ Request success
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "/NndwNRNJTAErhNvOalxm+hjuE+3ygza0CKtOlipWnydMSztKFhSRq6y83hTLEPU6C3iWTSEjHlLSPF05+ZhNg=="
            }

+ Request unauthorized
**PUT**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Unathorized"
            }

### Create session [POST /api/v1/auth/sessions]

+ Parameters
    + username: `hooin_k%D1%91ma` (string, required)
    + password: `elpsykongru` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=quisvoluptas&password=1KdJ2p4e7By_AYlo

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "csrf": "6ddlymS7lkyiTUXhIBr3CMAAB67IGPTJNIBTPJrv7343y3z4xJGMcpEVwltv5hSuc8M8gEnAMHDzZuW3wSaPug=="
            }

+ Request not_found
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=ctsimiaepiadptu&password=1KdJ2p4e7By_AYlo

+ Response 404

    + Headers

            Content-Type: text/html

+ Request unauthorized
**POST**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            username=eligendiconsequatur&password=

+ Response 401

    + Headers

            Content-Type: text/html

### Destroy session [DELETE /api/v1/auth/sessions]


+ Request no_content
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request unathorized
**DELETE**&nbsp;&nbsp;`/api/v1/auth/sessions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 401

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": "Unathorized"
            }

# Group Tasks


## Tasks [/tasks]


### Update state of a task [PATCH /api/v1/tasks/{task_id}/completions]

+ Parameters
    + task_id: `1` (number, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "odit",
                  "deadline": null,
                  "position": 2,
                  "completed": true
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/completions`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: text/html

### Update postition of a task [PATCH /api/v1/tasks/{task_id}/prioritizations]

+ Parameters
    + task_id: `29` (integer, required)
    + position: `2` (integer, required)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/1/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=3

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "1",
                "type": "task",
                "attributes": {
                  "name": "maiores",
                  "deadline": null,
                  "position": 3,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "2",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888/prioritizations`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[position]=3

+ Response 404

    + Headers

            Content-Type: text/html

### Get all tasks [GET /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/projects/2/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": [
                {
                  "id": "1",
                  "type": "task",
                  "attributes": {
                    "name": "reprehenderit",
                    "deadline": null,
                    "position": 1,
                    "completed": false
                  },
                  "relationships": {
                    "project": {
                      "data": {
                        "id": "2",
                        "type": "project"
                      }
                    },
                    "comments": {
                      "data": [
            
                      ]
                    }
                  }
                }
              ]
            }

### Show task [GET /api/v1/tasks/{id}]

+ Parameters
    + id: `2` (number, required)

+ Request success
**GET**&nbsp;&nbsp;`/api/v1/tasks/2`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "2",
                "type": "task",
                "attributes": {
                  "name": "illo",
                  "deadline": null,
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "4",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request not_found
**GET**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5

+ Response 404

    + Headers

            Content-Type: text/html

### Create a task [POST /api/v1/projects/{project_id}/tasks]

+ Parameters
    + project_id: `29` (integer, required)
    + name: `animiassumenda` (string, required)

+ Request success
**POST**&nbsp;&nbsp;`/api/v1/projects/8/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=undeest

+ Response 201

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "5",
                "type": "task",
                "attributes": {
                  "name": "undeest",
                  "deadline": null,
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "8",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**POST**&nbsp;&nbsp;`/api/v1/projects/10/tasks`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

### Update the task [PATCH /api/v1/tasks/{id}]

+ Parameters
    + id: `29` (integer, required)
    + name: `consequaturet` (string, required)
    + deadline: `2019-09-10+11%3A43%3A10+UTC` (datetime, optional)

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/7`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=perferendisconsequatur

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "7",
                "type": "task",
                "attributes": {
                  "name": "perferendisconsequatur",
                  "deadline": null,
                  "position": 1,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "12",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request success
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/8`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[deadline]=2019-09-10

+ Response 200

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "data": {
                "id": "8",
                "type": "task",
                "attributes": {
                  "name": "optio",
                  "deadline": "2019-09-10",
                  "position": 2,
                  "completed": false
                },
                "relationships": {
                  "project": {
                    "data": {
                      "id": "14",
                      "type": "project"
                    }
                  },
                  "comments": {
                    "data": [
            
                    ]
                  }
                }
              }
            }

+ Request unprocessable
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/9`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "name": [
                  "can't be blank"
                ]
              }
            }

+ Request unprocessable
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/10`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[deadline]=2019-08-27

+ Response 422

    + Headers

            Content-Type: application/json; charset=utf-8

    + Body

            {
              "errors": {
                "deadline": [
                  "Can't be in the past"
                ]
              }
            }

+ Request when not_found
**PATCH**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

    + Body

            task[name]=sequisint&task[deadline]=2019-09-10

+ Response 404

    + Headers

            Content-Type: text/html

### Destroy task [DELETE /api/v1/tasks/{id}]

+ Parameters
    + id: `12` (number, required)

+ Request when success
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/12`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 204

+ Request when not_found
**DELETE**&nbsp;&nbsp;`/api/v1/tasks/888`

    + Headers

            Accept: text/xml,application/xml,application/xhtml+xml,text/html;q=0.9,text/plain;q=0.8,image/png,*/*;q=0.5
            Content-Type: application/x-www-form-urlencoded

+ Response 404

    + Headers

            Content-Type: text/html
