using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class CameraRotation : MonoBehaviour
{
    private float FirstMousePos;
    private float NowMousePos;

    void Start()
    {
        FirstMousePos = Input.mousePosition.x;
    }
    void Update()
    {
        NowMousePos = Input.mousePosition.x;
        transform.Rotate(new Vector3(0, (NowMousePos - FirstMousePos) * Time.deltaTime * 10, 0));
        FirstMousePos = NowMousePos;
    }
}
