using apiSmartAgriculture.Models;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Azure.WebJobs;
using Microsoft.Azure.WebJobs.Extensions.Http;
using Microsoft.Data.SqlClient;
using Microsoft.Extensions.Logging;
using System;
using System.Collections.Generic;
using System.Data;
using System.Threading.Tasks;
using System.Configuration;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Configuration.EnvironmentVariables;

namespace apiSmartAgriculture
{
    public static class SmartAgricultureAPI
    {
        [FunctionName("GetEdgeNodes")]
        public static async Task<IActionResult> GetEdgeNodes(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "edgeNodes")] HttpRequest req,
            ILogger log)
        {
            string Hostname = req.Query["hostname"];
            log.LogInformation("Hostname: " + Hostname);
            List<EdgeNode> edgeNodesList = new();
            DataTable dt = new();
            try
            {
                using SqlConnection connection = new(Environment.GetEnvironmentVariable("CONNECTIONSTRING"));
                string query = @"SELECT * FROM [edgeNode]";
                if (Hostname != null)
                {
                    query += $" WHERE [hostname] = '{Hostname}'";
                }
                log.LogInformation(query);
                connection.Open();
                SqlCommand command = new(query, connection);
                SqlDataAdapter da = new(command);
                await Task.Run(() => da.Fill(dt));
            }
            catch (Exception e)
            {
                log.LogError(e.ToString());
            }
            if (dt.Rows.Count == 0)
            {
                return new NotFoundResult();
            }
            //return new OkObjectResult(edgeNodesList);
            return new OkObjectResult(dt);
        }
        [FunctionName("GetEdgeNodesConfig")]
        public static async Task<IActionResult> GetEdgeNodesConfig(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "edgeNodes/{id}/config")] HttpRequest req,
            ILogger log, int id)
        {
            DataTable dt = new();
            try
            {
                using SqlConnection connection = new SqlConnection(Environment.GetEnvironmentVariable("ConnectionString"));

                string query = $"EXEC getEdgeNodeConfig @edgeNodeID ='{id}'";
                log.LogInformation(query);
                connection.Open();
                SqlCommand command = new(query, connection);
                SqlDataAdapter da = new(command);
                await Task.Run(() => da.Fill(dt));
            }
            catch (Exception e)
            {
                log.LogError(e.ToString());
            }
            if (dt.Rows.Count == 0)
            {
                return new NotFoundResult();
            }
            return new OkObjectResult(dt);
        }

        [FunctionName("GetActuatorsFromPlantationID")]
        public static async Task<IActionResult> GetActuatorsFromPlantationID(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "plantation/{id}/actuators")] HttpRequest req, ILogger log, int id)
        {
            DataTable dt = new();
            try
            {
                using SqlConnection connection = new(Environment.GetEnvironmentVariable("ConnectionString"));
                string query = $"EXEC getActuatorsFromPlantationID @plantationID = '{id}'";
                log.LogInformation(query);
                connection.Open(); 
                SqlCommand command = new(query, connection);
                SqlDataAdapter da = new(command);
                await Task.Run(() => da.Fill(dt));
            }
            catch (Exception e)
            {
                log.LogError(e.ToString());
            }
            if (dt.Rows.Count == 0)
            {
                return new NotFoundResult();
            }
            return new OkObjectResult(dt);
        }

        [FunctionName("GetMqttConnectionFromPlantationID")]
        public static async Task<IActionResult> GetMqttConnectionFromPlantationID(
            [HttpTrigger(AuthorizationLevel.Anonymous, "get", Route = "plantation/{id}/mqtt")] HttpRequest req, ILogger log, int id)
        {
            DataTable dt = new();
            try
            {
                using SqlConnection connection = new(Environment.GetEnvironmentVariable("ConnectionString"));
                string query = $"EXEC getMQTTConnectionFromPlantationID @plantationID = '{id}'";
                log.LogInformation(query);
                connection.Open();
                SqlCommand command = new(query, connection);
                SqlDataAdapter da = new(command);
                await Task.Run(() => da.Fill(dt));
            }
            catch (Exception e)
            {
                log.LogError(e.ToString());
            }
            if (dt.Rows.Count == 0)
            {
                return new NotFoundResult();
            }
            return new OkObjectResult(dt);
        }
    }
}
